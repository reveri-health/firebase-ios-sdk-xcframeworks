#!/bin/bash
# Runs package.sh with skip-release against fixture releases, with gh, git, curl and swift stubbed. Needs macOS.
# Usage: .scripts/tests/package_test.sh [package.sh to test]

tests_dir=$(cd "$(dirname "$0")" && pwd)
script=${1:-$tests_dir/../package.sh}

xcframework () {
    # Ex. xcframework "$root/GoogleSignIn" GoogleSignIn 9.0.0
    local framework="$1/$2.xcframework/ios-arm64/$2.framework"
    mkdir -p "$framework"
    touch "$framework/$2"
    printf '<?xml version="1.0" encoding="UTF-8"?>\n<plist version="1.0"><dict><key>CFBundleShortVersionString</key><string>%s</string></dict></plist>\n' "$3" > "$framework/Info.plist"
}

release () {
    # Ex. release 12.19.3 12.19.0 GoogleSignIn = upstream tag 12.19.3 with FirebaseCore 12.19.0 and GoogleSignIn
    local tag=$1 core=$2
    shift 2
    local root="$case_dir/build/$tag/Firebase"
    mkdir -p "$root" "$case_dir/releases/$tag"
    touch "$root/Firebase.h" "$root/module.modulemap"
    xcframework "$root/FirebaseAnalytics" FirebaseCore "$core"
    for product in "$@"; do xcframework "$root/$product" "$product" 1.0.0; done
    (cd "$case_dir/build/$tag" && zip -ryq "$case_dir/releases/$tag/Firebase.zip" Firebase)
}

manifest () {
    # Ex. manifest 12.19.1 GoogleSignIn = Package.swift of our tag 12.19.1 with the GoogleSignIn product
    local tag=$1
    shift
    mkdir -p "$case_dir/manifests/$tag"
    for product in "$@"; do
        printf '    .library(\n      name: "%s",\n      targets: ["%sTarget"]\n    ),\n' "$product" "$product"
    done > "$case_dir/manifests/$tag/Package.swift"
}

defaults () {
    # Upstream published the 12.19.3 backport after 13.1.1, which stays marked Latest
    export STUB_DIR=$case_dir STUB_FIREBASE_NEWEST=12.19.3 STUB_FIREBASE_LATEST=13.1.1 STUB_CURRENT=12.19.1 STUB_TAGS="12.19.1 13.1.1"
    release 13.1.1 13.1.1
    manifest 12.19.1 FirebaseAnalytics GoogleSignIn
}

run_package () {
    mkdir -p "$case_dir/repo/.scripts"
    cp "$script" "$case_dir/repo/.scripts/package.sh"
    cp "$tests_dir/../package_template.swift" "$case_dir/repo/.scripts/"
    # Any argument also turns on debug, whose exit trap waits for Enter
    (cd "$case_dir/repo/.scripts" && PATH="$tests_dir/bin:$PATH" sh ./package.sh skip-release <<< "" > "$case_dir/output.log" 2>&1)
    status=$?
}

expect_success () {
    if [[ $status -ne 0 ]]; then echo "package.sh exited $status"; return 1; fi
}

expect_failure () {
    if [[ $status -eq 0 ]]; then echo "package.sh succeeded"; return 1; fi
    if ! grep -qF "$1" "$case_dir/output.log"; then echo "output lacks \"$1\""; return 1; fi
}

expect_text () {
    if ! grep -qF "$2" "$case_dir/$1"; then echo "$1 lacks \"$2\""; return 1; fi
}

test_downloads_the_release_the_version_names () {
    release 12.19.3 12.19.3 GoogleSignIn
    run_package
    expect_success &&
        expect_text calls.log "gh release download 12.19.3" &&
        expect_text repo/Package.swift 'name: "GoogleSignIn"'
}

test_accepts_firebase_core_at_an_earlier_patch () {
    release 12.19.3 12.19.0 GoogleSignIn
    run_package
    expect_success
}

test_stops_when_the_zip_has_another_firebase_version () {
    release 12.19.3 13.1.1 GoogleSignIn
    run_package
    expect_failure "contains FirebaseCore 13.1.1, expected 12.19.3"
}

test_stops_when_a_product_is_dropped () {
    release 12.19.3 12.19.3
    run_package
    expect_failure "missing from 12.19.3: GoogleSignIn"
}

test_skips_the_product_check_for_a_new_major () {
    export STUB_FIREBASE_NEWEST=13.1.1
    run_package
    expect_success
}

test_stops_when_the_tag_lookup_fails () {
    export STUB_LS_REMOTE_FAILS=1
    release 12.19.3 12.19.3
    run_package
    expect_failure "Could not list the tags"
}

test_stops_when_the_previous_manifest_is_unavailable () {
    export STUB_TAGS="12.19.1 12.19.2"
    release 12.19.3 12.19.3
    run_package
    expect_failure "error: 404"
}

test_keeps_framework_symlinks_in_the_local_build () {
    release 12.19.3 12.19.3 GoogleSignIn
    local framework="$case_dir/build/12.19.3/Firebase/FirebaseAnalytics/FirebaseCore.xcframework/macos-arm64_x86_64/FirebaseCore.framework"
    mkdir -p "$framework/Versions/A"
    touch "$framework/Versions/A/FirebaseCore"
    ln -s A "$framework/Versions/Current"
    ln -s Versions/Current/FirebaseCore "$framework/FirebaseCore"
    (cd "$case_dir/build/12.19.3" && zip -ryq "$case_dir/releases/12.19.3/Firebase.zip" Firebase)
    run_package
    expect_success
}

test_accepts_a_manifest_larger_than_the_pipe_buffer () {
    export STUB_MANIFEST_LINES=10000
    release 12.19.3 12.19.3 GoogleSignIn
    run_package
    expect_success
}

test_stops_on_an_invalid_manifest () {
    export STUB_MANIFEST_INVALID=1
    release 12.19.3 12.19.3 GoogleSignIn
    run_package
    expect_failure "error: Invalid manifest"
}

tests=(
    test_downloads_the_release_the_version_names
    test_accepts_firebase_core_at_an_earlier_patch
    test_stops_when_the_zip_has_another_firebase_version
    test_stops_when_a_product_is_dropped
    test_skips_the_product_check_for_a_new_major
    test_stops_when_the_tag_lookup_fails
    test_stops_when_the_previous_manifest_is_unavailable
    test_keeps_framework_symlinks_in_the_local_build
    test_accepts_a_manifest_larger_than_the_pipe_buffer
    test_stops_on_an_invalid_manifest
)
failures=0
for test in "${tests[@]}"; do
    case_dir=$(mktemp -d)
    if result=$(defaults && $test); then
        echo "ok   $test"
    else
        echo "FAIL $test: $result"
        tail -3 "$case_dir/output.log" | sed 's/^/     | /'
        failures=$((failures + 1))
    fi
    rm -rf "$case_dir"
done
echo "$((${#tests[@]} - failures)) passed, $failures failed"
[[ $failures -eq 0 ]]

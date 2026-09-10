// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Firebase",
  platforms: [.iOS(.v11), .macOS(.v10_12), .tvOS(.v12), .watchOS(.v7)],
  products: [
    .library(
      name: "FirebaseABTesting",
      targets: ["FirebaseABTestingTarget"]
    ),
    .library(
      name: "FirebaseAILogic",
      targets: ["FirebaseAILogicTarget"]
    ),
    .library(
      name: "FirebaseAnalytics",
      targets: ["FirebaseAnalyticsTarget"]
    ),
    .library(
      name: "FirebaseAppCheck",
      targets: ["FirebaseAppCheckTarget"]
    ),
    .library(
      name: "FirebaseAppDistribution",
      targets: ["FirebaseAppDistributionTarget"]
    ),
    .library(
      name: "FirebaseAuth",
      targets: ["FirebaseAuthTarget"]
    ),
    .library(
      name: "FirebaseCrashlytics",
      targets: ["FirebaseCrashlyticsTarget"]
    ),
    .library(
      name: "FirebaseDatabase",
      targets: ["FirebaseDatabaseTarget"]
    ),
    .library(
      name: "FirebaseFirestore",
      targets: ["FirebaseFirestoreTarget"]
    ),
    .library(
      name: "FirebaseFunctions",
      targets: ["FirebaseFunctionsTarget"]
    ),
    .library(
      name: "FirebaseInAppMessaging",
      targets: ["FirebaseInAppMessagingTarget"]
    ),
    .library(
      name: "FirebaseMessaging",
      targets: ["FirebaseMessagingTarget"]
    ),
    .library(
      name: "FirebaseMLModelDownloader",
      targets: ["FirebaseMLModelDownloaderTarget"]
    ),
    .library(
      name: "FirebasePerformance",
      targets: ["FirebasePerformanceTarget"]
    ),
    .library(
      name: "FirebaseRemoteConfig",
      targets: ["FirebaseRemoteConfigTarget"]
    ),
    .library(
      name: "FirebaseStorage",
      targets: ["FirebaseStorageTarget"]
    ),
    .library(
      name: "GoogleSignIn",
      targets: ["GoogleSignInTarget"]
    )
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "Firebase",
      publicHeadersPath: "./"
    ),
    .target(
      name: "FirebaseABTestingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseABTesting"
      ],
      path: "Sources/FirebaseABTesting"
    ),
    .target(
      name: "FirebaseAILogicTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_AppCheckCore",
        "_FirebaseAILogic",
        "_FirebaseAppCheck",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        "_Promises",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAILogic"
    ),
    .target(
      name: "FirebaseAnalyticsTarget",
      dependencies: [
        "Firebase",
        "_FBLPromises",
        "_FirebaseAnalytics",
        "_FirebaseCore",
        "_FirebaseCoreInternal",
        "_FirebaseInstallations",
        .target(name: "_GoogleAdsOnDeviceConversion", condition: .when(platforms: [.iOS])),
        "_GoogleAppMeasurement",
        "_GoogleAppMeasurementIdentitySupport",
        "_GoogleUtilities",
        "_nanopb"
      ],
      path: "Sources/FirebaseAnalytics"
    ),
    .target(
      name: "FirebaseAppCheckTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_AppCheckCore",
        "_FirebaseAppCheck",
        "_FirebaseAppCheckInterop",
        "_Promises",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAppCheck"
    ),
    .target(
      name: "FirebaseAppDistributionTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_FirebaseAppDistribution", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAppDistribution"
    ),
    .target(
      name: "FirebaseAuthTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuth",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        "_GTMSessionFetcher",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAuth"
    ),
    .target(
      name: "FirebaseCrashlyticsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseCoreExtension",
        "_FirebaseCrashlytics",
        "_FirebaseRemoteConfigInterop",
        "_FirebaseSessions",
        "_GoogleDataTransport",
        "_Promises"
      ],
      path: "Sources/FirebaseCrashlytics",
      exclude: [
        "run",
        "upload-symbols"
      ]
    ),
    .target(
      name: "FirebaseDatabaseTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseDatabase",
        "_FirebaseSharedSwift",
        "_leveldb"
      ],
      path: "Sources/FirebaseDatabase"
    ),
    .target(
      name: "FirebaseFirestoreTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_absl",
        "_FirebaseAppCheckInterop",
        "_FirebaseCoreExtension",
        "_FirebaseFirestore",
        "_FirebaseFirestoreInternal",
        "_FirebaseSharedSwift",
        "_grpc",
        "_grpcpp",
        "_leveldb",
        "_openssl_grpc"
      ],
      path: "Sources/FirebaseFirestore"
    ),
    .target(
      name: "FirebaseFunctionsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        "_FirebaseFunctions",
        "_FirebaseMessagingInterop",
        "_FirebaseSharedSwift",
        "_GTMSessionFetcher"
      ],
      path: "Sources/FirebaseFunctions"
    ),
    .target(
      name: "FirebaseInAppMessagingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseABTesting",
        .target(name: "_FirebaseInAppMessaging", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseInAppMessaging"
    ),
    .target(
      name: "FirebaseMessagingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseMessaging",
        "_GoogleDataTransport"
      ],
      path: "Sources/FirebaseMessaging"
    ),
    .target(
      name: "FirebaseMLModelDownloaderTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseCoreExtension",
        "_FirebaseMLModelDownloader"
      ],
      path: "Sources/FirebaseMLModelDownloader"
    ),
    .target(
      name: "FirebasePerformanceTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseABTesting",
        "_FirebaseCoreExtension",
        .target(name: "_FirebasePerformance", condition: .when(platforms: [.iOS, .tvOS])),
        "_FirebaseRemoteConfig",
        "_FirebaseRemoteConfigInterop",
        "_FirebaseSessions",
        "_FirebaseSharedSwift",
        "_GoogleDataTransport",
        "_Promises"
      ],
      path: "Sources/FirebasePerformance"
    ),
    .target(
      name: "FirebaseRemoteConfigTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseABTesting",
        "_FirebaseRemoteConfig",
        "_FirebaseRemoteConfigInterop",
        "_FirebaseSharedSwift"
      ],
      path: "Sources/FirebaseRemoteConfig"
    ),
    .target(
      name: "FirebaseStorageTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        "_FirebaseStorage",
        "_GTMSessionFetcher"
      ],
      path: "Sources/FirebaseStorage"
    ),
    .target(
      name: "GoogleSignInTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_AppAuth", condition: .when(platforms: [.iOS])),
        "_AppCheckCore",
        .target(name: "_GoogleSignIn", condition: .when(platforms: [.iOS])),
        .target(name: "_GTMAppAuth", condition: .when(platforms: [.iOS])),
        "_GTMSessionFetcher",
        "_Promises",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_absl.xcframework.zip",
      checksum: "2b59e0d67380c3de5db15420f5ecff77d5f20a78c841bf1f4a3ced57b386c282"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_AppAuth.xcframework.zip",
      checksum: "dbf74b757b42eee89fd3271918973dc81cee1f31803ff5610a395468ced4efb4"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_AppCheckCore.xcframework.zip",
      checksum: "2ea9e5a81826b5a05b68203bb1c2c91485a80cbdf9a532d49bc84070d3012bc7"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FBLPromises.xcframework.zip",
      checksum: "14a65fc72962c5aeb733fcc279ce19d7b2558f48c7d3cfe54f80fd973ea6042f"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseABTesting.xcframework.zip",
      checksum: "84308e02fe816c9050d8785ff20ac52184d8e85e5ad28ded81c639d132590f2e"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseAILogic.xcframework.zip",
      checksum: "94979ef21121e4e647ff91b570e436fdeb092ca79fc88aeb70665c63d8815278"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseAnalytics.xcframework.zip",
      checksum: "8e17867c55baae21671e15da853413e9660ec43ac42f8a4eef7e4ba9c9673654"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseAppCheck.xcframework.zip",
      checksum: "fe87c6699ce0e75768fddb7991aab5e87fb1e06542d13f62cd918fae05067a67"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "fd671a4c241b5154375b1dbfa3fc6b695e01bd15d653a47e0f706fe87c61ee54"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseAppDistribution.xcframework.zip",
      checksum: "eb17f2bf2d508dee128e305fd113894ad8d56ad70f804efc619d7fc4dd487325"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseAuth.xcframework.zip",
      checksum: "b16f02fd747955e89893c47c54372e7b5f379fc1ed18100f06f994cdc7d681ed"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseAuthInterop.xcframework.zip",
      checksum: "458422789aab80329514b2e7d03c64b0e090dd7b3176474f405fb65af44ea622"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseCore.xcframework.zip",
      checksum: "415d97ad438d8be94c929eb984afa2ebce30a7a85f0b020b7bc98b1feec359e1"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseCoreExtension.xcframework.zip",
      checksum: "820ddbc0c7d11f7a46fbcf5bb64266bf290a9f2108770346f4cd09d80e12c058"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseCoreInternal.xcframework.zip",
      checksum: "d1f820779f544d7393a8abc1b731000ae61ce718fd0ccffc8eb47bc1311aab5b"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseCrashlytics.xcframework.zip",
      checksum: "7b0230543b72f86ae549d4438b8c2034f2f3abc14961e9a2f6d23a70f16ca6d4"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseDatabase.xcframework.zip",
      checksum: "6fc03cfcd85ea99806e4bc17dfc8e0dcd1f71b6d5fbc9492de62b3ed56a55444"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseFirestore.xcframework.zip",
      checksum: "7cd2babdde98f9d28ade2aec9d10d0a3a5a79c048fdb1e93b19e2de26a2eefe6"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "b84e0ba14c73ca21ea674e9f04f6cd674fcda2ca2f13d469d572cafa94c29366"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseFunctions.xcframework.zip",
      checksum: "99649f4e241eedf2556ef694e4e06278081b494ab4b41b7843a5b9f5daa101ff"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "8f7fb0a1b11d37c0d774c443d2aab9eba8a42f477a1a00c967809d3867cb5215"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseInstallations.xcframework.zip",
      checksum: "bae8b0930dfd4e2a8bef7c3f8f1b7147f59f58d84e890d2913d6352fe2b8f842"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseMessaging.xcframework.zip",
      checksum: "3632732af0443121a4b785f1c48ad3b43768354464fdd5b7eb79402406429aeb"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "aa38902488d954a22ecbe0abb0907163a8b644087c54390a67cef91ccb848309"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "6bc3fcf54c412cf188d52a81472a1e476827613c1da49dbd46535363eb932b4f"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebasePerformance.xcframework.zip",
      checksum: "1906005e2b21fa908aa3ae21208566fbe3ee0a5b3d284fb4a7804dae8501ecb3"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "1e1824ef56732f2b1cccd582bb660a8d087486de5bb7d6841b90608914b13481"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "ed605029ce526f947f09283bdb28b6820a4b8974470ad6a76ea0e9ba17d495c5"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseSessions.xcframework.zip",
      checksum: "da1a5e55e4d125eebf8af3e6b890ce32bd5b7dd1f9bd69ba99d965bf8ad6bdcb"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseSharedSwift.xcframework.zip",
      checksum: "ecb0aff6b2d4e5f365ccf0d392c8eab69f7f7172ade8211096ca77831011beaa"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseStorage.xcframework.zip",
      checksum: "eab850f8a415cacc608e38e4f0faaa50d3d2adb7865227487af4ff2c20f1f1bc"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "53f5409b716b436cf0b3e01ac09d92160fe853a06786ab7aeb6f97906095492e"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_GoogleAppMeasurement.xcframework.zip",
      checksum: "537bb9fcf00bb16e23de23cd0c0b7dfe01cef45eba83c299a9674b0b489b3e37"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "c965d7153ec409836b0f19dcf0676962a932266d36704a5584778421707c0be5"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_GoogleDataTransport.xcframework.zip",
      checksum: "ed5dcb68331ee3f5c6ed627e711cbb24769ccf0e220e264a167329cb6bdd1e5a"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_GoogleSignIn.xcframework.zip",
      checksum: "c8897f7d42c83dcd80f1124a0964235be3f6c9e31a93e69542a98a77d14cc3a7"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_GoogleUtilities.xcframework.zip",
      checksum: "13fd50a9b249661530faf0852cf4bf2847f1f96ba5cb8d7ee5420309ca8cb760"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_grpc.xcframework.zip",
      checksum: "ff0a5041f7cb99f4493c73e790bb89ebc9cb3d77281bb8ac9200fdc8a71afdd4"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_grpcpp.xcframework.zip",
      checksum: "778f4fd34c3cfeabacd20ee9faa41f5920a0a7dda4f0a469eb377061f3b3cf80"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_GTMAppAuth.xcframework.zip",
      checksum: "71a63b2a0a1f8852e2c775a7f6c5f68ae65d68ebfaddbc8ea373d2a931ae6514"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_GTMSessionFetcher.xcframework.zip",
      checksum: "38be5226dda558caa3e43b13b242c1bdaaa851ad15b7f0063c1372fd4844aad9"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_leveldb.xcframework.zip",
      checksum: "26740803a90060d707ca217f5f45765d37cbb730c3371c84b00fe78f4a0cbc03"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_nanopb.xcframework.zip",
      checksum: "b34af50cd9f8a0873a44aa563bc43cef61d57aa87e63ee854368fdabc1861332"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_openssl_grpc.xcframework.zip",
      checksum: "6f389b376f76981f9281071d9ac797887f8702c32b92a063f33b80e446b3b48b"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_Promises.xcframework.zip",
      checksum: "a502ee93ca0340e4a1a0a160d2a736a661f00443331f57808ca07030bb40551a"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_RecaptchaInterop.xcframework.zip",
      checksum: "47d2f91fdec2aff4a7a6d74178528e85abec88ee244ffe0b6ee61f70f7e0e7f2"
    )
  ]
)
    
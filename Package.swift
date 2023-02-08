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
      name: "FirebaseAnalytics",
      targets: ["FirebaseAnalyticsTarget"]
    ),
    .library(
      name: "FirebaseAnalyticsOnDeviceConversion",
      targets: ["FirebaseAnalyticsOnDeviceConversionTarget"]
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
      name: "FirebaseDynamicLinks",
      targets: ["FirebaseDynamicLinksTarget"]
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
      name: "FirebaseMLModelDownloader",
      targets: ["FirebaseMLModelDownloaderTarget"]
    ),
    .library(
      name: "FirebaseMessaging",
      targets: ["FirebaseMessagingTarget"]
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
      name: "Google-Mobile-Ads-SDK",
      targets: ["Google-Mobile-Ads-SDKTarget"]
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
        "FirebaseABTesting"
      ],
      path: "Sources/FirebaseABTesting"
    ),
    .target(
      name: "FirebaseAnalyticsTarget",
      dependencies: [
        "Firebase",
        "FBLPromises",
        "FirebaseAnalytics",
        "FirebaseAnalyticsSwift",
        "FirebaseCore",
        "FirebaseCoreInternal",
        "FirebaseInstallations",
        "GoogleAppMeasurement",
        "GoogleAppMeasurementIdentitySupport",
        "GoogleUtilities",
        "nanopb"
      ],
      path: "Sources/FirebaseAnalytics"
    ),
    .target(
      name: "FirebaseAnalyticsOnDeviceConversionTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "FirebaseAnalyticsOnDeviceConversion", condition: .when(platforms: [.iOS])),
        .target(name: "GoogleAppMeasurementOnDeviceConversion", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAnalyticsOnDeviceConversion"
    ),
    .target(
      name: "FirebaseAppCheckTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseAppCheck"
      ],
      path: "Sources/FirebaseAppCheck"
    ),
    .target(
      name: "FirebaseAppDistributionTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "FirebaseAppDistribution", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAppDistribution"
    ),
    .target(
      name: "FirebaseAuthTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseAuth",
        "GTMSessionFetcher"
      ],
      path: "Sources/FirebaseAuth"
    ),
    .target(
      name: "FirebaseCrashlyticsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseCrashlytics",
        "GoogleDataTransport"
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
        "FirebaseDatabase",
        "FirebaseDatabaseSwift",
        "FirebaseSharedSwift",
        "leveldb-library"
      ],
      path: "Sources/FirebaseDatabase"
    ),
    .target(
      name: "FirebaseDynamicLinksTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "FirebaseDynamicLinks", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseDynamicLinks"
    ),
    .target(
      name: "FirebaseFirestoreTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "BoringSSL-GRPC",
        "FirebaseCoreExtension",
        "FirebaseFirestore",
        "FirebaseFirestoreSwift",
        "FirebaseSharedSwift",
        "Libuv-gRPC",
        "abseil",
        "gRPC-C++",
        "gRPC-Core",
        "leveldb-library"
      ],
      path: "Sources/FirebaseFirestore",
      resources: [
        .process("Resources/gRPCCertificates-Cpp.bundle")
      ]
    ),
    .target(
      name: "FirebaseFunctionsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseAppCheckInterop",
        "FirebaseAuthInterop",
        "FirebaseCoreExtension",
        "FirebaseFunctions",
        "FirebaseMessagingInterop",
        "FirebaseSharedSwift",
        "GTMSessionFetcher"
      ],
      path: "Sources/FirebaseFunctions"
    ),
    .target(
      name: "FirebaseInAppMessagingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseABTesting",
        .target(name: "FirebaseInAppMessaging", condition: .when(platforms: [.iOS])),
        .target(name: "FirebaseInAppMessagingSwift", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseInAppMessaging",
      resources: [
        .process("Resources/InAppMessagingDisplayResources.bundle")
      ]
    ),
    .target(
      name: "FirebaseMLModelDownloaderTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseMLModelDownloader",
        "GoogleDataTransport",
        "SwiftProtobuf"
      ],
      path: "Sources/FirebaseMLModelDownloader"
    ),
    .target(
      name: "FirebaseMessagingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseMessaging",
        "GoogleDataTransport"
      ],
      path: "Sources/FirebaseMessaging"
    ),
    .target(
      name: "FirebasePerformanceTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseABTesting",
        .target(name: "FirebasePerformance", condition: .when(platforms: [.iOS, .tvOS])),
        "FirebaseRemoteConfig",
        "GoogleDataTransport"
      ],
      path: "Sources/FirebasePerformance"
    ),
    .target(
      name: "FirebaseRemoteConfigTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseABTesting",
        "FirebaseRemoteConfig",
        "FirebaseRemoteConfigSwift",
        "FirebaseSharedSwift"
      ],
      path: "Sources/FirebaseRemoteConfig"
    ),
    .target(
      name: "FirebaseStorageTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseAppCheckInterop",
        "FirebaseAuthInterop",
        "FirebaseCoreExtension",
        "FirebaseStorage",
        "GTMSessionFetcher"
      ],
      path: "Sources/FirebaseStorage"
    ),
    .target(
      name: "Google-Mobile-Ads-SDKTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "GoogleMobileAds", condition: .when(platforms: [.iOS])),
        .target(name: "UserMessagingPlatform", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/Google-Mobile-Ads-SDK"
    ),
    .target(
      name: "GoogleSignInTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "AppAuth", condition: .when(platforms: [.iOS])),
        .target(name: "GTMAppAuth", condition: .when(platforms: [.iOS])),
        "GTMSessionFetcher",
        .target(name: "GoogleSignIn", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn",
      resources: [
        .process("Resources/GoogleSignIn.bundle")
      ]
    ),
    .binaryTarget(
      name: "AppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/AppAuth.xcframework.zip",
      checksum: "5e95e79935a157f7154478045e65571a6770027dd79b98e6cdf71a3d8bf06b65"
    ),
    .binaryTarget(
      name: "BoringSSL-GRPC",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/BoringSSL-GRPC.xcframework.zip",
      checksum: "7dafaa7e1a918a07a94109b087188c554f65d08809c3c838df71759322b41dda"
    ),
    .binaryTarget(
      name: "FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/FBLPromises.xcframework.zip",
      checksum: "82114a906a2f4483bafbbf40ac2b212ed35c0cc9596663df000629d73c2df924"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/FirebaseABTesting.xcframework.zip",
      checksum: "73d8e6b01501a261ac4b5975b417b27716617bbda6665dbc0fff2f2975a9122d"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/FirebaseAnalytics.xcframework.zip",
      checksum: "dc89e64dfe173ef15f705fdb51e50ce8098a346a4acfbd3e3ac19705308636ef"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "f3fc223a822d551311e0e63d8d4e075c067d9ad29c5a0e8ad0e784de6e365e4b"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "7a859f5db3bdd0857bca1f26628542a201746184efa0150c141d6e0f3b1e9d28"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/FirebaseAppCheck.xcframework.zip",
      checksum: "7123abeb87eb3ab868d7ec92d6c01980e45a65568dffcfdacf7080c922e37e07"
    ),
    .binaryTarget(
      name: "FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/FirebaseAppCheckInterop.xcframework.zip",
      checksum: "ab5fcdfa8701f5fb1128be5d4c7b349261f49085ff0c2857fa876d729f2e9e8d"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/FirebaseAppDistribution.xcframework.zip",
      checksum: "8a0450e5c9399b530d77c9b127bc8d072ec95919bc680964d76624c2f520812b"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/FirebaseAuth.xcframework.zip",
      checksum: "564d23a0c9b493199334b8867d1c9a2fc2b693e988d2e0e0ee36b522c49e9ff1"
    ),
    .binaryTarget(
      name: "FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/FirebaseAuthInterop.xcframework.zip",
      checksum: "168e1bfadd7841bb67064680f36b7bcfe1b405991b01eb9683c1224229978918"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/FirebaseCore.xcframework.zip",
      checksum: "d0b23f980dfcc9a91d8a454f3f9aaf79805d51398778ae1c179cdec1a0ae0f1d"
    ),
    .binaryTarget(
      name: "FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/FirebaseCoreExtension.xcframework.zip",
      checksum: "a6a41162fbb6ee83a522fd5a60ea6a8e5c47b022f505c8822b3589a13b2168a1"
    ),
    .binaryTarget(
      name: "FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/FirebaseCoreInternal.xcframework.zip",
      checksum: "7dd87a90283bbf29e215243723db3435bf5ccdaa64c7954540ae56b5e13e99f3"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/FirebaseCrashlytics.xcframework.zip",
      checksum: "173165fdabc44c9d2b0dbefd9e7889ce13759cace22d7b9c07faa40744ae0f7e"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/FirebaseDatabase.xcframework.zip",
      checksum: "da3a267da74883aad126c7ff39ce8135ec39a06e7de1d035d4e9c85317872986"
    ),
    .binaryTarget(
      name: "FirebaseDatabaseSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/FirebaseDatabaseSwift.xcframework.zip",
      checksum: "3f1f0ff54a4d891a07e1985b7803222f7b9cb46b83a94a20c9676c54b684f62b"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/FirebaseDynamicLinks.xcframework.zip",
      checksum: "641693898bd241e33f0d433e0a825460ccbd70c315992716acbf9e8612637467"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/FirebaseFirestore.xcframework.zip",
      checksum: "ded03885e1389b3886a1e89f4ddc45823f674d4c94a6b704db93686c5d763a48"
    ),
    .binaryTarget(
      name: "FirebaseFirestoreSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/FirebaseFirestoreSwift.xcframework.zip",
      checksum: "2c1c5e3dc807452fd391e3ed46a8f9e12ce2d804581df4f01b6120500f1e80bb"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/FirebaseFunctions.xcframework.zip",
      checksum: "b7bfd05ea3dc106007a2762ae78b595b2d2c263375986ea6eb2d9837ca6c7b5c"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/FirebaseInAppMessaging.xcframework.zip",
      checksum: "11a672d11394cbae7b06c143fdc189c0d330c27082cdbea383d93c19b10cf7c5"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessagingSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "6d193f3f66e2ceaf0eb0d8edfdffcb7f55df0fb7cc8bec3e22143e8f52becb4c"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/FirebaseInstallations.xcframework.zip",
      checksum: "ec8bfbdd1772d32f51c41dbfb70a2856ea12ea4cb9af56d842109e08a243537b"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "5e879d1698ad1b77095ed68c82a6cf51360681f881048cb8132f5937d586999a"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/FirebaseMessaging.xcframework.zip",
      checksum: "4635ba8477f2c49346a7e9dc637eaf1820600d74696cc23d276f6ad56a6a4970"
    ),
    .binaryTarget(
      name: "FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/FirebaseMessagingInterop.xcframework.zip",
      checksum: "708fcee4cfd61904311a4389e3a1867c1b130c27d9d213b9998d48a12c048461"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/FirebasePerformance.xcframework.zip",
      checksum: "3b1f09ab75e70de39ec9ea8ecac60c285a61d88272ed316ee2c78a8316681823"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/FirebaseRemoteConfig.xcframework.zip",
      checksum: "a10f23997e41c1932b2e23d1559f1f89e35f2e2ce35d547b7c5fad2d5bb7dee7"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfigSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "64cd4c3dd0d88a014d19cc3d7d013122578dcb259810853da62863d9aef5a70e"
    ),
    .binaryTarget(
      name: "FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/FirebaseSharedSwift.xcframework.zip",
      checksum: "bb10f9e2c4da241e1bcf8388192cb94ebff7043f47f0805beeb59688fb1ace30"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/FirebaseStorage.xcframework.zip",
      checksum: "d19015e8b7f1fa3d2abe9d31edafef8b8bdf9c31f9bed4892476ad3fa713434d"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/GTMAppAuth.xcframework.zip",
      checksum: "b8e65253089a11521f4fddc79c59437b184149254d8433c11e217f896a5a5691"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/GTMSessionFetcher.xcframework.zip",
      checksum: "0d64d9021ee991a5ba22fdbdff08c7dc8397cb471c6b26632b00e01418be5b8f"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/GoogleAppMeasurement.xcframework.zip",
      checksum: "c2167cd0f5f81b90685d1755395d4578e0771fc7b59fd3ed1a0c070ecadea16a"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "56f2d0f15541190ea4e84a46154202463cf5be7d778d6c1efedc0d362488650b"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "9f9d8211bf4dbe611ee969f1a44437745a89d18aa5fbd189eb8426dfa4973f90"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/GoogleDataTransport.xcframework.zip",
      checksum: "015894d5dcc929d66ddb7d983d70547335d02ce1c40beb517cace215fa882047"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/GoogleMobileAds.xcframework.zip",
      checksum: "9601bd807521aa75f4c0fc8cf93d5b871fe93cc9c042c010a1498ba9a1e1f360"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/GoogleSignIn.xcframework.zip",
      checksum: "85ef57f9d7a96af867f3a0f279d4d068cffc6d5c322b4928a371da1afed6cecc"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/GoogleUtilities.xcframework.zip",
      checksum: "9910b89e61fe12ead9cabcfb9af66b63b5b009d440983b9596546453457fc64d"
    ),
    .binaryTarget(
      name: "Libuv-gRPC",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/Libuv-gRPC.xcframework.zip",
      checksum: "84b2e90843646efd87a3608eddabff3704556920d4faba2a36d56c4148641ed8"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/SwiftProtobuf.xcframework.zip",
      checksum: "d49830effeeb50b0b4073a141823e2531fb531d1a25817eee98c77474ce7a998"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/UserMessagingPlatform.xcframework.zip",
      checksum: "ac4d169dea868c0e7b3258f15c80cba8007edf4b9df7c0b7f4353ab4a4e22f1f"
    ),
    .binaryTarget(
      name: "abseil",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/abseil.xcframework.zip",
      checksum: "23e46a452c5cf868e75295c974bcb1558952bd8142eef07964078819b94cbeff"
    ),
    .binaryTarget(
      name: "gRPC-C++",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/gRPC-C++.xcframework.zip",
      checksum: "a34f0b3c56697035b65237a6047d8a2663e348bbc30f33280cd8ff2040b53a53"
    ),
    .binaryTarget(
      name: "gRPC-Core",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/gRPC-Core.xcframework.zip",
      checksum: "649caec56cdf46c70e1f97a9c866882f97ea45eb4220d0f50166af67c5fc38c7"
    ),
    .binaryTarget(
      name: "leveldb-library",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/leveldb-library.xcframework.zip",
      checksum: "583e99ef5a298da46b93ce7bf1faee40b1ed7bd548683a8b70578854abc1da27"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/nanopb.xcframework.zip",
      checksum: "f200d702b9a596e91d209f0c66257475834fcc7367a9a10540c74d6d1612e439"
    )
  ]
)
    
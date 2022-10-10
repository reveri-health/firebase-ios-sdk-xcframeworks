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
        .target(name: "FirebaseAppDistribution", condition: .when(platforms: [.iOS])),
        "GoogleDataTransport"
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
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/AppAuth.xcframework.zip",
      checksum: "af54bf46e6143a7f02cef1d47925e782255f3729f3907c48b0e8211f85ed59f3"
    ),
    .binaryTarget(
      name: "BoringSSL-GRPC",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/BoringSSL-GRPC.xcframework.zip",
      checksum: "2d7101e3c161717aa64641fab16ddf9c48fadab7fc3e1d89723573e6c3978c69"
    ),
    .binaryTarget(
      name: "FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/FBLPromises.xcframework.zip",
      checksum: "5d62fcf58845d22ee1cf1cf3ccb193f1881ccd9cd90a0bd707701b4f61b3c6d1"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/FirebaseABTesting.xcframework.zip",
      checksum: "1e040cab762192d9ca6045c3b24be58febad385eed51812812458e86170febb8"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/FirebaseAnalytics.xcframework.zip",
      checksum: "8fe5c9a1e392a94d63b10605fe9c94085fa49af07fdc8448a71e5d0e86f278a3"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "86767167d53fce4a328cbee83c60f21c32bdf98901521ba80700e0bd4fbe47af"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "7404eb98f6ca9fe52236f89650679f60d25daafb50ab1d2b9b57ca25f913d6d8"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/FirebaseAppCheck.xcframework.zip",
      checksum: "5a1b52a6124070f76de8cd60806645c7a3270077ad28741c06a99d23951fcba2"
    ),
    .binaryTarget(
      name: "FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/FirebaseAppCheckInterop.xcframework.zip",
      checksum: "2277ff6b6a5f00473d00af88f0842bb1be610ff0ce034b114d08fdf1daed60c0"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/FirebaseAppDistribution.xcframework.zip",
      checksum: "827fa64fb5b6ffc6e36e1e5ad991ad841f3a8e14874f45f25d0ccca4a2025562"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/FirebaseAuth.xcframework.zip",
      checksum: "65d84d7f98baa06cfdce6009342f232c6217b8a55a475a9b54816cb5693fd870"
    ),
    .binaryTarget(
      name: "FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/FirebaseAuthInterop.xcframework.zip",
      checksum: "72c5b17f273380c33d082a998af29f654a5ac6cc55d685118a8ee845fec43d8e"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/FirebaseCore.xcframework.zip",
      checksum: "af65536af570f93ff5a9e5fd932d3e92515f3074374647a8e47724ccfdf2d912"
    ),
    .binaryTarget(
      name: "FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/FirebaseCoreExtension.xcframework.zip",
      checksum: "f87e1a27dac2033d3c2c2b2e97fc0e823b97f5e06205a9358c16969a78a2bb32"
    ),
    .binaryTarget(
      name: "FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/FirebaseCoreInternal.xcframework.zip",
      checksum: "32a465f9e227b512849c91ca38165058c32143a39030e3353b96058aa2a13b06"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/FirebaseCrashlytics.xcframework.zip",
      checksum: "476257465ddb24429562713143b0fd685a5cdbf8a338a4a96b064f23062eaf72"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/FirebaseDatabase.xcframework.zip",
      checksum: "57c212b41fda7c09ab7be58a037d9f0d62228587e181464604b5a0c8d3cc9f9d"
    ),
    .binaryTarget(
      name: "FirebaseDatabaseSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/FirebaseDatabaseSwift.xcframework.zip",
      checksum: "b236d035aabb032f5079df3a25b50cf4acdc3f7f3477bb39f4d9282274c324a3"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/FirebaseDynamicLinks.xcframework.zip",
      checksum: "0d75b93a36dea034af332edc3ad931296edd9c662941cdfec773dcbac8d315ec"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/FirebaseFirestore.xcframework.zip",
      checksum: "6349984e7fe00cbe72a0ae99c07c6e934a46ab1fe70b0aab2bb066a0566a8fbf"
    ),
    .binaryTarget(
      name: "FirebaseFirestoreSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/FirebaseFirestoreSwift.xcframework.zip",
      checksum: "895d63793f1a12dae8427b9fb3c5850073016350eb7bb6239858db7c83eb72d8"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/FirebaseFunctions.xcframework.zip",
      checksum: "c06c2a48a6975e25609979623b786ae332d3d3ca776cf6496b1fb1bd622fc098"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/FirebaseInAppMessaging.xcframework.zip",
      checksum: "8d9f5cc3887b9eb9e89cfc9db5e1cf3bd1df781bbd065e98c3699b17a5121b7f"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessagingSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "21731c623b21f51f5bb84b4dba4b7f88b9d1835f3dc15bd644c5fa5942f0753d"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/FirebaseInstallations.xcframework.zip",
      checksum: "81049c203351f8856e4c867b99c4cc2f7174ef27337026b8046d966c022622e1"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "a078dbad20f399bb0decf4ea9f42e982a080e6fc3eb3581a37b27d0f948cbcdd"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/FirebaseMessaging.xcframework.zip",
      checksum: "fd0727e9cb0dd7af98ea5ac445a85d4b01a719bbd4f702cf7330f4a678a90299"
    ),
    .binaryTarget(
      name: "FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/FirebaseMessagingInterop.xcframework.zip",
      checksum: "97ebcf9394ab1a2290020d8095e7ab67e71b36232246832d5dfe6ed08ba27673"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/FirebasePerformance.xcframework.zip",
      checksum: "da551ffc8a6784c1b9c92953e7f45888a64264107aa70424bd200bb0d06a7d19"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/FirebaseRemoteConfig.xcframework.zip",
      checksum: "47af6231aedd80429331c5dfbb081771e964555dbc9b84f8f4f6bbddfd473e0a"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfigSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "7eb43890ecbf5b2e2257cbea6f3bab473ed4c71c558f869adeae4513420ad454"
    ),
    .binaryTarget(
      name: "FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/FirebaseSharedSwift.xcframework.zip",
      checksum: "285a2109a28e2fd80a4437166c2611dcba38ca2105af04e5c981dc068d2d538b"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/FirebaseStorage.xcframework.zip",
      checksum: "98fce2327d635831dc6c010569e1c3bc4225f3c323c2067084f12c3f71beb2dc"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/GTMAppAuth.xcframework.zip",
      checksum: "f48100e31c469f9f60124201155dca425dc7bc52c3fb1afd2c3030c1455c5086"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/GTMSessionFetcher.xcframework.zip",
      checksum: "37a3e090d3f8539e93f09a460b4558e0a4e5dd9c7eabdb725ea4f56591a92329"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/GoogleAppMeasurement.xcframework.zip",
      checksum: "2a05b79cc694165ce207bc0d5912743cb3009963766b9859bb41db9742a57618"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "455b9fe663eca5d81a737eb72396605193c2d310c663c2f1437ed6454d386dda"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "24e4531e5cced05258987452da12dc2864026c49e9d380b4b1d3721b1c12297a"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/GoogleDataTransport.xcframework.zip",
      checksum: "e2d8cec6ce55e72760cfa29166881f1e54bd560e74a4745a18e4da5a3dfadc3b"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/GoogleMobileAds.xcframework.zip",
      checksum: "d69bd0e892e5911194e59727405318ec909ad4c5771e5162b27fe36e56846fc4"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/GoogleSignIn.xcframework.zip",
      checksum: "fbe587bef045c6dc3a6af9c1bfced273d2640f2418c6bcd54c7a8521d21c649f"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/GoogleUtilities.xcframework.zip",
      checksum: "fdd1d1e4d5316ef7937d6ba9ccd43dd85d1efd5e73be4efb8dabbeec123c9399"
    ),
    .binaryTarget(
      name: "Libuv-gRPC",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/Libuv-gRPC.xcframework.zip",
      checksum: "3b05b3c9ffd7eac2f68998c3514b6326f78bfcaca570d5793ae432ede3ad2c50"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/SwiftProtobuf.xcframework.zip",
      checksum: "5ff0ab05e5ece671ad10f2c062b55d15fab951d5963ba4999eaf9647f8d2529a"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/UserMessagingPlatform.xcframework.zip",
      checksum: "244a265858ac39c65c62ea6a630e9caeeff2d52ca8f1cee2d7655edf64feb414"
    ),
    .binaryTarget(
      name: "abseil",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/abseil.xcframework.zip",
      checksum: "3dc5ccbd7338609d83885d6ca889347bc52fe17c1daab6dd70f541f40921f73f"
    ),
    .binaryTarget(
      name: "gRPC-C++",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/gRPC-C++.xcframework.zip",
      checksum: "09257a29788ec858d28f66210be0e0119e81410a6df366e47a55dd2493c86e5b"
    ),
    .binaryTarget(
      name: "gRPC-Core",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/gRPC-Core.xcframework.zip",
      checksum: "5bd61f648271790bca1a5ccf95394e3a36bfe070bf3157c9b5c639cd54523f29"
    ),
    .binaryTarget(
      name: "leveldb-library",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/leveldb-library.xcframework.zip",
      checksum: "f91db30b3e2d510e3fc6196361f57ba3058ddbb0a49753edcb706576458a4537"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/nanopb.xcframework.zip",
      checksum: "44674397055cea15416b1763c47b6103652dad105347c0b5eb0bb79bdd4e2891"
    )
  ]
)
    
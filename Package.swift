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
        "_FirebaseAILogic",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension"
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
        "_FirebaseAppCheckInterop"
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
        "_GTMSessionFetcher"
      ],
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_absl.xcframework.zip",
      checksum: "537d2c25c2727f988d7e591f56898a7aafd594b002f62a1781ed7aeeeda3c77f"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_AppAuth.xcframework.zip",
      checksum: "e59211c2edb0b8d46a3bfd5ce430aaba1452842ba28e6a65e3c090d08c8174bd"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_AppCheckCore.xcframework.zip",
      checksum: "f397c77af6c1ee03c890ddcf9f18419554468c0437df3534a838c573b77338b4"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FBLPromises.xcframework.zip",
      checksum: "17cdd0e4150294b949be9a2e6cb304522ed8d24608c7330e4d265d0d080fdcc8"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseABTesting.xcframework.zip",
      checksum: "8b6babcb43303d658589801ca44fdc9038944de6344c2af3ed6bed37a1c74414"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseAILogic.xcframework.zip",
      checksum: "025484ffe8f6f757a7b318fff5b2051adc3f816a963e36fdce2ca9328e961250"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "4cd0951856fbb23d55da3ba78b27269b4c1f9c85566b98a94ff20606c3689284"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "07e84f40653bb2eee71a34a838a82401b61ad228e810bf29351838c586c1ae67"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "7ba78dabfd326b34ca1698b5f176a30da7282586da3c7bbd36318b502f6c5a54"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "6ec5a3a68cf42e79b50900dbe41939976988ea7e4d5321ea8190037cfa8bc381"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseAuth.xcframework.zip",
      checksum: "23b8e6549bb321e0a4333ace60a4a28be5cc2d6cb2239c0ff5f058fb329151ef"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "65ee7b233d8b3d092775a43161b37ef2d11d42192d9d7fbb0f335213a392ef3e"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseCore.xcframework.zip",
      checksum: "8015dde7b01235fe88b4bfca3b1806d5f81172d6ac7083e4392d3b5c80f5274e"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "66e78449bc57f731bade96e991ce5b53ed219ad2dc137bcfb199bce7867de9d7"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "42a13ae86f4219f0a825dc4423d5dc92fe2567c918c1a4607f473f75209ff364"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "adafc15355dcd33510a9bb81f9d7a5f3be3fa4824f8115c2da290e7f0bcd07db"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseDatabase.xcframework.zip",
      checksum: "ce51c1a882b01be53707ba05f6109f6369ab8dde398793a8cc6534b4110286b8"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseFirestore.xcframework.zip",
      checksum: "9e7435c6e057b6b236a01802e0924e6dd2a3a608d37fc40e96c7a0114261c675"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "3e2221cb5867714ef8e714ab3dfe57bb595eee905aa23cd4d74e60edf797fe81"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseFunctions.xcframework.zip",
      checksum: "39981b476b69ef205c46a66c4a847c11e45da01e7a57bc4659cb8acd32acebda"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "46a943c011f826f68cde3b5e38138e522c88b8a655d3b3099fa819f13e1b9f12"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseInstallations.xcframework.zip",
      checksum: "459c9b3236860bc2f4ae95a7dbec8778494d5c6259c5a4a0aef28f8e5ca5be37"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseMessaging.xcframework.zip",
      checksum: "df964e9999ce6f6742785f9fffc7f5270560172b48a61183ed5127c35525aae9"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "e7f08f24cffb2e5fa03e5e1e86f40d122753cb4d589a6c615e74c9db4ae3364d"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "3e2b7ee4165f4b61a63ccd27212846ac7edfb7e5ea96847e27f6dcf363141509"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebasePerformance.xcframework.zip",
      checksum: "c31a56fa7372fa95423c626145d4fafb088bc5895a142e364b6ddc7345cf4251"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "e803128fe7d89c051687f78d56ca9fbc17bd29aa3e285a1a5531b648a1cab7e8"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "a2a744e37c61f3d884859134dbddf6a0dbcce627434315aebb28bd12be8926ca"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseSessions.xcframework.zip",
      checksum: "b3d322e77b0d34b4e9139415222fabde683a60d882d9ca0cc4f1b01fa208551c"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "3836e981037d14334205bcdf902ecb6702be900467406cb13cba4a58002c44be"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseStorage.xcframework.zip",
      checksum: "d98038b01cc5f39ecb789ab342af1354d8e346ef144955c705abf694ef5492e6"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "33275af8a3e201a4dc11e5414191d0fb09c451cbe9a0e287a1e2abec4a84ae55"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "33ee1a1b56f1e87ea5ca86bef35948754878fed7cc8a47d73798831a713ec303"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "2822af0b89e8d294e30e801b31f0a34d5b5152ab46e89a8e9395248c0d20478b"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_GoogleDataTransport.xcframework.zip",
      checksum: "435c81750c31d431a30af044bf67a19a5978e18b3e6b43587844c5fc303520a8"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_GoogleSignIn.xcframework.zip",
      checksum: "152fa1ea049568c486cbafd7345e89e60ccb48fbb5afc9a8cd6c890640183440"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_GoogleUtilities.xcframework.zip",
      checksum: "d77527c25ca09a3d6f27f99d9448de418384022537ba913e204ab49a54aed8cb"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_grpc.xcframework.zip",
      checksum: "6672d2811562dacb8589aaaac58e2c1f35f8894a5ad11d99a83d9b40880165cc"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_grpcpp.xcframework.zip",
      checksum: "6239eb22bdd5f3a87e5a1d48423b7836530d31bb8c1847aee885c814cbc70b25"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_GTMAppAuth.xcframework.zip",
      checksum: "6fe932d25b36bec68b60b3a8a980f93e03959844a005691e378c38d6cc460225"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "7ba15df94b549626dd617fdbc75cf731aba1b9f29487bf2ea682c11c16f38c07"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_leveldb.xcframework.zip",
      checksum: "d710d92d5b0a0794df7d1d2d507cf712389fa94fbfb6673cee7fcbb1d9ee3b01"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_nanopb.xcframework.zip",
      checksum: "0ec092db3298a5ce97954805388b60d94d890094514a392c2c7de09c245324df"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_openssl_grpc.xcframework.zip",
      checksum: "8b4e0bc16c1eeb69400756c9eda4a487629eb22a4514f8c0eae874b99e649980"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_Promises.xcframework.zip",
      checksum: "47991bc9d9efd537cdf52e9a970ccb4bbd014579003fcf26b2dafa680e31076d"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_RecaptchaInterop.xcframework.zip",
      checksum: "6e9551ee84621941577f1d53464aefc53ec1593c6c7e6a9b8f58f580bdecee6d"
    )
  ]
)
    
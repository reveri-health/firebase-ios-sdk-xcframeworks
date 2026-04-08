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
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_absl.xcframework.zip",
      checksum: "ac3244c8c642c909dc0e61e81de088d103c290d757b7e89a937f804f22eb0d23"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_AppAuth.xcframework.zip",
      checksum: "f4c2769f952ddbf0b32e6c816a4a0128d6a2b79ac34b761bf8b2734881221284"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_AppCheckCore.xcframework.zip",
      checksum: "8318b31a9069363c524959c20fd421c8430ccbe865fe08ce4cd529fccafe4de6"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FBLPromises.xcframework.zip",
      checksum: "2d4b2c88370329d20c558c3dd80546dcb25698f5a8e2250193453e2b451b5d0a"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseABTesting.xcframework.zip",
      checksum: "cea3bbbb4116de2e6127145c23513a6edb31f5ad8f5d1b256ab8e5ddc15f1364"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseAILogic.xcframework.zip",
      checksum: "fe6a7ce7d09e9650d6ec487da1d917acdc1b55ea5adc27ce99351b16bd8c91b4"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "6d4237246b533fb13735a4b71e74ea751c74af272b82965b8aa3342e2ab4be8c"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "6ad0d0f93ef6f6c6bb42ffde82f4e0f24f9f95f77b8834928b244a9d2f56dee5"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "e185fa1c29719e4e85e0d41005c749b72bc6b1e75d4a51062990b46889cffbbe"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "08e236aab5b9c1c42e2ab58dffcddb0d849b4f2312f60174a714ff0f5db21775"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseAuth.xcframework.zip",
      checksum: "687957a88d74b464b5fa224d7899035fce34b7fe31278d52992e8b1dc18aabb4"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "4568ab23d3a1667a1038460cca8e7116625b38e20b63bb753527af625dc05dae"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseCore.xcframework.zip",
      checksum: "59cb653ecca5e8154aa6b181c288cb573bf6439e66013ca0a140d34e01694add"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "2d38dae45e24bc0b286a1ff8c7802ab1fb421ce1cb928c1a1a5993e582a2c0cc"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "8e1725843876f5cb59bbf90a7969fe60cc1f4ff17f58a41876dde5b6181a162c"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "f1787419a7ed9d3ac9b9f8a276f38f1f943f61ad36a1ab3a61a898d73f2b8432"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseDatabase.xcframework.zip",
      checksum: "d92a939043fd08522144f8bb859775675035f8feb151c03ade950e93b8a717e4"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseFirestore.xcframework.zip",
      checksum: "4c6d3f34a3e22e35205f50188aa08f1340512cf20c215955a42c2c5c70125410"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "93eb5ae86d9d8158f068834edd7825fae99b809590e60333961254db216048ef"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseFunctions.xcframework.zip",
      checksum: "e0bb83765397de62b849234ac52ff720be1bbf53177cf9e9726fee04c49f2bf6"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "226a5a50f0d5be7bcf6806ea0f1887c0581b7a927edcf7d5d56f4d23155c265f"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseInstallations.xcframework.zip",
      checksum: "9bb5c8bac8f4ef3d397c2c59a4fce87fb5cf7e9d47617c11580272f26df0275e"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseMessaging.xcframework.zip",
      checksum: "2ad7a9007128a7b3a03b8d8b2cf9661405280f65c505a5046ba7259e3d39ba7f"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "94436d0f05d8c759162186aab9d9cc697ed6a2a81ab147638c1a717e2930dd3b"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "6f5ef66d8d9c82e8d51ede96cb1d56fca8477ee86a24a5d273ecb3c83f9e7402"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebasePerformance.xcframework.zip",
      checksum: "199df7beb87d49237827f02fe5a2a193b063092638aaa7832bf57a442dde4dfa"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "222884d35d55288104de48d1ab23fc466d5318431fa524ea131e4ee52c7496ff"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "85f5d876989d4e2723eea58a90eedc25e8bca6c7ea70dd3d606edf4523797ed7"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseSessions.xcframework.zip",
      checksum: "05b047101832abb02f490063b9fc2daa954f4242bbf8f2bae474283c542a60df"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "aa9b1568fff7ea1288c3ad7366bcf16322b45103869305508eff90a9339f641e"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseStorage.xcframework.zip",
      checksum: "7e0c4d1f59e457caa7e835659afdbedee7e4d85b7c7a1edf713bac01c1348e0b"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "f3dbd35df576b8622526730c54faa6f554f0c3911df12eebefac5c719977d350"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "4f02df963c19a3656d488e2813ec5e5d3ceb71268238bab840c539598031eefc"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "4a9783d6d78a0edaf64370b9885c706509bbc5888b6c2ac605289a2e0dcfa5ae"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_GoogleDataTransport.xcframework.zip",
      checksum: "44ed372ddd950f5dc15b28bcf9fe362a0fa4f4be83d91a510798ae8b15b5bbf2"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_GoogleSignIn.xcframework.zip",
      checksum: "5c575d381224853ba4a779462df61bb994f49d697b01b6445b1565460aec0a64"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_GoogleUtilities.xcframework.zip",
      checksum: "d0071ad9aa8eb935cc04ec3348e67dc858debbf0aa1d442b554eee3595de5336"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_grpc.xcframework.zip",
      checksum: "ff57072735c3c5fc073787cffc129541dbb2bd0c2e922f7847e7b860d1d6a6e4"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_grpcpp.xcframework.zip",
      checksum: "5badd914e9d305fad77528dcf1d59ce77a5a33bc105e07056519f9c32b4eb515"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_GTMAppAuth.xcframework.zip",
      checksum: "dfe87b23235d82384081864af9db7cfd1e56d84883ed20d7708ed4815cff8858"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "d1388a1b1e70529090a7919941d51070d42bf5413eff64d632ac47e5790561fc"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_leveldb.xcframework.zip",
      checksum: "6aa4792b129aaf230fd250ca32abb2fa3717dbf8d1fd32a5720c813ae7124928"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_nanopb.xcframework.zip",
      checksum: "8e780141585617c90af3ade8189e29917505844545f6cc8d429d6fbef873e551"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_openssl_grpc.xcframework.zip",
      checksum: "dd56bb0991998ee07f6681e34a39ac5fabdcc5420ee98d5a4c26a039e31b5e32"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_Promises.xcframework.zip",
      checksum: "5b222d04e3c723526fce0846135b45c4e46c385819fa39ee46109f0d2ec1e399"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_RecaptchaInterop.xcframework.zip",
      checksum: "5656c36c08cbe3b6a82e88132dd4bb70d21f5e394bdd580c043d2518065a159d"
    )
  ]
)
    
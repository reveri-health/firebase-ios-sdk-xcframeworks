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
        "_GoogleDataTransport"
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
        "_GoogleDataTransport"
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
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_absl.xcframework.zip",
      checksum: "2faacb0e90fc205f2e7a22c0c92ba738d9bc9669de3a3d9a1dd0f473e8bc79c3"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_AppCheckCore.xcframework.zip",
      checksum: "b31635da4b8178bd570d26b62c6bd2b958249fd6911022c1f2bed1a49a62f274"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FBLPromises.xcframework.zip",
      checksum: "123fb1e32671cc20518e3dee6896bd28f4584efb6c864edfdb6d52c4115e3e37"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseABTesting.xcframework.zip",
      checksum: "ed0180fbdb13ce9d0f1ece5dfc6989b1ee1979c1039dc8693b7db5ada147c5c2"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseAILogic.xcframework.zip",
      checksum: "9e9f0a5a20b9355924921b436990bc97d6cb8cefec2094b870171bfb1f665fb6"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "7188f323feb91bacf63d6761eaae4563781de38e1ff79543895a73e7c066faa0"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "acc7cb9acb105a0f0896e91fc210cd17917ce82c073e4596758efaee5159b221"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "d983a432f57fbb809b5d9171c425394b56ffc2b98c938beff1f8f9fa98764a90"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "556f8560261bbd82db7597f8b5ab4077fc9ce57086865792a0ae99e7abb19765"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseAuth.xcframework.zip",
      checksum: "cce738aebf839b4c80d5f648b15bf396fe829b0deffbf145aa2fe0d4cb08e20c"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "462520a9ebc38a3667933af09654efa108d3acace8149564727697149f247828"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseCore.xcframework.zip",
      checksum: "a1a1ce691d363a9ec7770f5baec7b85fd3a5dfcc775020a4057a5c0683f29699"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "7316cd9620dd43a8a95bb3fa2a6a0069955da533bc5c3e7da60e1ae1e0d88bb1"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "4d8b9b88b2899057ac182308cd8e1bfbd624d0ffecf4b5cb1cca5643fd469c80"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "e40a14cea21e5cd6df9b3e7a49e8459620e88e4dc79200b2d3782335ebb9aac6"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseDatabase.xcframework.zip",
      checksum: "299436a3a22abbe286b35bcd469bbd6f91cbe5935a01f087369bcc5134b0a407"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseFirestore.xcframework.zip",
      checksum: "1097f6be8de92568f6698b0435097e5fab4f4343fe2ea0aaa84fb0ba3836700c"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "d2971b965b4fb4e606050a770be71e63a6140f976173def10c07842668fc38e5"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseFunctions.xcframework.zip",
      checksum: "4aeee7f8890f2d6e6d7c786a3a734ea66eb58a93ce3e8a10cd79e86398237e01"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "ef0d97d00ed95c65a95458537d92dbc626bc1bf5e19cca92039148454bfa3279"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseInstallations.xcframework.zip",
      checksum: "5565b4f36c10a08d1a0c769f2172e94f52f88c4f648f3865f315fa97bd476561"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseMessaging.xcframework.zip",
      checksum: "aed135acd2395eb47ab65c5800cb291af08cb0840b29c27ae9718fd63fc7d9d1"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "13bae3fdcd5bdf203a1e9e511282da2af302d06ae1351109147d047316fa473a"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebasePerformance.xcframework.zip",
      checksum: "a65fbc5e44a05295c21541021894c6efc6b0659ba5a7f7ac04fa975cd254db77"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "9a87e889c39a3814a3e649b073743932c9c9d9c981777829b164b6e517563513"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "84cdb1afbc95192b07f9cd028fc7ec27d393668d1bc758be1f05fc2ebe8e8b29"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseSessions.xcframework.zip",
      checksum: "ce0037f39c87c18bfa9b813428d380f65618d4104c5aea0e045e4b5defe577f1"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "448707aa962e9eaf9454569a2ec98ba1a8fdcd66229935129e6ad6a3a6e023c5"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseStorage.xcframework.zip",
      checksum: "383be9418dec5217c22e9e9ef76b6018daa6d08b9e7719385d0da743387b3526"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "bff8551b24f0a0f691b14d7233113bbbf601cb9f8932d437735a063e1c14d813"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "c55c9d8b923b693c4aae4f2ab29f6ec0ceed9f64c13ca4f9cfd13bb22cc08e6c"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "731c8402a8683dc1555db2499eba0837c06e4dd356d62b5f1dec19de593b28b1"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_GoogleDataTransport.xcframework.zip",
      checksum: "f3fed0109e49464c05757322edab0313455c29bd814a3449d1b501e655bf0e99"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_GoogleUtilities.xcframework.zip",
      checksum: "e873d902717dc9c4f9ebf04081e0294bd8c118dfe5cadae4ab8fa2df5b4f1ee9"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_grpc.xcframework.zip",
      checksum: "3fa64bce8b3e3982d1ac66dd9f3714dca1ce6ab71f10cca077a3036da23fcfb2"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_grpcpp.xcframework.zip",
      checksum: "9d695c2b45fc7a617246f5fddfff7574d332358af138d759b49f8b67e4a0d339"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "0a7e4309f9309cedd735a21ebcea5fefca3d8480f2ab8d7dda9f6d782498eb02"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_leveldb.xcframework.zip",
      checksum: "7c894a595e34a394a7b4d7351abbdc289ee6ddad19e1b186b9bbd688c85ed383"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_nanopb.xcframework.zip",
      checksum: "cdfd5edcfd295bb0bef00b13d5d58faf9caa2a58245d06b1fb41808732eadf40"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_openssl_grpc.xcframework.zip",
      checksum: "e554950d6e94d1208a2138b74d0b1658c603b5ddcd40f66d13d8b46405fe5963"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_RecaptchaInterop.xcframework.zip",
      checksum: "a6fc1f857c05087851b1f30dd7ccad2f9dcf5eb27e8516d99a9e6653d9b2de24"
    )
  ]
)
    
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
        "_FirebaseAppCheckInterop",
        "_FirebaseCoreExtension",
        "_FirebaseFirestore",
        "_FirebaseFirestoreInternal",
        "_FirebaseSharedSwift",
        "_absl",
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
        .target(name: "_GTMAppAuth", condition: .when(platforms: [.iOS])),
        "_GTMSessionFetcher",
        .target(name: "_GoogleSignIn", condition: .when(platforms: [.iOS])),
        "_Promises",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_AppAuth.xcframework.zip",
      checksum: "db74cdb583daa9e5b470c0e3235bda4a1312e9b53d32aa0b61046b017c33aec7"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_AppCheckCore.xcframework.zip",
      checksum: "12444b6ac2d6b911897edfa10f9b9d33b4a39ddfc8e9f7362f3ec30ccc464df3"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FBLPromises.xcframework.zip",
      checksum: "66b5d3d33741aedd2d1bd2ca24e25a52b2e2106365b23e741494137aa7c2866c"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseABTesting.xcframework.zip",
      checksum: "60e16e317f7b66fca444d519e39f27f6021c8931659457c6779ee8ed5ecff8e9"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseAILogic.xcframework.zip",
      checksum: "667009de8903551237ecf465e3c6df4d4ca145b2445d176e09d6bdf03c8e3c90"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseAnalytics.xcframework.zip",
      checksum: "9220a468083a28d029ba57b3771bf67a65b08f14cc2243f456084c49751b93a8"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseAppCheck.xcframework.zip",
      checksum: "c555442f79e7cc9e5bdefe256a0d5faa2d151c4b932c7b965ddfefa727732860"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "fed464ae498b925118dbb944b8877886c56bd925aa9b459de73a74fdd2fb4699"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseAppDistribution.xcframework.zip",
      checksum: "10b10ada0c35ae7b9556deaf4213f6952a7824de7903e4f166bd17e54bd63360"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseAuth.xcframework.zip",
      checksum: "12bc99a5c6aba374003b2eda5f1062c9d6732f7470a97ccbdffa0e3199a8ce53"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseAuthInterop.xcframework.zip",
      checksum: "728148d0c8935fd7a918d2d6ef2af9b941910698d87c5fa06a3a0ba0024001b6"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseCore.xcframework.zip",
      checksum: "13c72440f1eedccc22348b26597a3549622f468fcaa18fe7bce6612cf5305004"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseCoreExtension.xcframework.zip",
      checksum: "ef2a7f783c00f3fc83250fb12e2eaf633b696ce4a09d008cfae673a4d7ced7f4"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseCoreInternal.xcframework.zip",
      checksum: "164ad27c38c7e241c88833045d19ba5eba3ad374fa6d92e111052b7acf4a9821"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseCrashlytics.xcframework.zip",
      checksum: "ffececdf7a46f361ed49c415dfbee8c237ff9169ac8d291cdc7628403b4d08aa"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseDatabase.xcframework.zip",
      checksum: "06a282e3f979a2096f8659909e590b66b42679265e1d1e392273aa98917e33d9"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseFirestore.xcframework.zip",
      checksum: "6ffffdc5234e1801bec3b473279b8bfb1868fc1fdda264b4910e013079458c78"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "ff0e3841d3a1c0b6738a437a311e3e4f62b064495e3199151bc19fd422265c6e"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseFunctions.xcframework.zip",
      checksum: "0f07a2bd51d24c7a1ffda7bc07cd1176bbc6e4ff95370d9c1b278f7fc7a215e7"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "a11c8c4aa114d969d39d423f996446002457ac9bf749fdf4dd6f06807d1669f7"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseInstallations.xcframework.zip",
      checksum: "17abd4f0bfa187286fbcf6bff64877162ef478e9a9499b7041c526b55d37b326"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "ed834899a8007002692fa4e27b9fbc20765f3db9c3e494c24e7643631047dd24"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseMessaging.xcframework.zip",
      checksum: "aa3daf8efded8d615ff240fba344d6b84e29a8da8d2720421cef29fe946d10b9"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "5bd7bf3efc00753f0ebd3fba1b688b50ee43bc2bcaff9d40909811cf6a82c681"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebasePerformance.xcframework.zip",
      checksum: "9b387b361a35af3c053db7a7750b3fe60d851e29f6b0530b232371a390aab278"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "c9c438bfd5844a71288fb5d08847d74231c8564afe37a1caffadcf1a4110327e"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "c9f5f35de0b10b2f0b647f2f1bf062f141aad5bb992de50d7f64b659898cc3fc"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseSessions.xcframework.zip",
      checksum: "8ae467ba6b52a13c3ac7f64cf958eb77a08f46672fdac2d3cb930381a6e45925"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseSharedSwift.xcframework.zip",
      checksum: "3b1883102d023871543d25dff0867d0f2ec986a4af610eec05e09349d87fb554"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseStorage.xcframework.zip",
      checksum: "bd5eec1f379f7524968fd30d03bd667a490212374afe36deb0402a09564f21c6"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_GTMAppAuth.xcframework.zip",
      checksum: "f77876e603a2739d605c34c6e519343d36bc7f2455f63285e19a43e5ce8532ae"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_GTMSessionFetcher.xcframework.zip",
      checksum: "383e6dcf311ea8c9caabe54698fd319189f7f98d406c88e2cc7cd3369720c20b"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "761dfc3ca548e8174b1aa1599af6fd993f2ce75eaf6b7019173e978ad823c7fe"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_GoogleAppMeasurement.xcframework.zip",
      checksum: "1347e7ad0805a5ba8ebcb0bd3ee2eecb53ba7066cb4901b1341e96c07e08f3a2"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "da631f1432293bea5fee717af93d0f94508c17699c3b2a5562a5dea36c234e8f"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_GoogleDataTransport.xcframework.zip",
      checksum: "938a4149e2e717f95cd067118ba0f4f5034aa0bb7fd726e0fc574e68e9f40e05"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_GoogleSignIn.xcframework.zip",
      checksum: "e2388f114691220e189e901872a570abbad9a00fcce1fb4f76d86b29afc56c47"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_GoogleUtilities.xcframework.zip",
      checksum: "31a014b4cdaf4b7d8c306757961a725141f96cff1818817390bac95d6211976f"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_Promises.xcframework.zip",
      checksum: "ea46422d004664f46f5e744a5cffcef0383de16a2192260ed63518cc2c4b75fa"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_RecaptchaInterop.xcframework.zip",
      checksum: "c3ee9f7d1f9a8903d24fc6f6d1e3762eac4579306d3ed4d960b7a8aaf08fdc53"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_absl.xcframework.zip",
      checksum: "ecd2aaa76b3fe0a141b60daa0db56b98eadc02211f8b8f57ad808b1ea213d094"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_grpc.xcframework.zip",
      checksum: "76f7ce7d70f959d3a3e8aeecf20192b4a9c554db0ed3913e371a5c0743e8872e"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_grpcpp.xcframework.zip",
      checksum: "cdc5de452cdf904e819d34d5cbe79bb62d5c7b8e2ae16023fdc6b4ffd4f0b169"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_leveldb.xcframework.zip",
      checksum: "07a56610bb474b1d4bfa8cd139b4dacdea4ffc317884986b80aee0daf25aa184"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_nanopb.xcframework.zip",
      checksum: "77a9538702fd4dc6a4020041401414b59e1ebe3dedc7c5ec924408a8b2aca1c2"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_openssl_grpc.xcframework.zip",
      checksum: "400103793335f6beb29e5eddea4d51c4819c4595702017738c04487f7fa10c54"
    )
  ]
)
    
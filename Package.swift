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
        "_FirebaseMLModelDownloader",
        "_GoogleDataTransport",
        "_SwiftProtobuf"
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
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_absl.xcframework.zip",
      checksum: "b43b6f55a354df393b5eb4756cc5e530438e4864320127e260fd51ceab0a5bad"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_AppAuth.xcframework.zip",
      checksum: "28a255f60eb3419a99da96d6fbfcf3557d06bfa242244bc4c88e94baafbf3800"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_AppCheckCore.xcframework.zip",
      checksum: "2063028aef37b7c11e30b533c7d0ba09780097436eca0f3e3fa1340bbc6e9b69"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FBLPromises.xcframework.zip",
      checksum: "9f93075052c2703d4b3c879a43d20f96d7940d298507598c7c93f641002fe823"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseABTesting.xcframework.zip",
      checksum: "2ed7fd88525ecfa1d2cf78334cc259cb9dca98d12846a304f8170c1b7baa5757"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseAILogic.xcframework.zip",
      checksum: "dbb82e559b82cad59c560a1194924e087da400f58bde7e1f912d62f971bcd828"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "73a7a15d7da21bd6c0cae907a9600f9f776d6fe4caaac80ddb74c01978b055ee"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "a6e5cc4f60fa2fd3130c0516a91e3e77531d252398ad262cdb8172e636079ad4"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "1fb641c27c4a634da100d45d90326c1843bb937f2f0db78898fc5009fc707b7c"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "56e21c283cf77aabc1adf3b29e70f682f3167fdbe53a13761b0a5f01f123d38d"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseAuth.xcframework.zip",
      checksum: "d3b95b5677392a7a6a871222fc5ebb7e7d691b5efa74aa8cf35987843cd93978"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "be2b619d944529dcdbac35e9d49a79cb27aca1143eb049789cc125825562c1c2"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseCore.xcframework.zip",
      checksum: "ca45efae96f8fd5dd213ceafe804b8f87f5dc16e92d57478fbb6af530d13cb3e"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "33f3d3e6dc155a9b55bd5a82ea48818e6859a428d8cadbbfaa2973dc3a15065e"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "72841dd05bcebf14c9a91172a2d6bbdfdb43933d26666d72f018af6cbce12cbd"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "0b6a5a99c22531363eec73cc1cbae65f908e545a9cd283cf4c1de92e33a1a676"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseDatabase.xcframework.zip",
      checksum: "829aa1ced87615823d0480d5537a9f6c6386abeb6a2275141981e165888706d2"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseFirestore.xcframework.zip",
      checksum: "aaf2ec6d8adc8b5a532c49ceb3d5dcb00208ecf61b7dac2196a3615d2d1b2747"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "6953e9f2b2e953c7349883978d231f1409f83879994176a43134fce870b3bcc6"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseFunctions.xcframework.zip",
      checksum: "b955e8d149179e0011dcaef4669968e5e818484078cafc3a42c11c8364cbd0ba"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "251f124862db598bf4135811bfface9f34dd5e6af12f3515a3d47f2c983d5a7e"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseInstallations.xcframework.zip",
      checksum: "cf71177dfd2f077c2e5533ac65b13a279a43f8dd48ea22bfef154bdc154943b1"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseMessaging.xcframework.zip",
      checksum: "27ea63654f0b92dcbd9abf47ae821c852fcd30e644d576beab2174bd96e15a83"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "48907b408eedfa84bb69dba6ee245c1eb86f16619964638be5f33c9d3c7bc1c4"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "79d87e4d249adeb4031d4ccbd8047af9d2312c5b8e48977dd2de4d31c764f28d"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebasePerformance.xcframework.zip",
      checksum: "25fb2c4ea0b34f7c04c3ca0c7cab5d0dc5422a26b23bc3f9073e2dbef6606d4c"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "32e53f6f77fc1b3aa40b2c932067c503a7edca580bef6a8881c37abd569da1be"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "a1259e347e1698f72c13887cd0c9fc232d631dbf1707e412851cfec2f8fbaffe"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseSessions.xcframework.zip",
      checksum: "26618365368b028be44b1a7b45a1515d9cf7848f0121e31e90f10bb60053bf49"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "79a8e38a2c1dbd26c87c504b854fd7e9f71bd76add7dc8a074d7c01bcf91f1ba"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseStorage.xcframework.zip",
      checksum: "12d155d73ccd675621c3a873248ebac978bae62b6f478327357407d141bd2637"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "1dfac7bc0b3160c0e077d9408ab178266577883204b1f4b0a380aa05630f7de3"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "56b0836596cab87d727729a9b99e34b9263303925e2087d20f81f8acb47face5"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "aca6e6b7076df90da76d4a899f4cfa3b9c068e8a4c80ff67303b4bb94e4b608a"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_GoogleDataTransport.xcframework.zip",
      checksum: "3f752938927e7fa2dda656d5cd479db8f3d1f87cd923a4f07b32ee898df206cd"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_GoogleSignIn.xcframework.zip",
      checksum: "c78a0c652559e142d077d607bd13ff01abcefa999910fffe42917dab5aa2af81"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_GoogleUtilities.xcframework.zip",
      checksum: "b1b27ee5c34021c869a7a1f203897bb3392cb95d5232f3c42c301d2ab8613dbb"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_grpc.xcframework.zip",
      checksum: "0c087a9c4a4d1bbff49174adba74ec60097335e9a194774cd242a86eeac6b351"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_grpcpp.xcframework.zip",
      checksum: "29316961c1a6f8839fa305030765170303071d38a58f2567b6bfe1250d8d7d64"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_GTMAppAuth.xcframework.zip",
      checksum: "7794b804bdca637439b00764a68c87b8050b5defaac9723aed68e5f76fd703ab"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "be23ca415d73a378693c9422bbb723069aea2871052d06610fc8d2dd36c233fe"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_leveldb.xcframework.zip",
      checksum: "e8b56c9ed4437187c85d3059dae7fa65d73b984b6882e0791f8453dde02cb62f"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_nanopb.xcframework.zip",
      checksum: "44736e987303984466f6b422be9bee6c9a1f4aaf07e14894a025b7a7f78af8a6"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_openssl_grpc.xcframework.zip",
      checksum: "19ed36bea1d829f6ecc56eeca82462c7828d8477dadcdf4f8c29c2139e3f6b80"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_Promises.xcframework.zip",
      checksum: "400883e3816840335a0cacf29ea928340a3b16b9f64422c62f9f15f6423904cf"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_RecaptchaInterop.xcframework.zip",
      checksum: "c9c6de93ba0d575ac4434321779152486191ad9e9a5eb79ea84a56cd3332f69b"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_SwiftProtobuf.xcframework.zip",
      checksum: "8d583934bdbc75d86a1a3811bfb50cef55ac7cc8a04588d35eb3715f38b84c1c"
    )
  ]
)
    
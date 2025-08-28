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
      name: "FirebaseAI",
      targets: ["FirebaseAITarget"]
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
      name: "FirebaseAITarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAI",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension"
      ],
      path: "Sources/FirebaseAI"
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
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_absl.xcframework.zip",
      checksum: "2529c42b56122a3e9f035e4b2532e2b8d4f6bc72d8721ca862531940276d6fdf"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_AppAuth.xcframework.zip",
      checksum: "8ee45fd584b9dd8c0a5983baa0d88f32d6dfdb04c6f23e5d3f1d667f52ae2c91"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_AppCheckCore.xcframework.zip",
      checksum: "f1f9540cea15d6c43057187787ad07e3c5a9e654d68caf41a9ce3d64a18dc183"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FBLPromises.xcframework.zip",
      checksum: "1fb8f2848be070f7d5578fb07054a818c9ccede03e678085d6a10f7e95d75e00"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseABTesting.xcframework.zip",
      checksum: "c3e5e97c354165c67a945b9cfba58f69f501d570bd83256dc1e8fedc26615928"
    ),
    .binaryTarget(
      name: "_FirebaseAI",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseAI.xcframework.zip",
      checksum: "48f70fa7b7206fdaf25cf62f71e76ebc927964ea9314e5b4f1b8eb108c332849"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "3c1dddcd079af6f4da33afd613648ae753c4183f2c3c8def21d0910e78138634"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "cc01cba8aa0021d6903ff78cedf90a5383a3a805e433b342fe313135295e528f"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "cc2bcee191c342d3d876feeaef7491a5d01ba02e8359a7446be1617b31186671"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "0e023ce04e533dcff315bd3019fad9119c495b9c737a5aabc213af741ea9350a"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseAuth.xcframework.zip",
      checksum: "bcf971867367d063f0689352354cf18ac0f86d3983d035077bef97ef1e9902d2"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "cb5720f8453b050a4d58474184bf0bca21c363cc17ae3512c33cbaf9b4212f12"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseCore.xcframework.zip",
      checksum: "ae9e474c173c4fa1d84ed5f75c130d7a4d83dd384d0a8e11c4ac20d9d4ad6a66"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "80a671dc88fd9634e818f24b075d1b6b0b47532e864a85a022996d43bee0edd9"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "c21a663be66f9a9252318910661c971cee22703fb6c85386a6df0f1cf61e94a2"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "cd444955087f4e403ca5c717be42b66966af389f2fec1de7e1d72425ac857eb3"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseDatabase.xcframework.zip",
      checksum: "08f182dd0814818afb9f73cc76ae361de9984d60c27d70144149d3cb5c89596e"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseFirestore.xcframework.zip",
      checksum: "b056374bbdb4397981bcdf0258a0fdb79e0fa7255cb727851e15cd11cc8ed22c"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "f8f8effd317cd99a73f20770266b45c2b82848a8acd125cec0c0eb4f26155210"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseFunctions.xcframework.zip",
      checksum: "08c25d3ab364bfcf5c0eba9fb968697f86c4b5c457862a701d20deea935a3f84"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "5b909defc41c891a5052b1748500f50c9c2f7e3f2bae0fee516d06a0e73d5f70"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseInstallations.xcframework.zip",
      checksum: "3874f42eb4525de3a31a01692c643d04944134ff66f9540867e23fe933015746"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseMessaging.xcframework.zip",
      checksum: "74c3287675a5bf24724e253540d9f0c665bb590f0c03ea1c0d06a4aac6b2a0c6"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "969bdf325991c5a1c88090df0de312d0d0f823c7fcf3d80ac90e19cdcd3be898"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "e211e39b265ad91695dd64124c082437f6f98b6f7942978d6e04bf2ff4f951a0"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebasePerformance.xcframework.zip",
      checksum: "f1899e0b2141b205e74dc8aaa16244bcf2e2db19c174e162ea26b9d53bc9b50a"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "cde64d98bbf7cd8305f75aa765ae0f65db046250a75536e888d9f851815ffad4"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "023a9f4fc33808dea037a20e48e06e7444cc96d98207bce70dc7ce0f58b809af"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseSessions.xcframework.zip",
      checksum: "972a71dc147d56e3d7cdfbcee40346679b758aa8f8743d01202a4362a46f08ae"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "1937a1f1039b92421380ce48f3a1afadfd538648d7014fa4ccb9794b7051c172"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseStorage.xcframework.zip",
      checksum: "cb24c6503d46b27564085757a0f85aa55816597aaaad04b8fb64e7e609caaa94"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "9049336e7ea07eb70294b8e35dc52308d7fd4f66f1ce4589d1fcdedc515fee36"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "b09911aed708e8b00468189a086b8ae06053e318e8e94e40e3479da979806d89"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "ea973d4d14842153f415eedcad137c5ab8b8e9106fab015ec4f0f0e4680118ba"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_GoogleDataTransport.xcframework.zip",
      checksum: "345ebbb89ab6e7330a7d5c2163fe2bd1b84da080afea26fee2f24e22f2828ba9"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_GoogleSignIn.xcframework.zip",
      checksum: "ac699430ea6754ff461d8c29b2fe2c64b2cc31abf99d1ca72828a70bdc52df8d"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_GoogleUtilities.xcframework.zip",
      checksum: "01f9eea29dcb49cc44ecd320bde520b4412623d2b22c05c44198c315acc459e3"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_grpc.xcframework.zip",
      checksum: "dd9cabe8e27f1a0cee542ebfc7b09fa7868de374625689d16b5bb271db38f61a"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_grpcpp.xcframework.zip",
      checksum: "70ca4eeeaed28985d1f5708659c6d6e338743c5afdfab5537cf220cc8c00edf4"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_GTMAppAuth.xcframework.zip",
      checksum: "a3b730a17b3fb0768f4c155b68beacb0e36c1f9d041aa5bd86ef130e59bf1282"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "d83145cfc20e732b7a13df39c56a87852d0d79b2addfdcb58cc1526422291c95"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_leveldb.xcframework.zip",
      checksum: "03ba986957d1606901201405902c5b739723f2b2dd2b671be10c4ec2cfd28c6c"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_nanopb.xcframework.zip",
      checksum: "34a2dda303b91639e7ccfd2610fa4cbb55a7f583c9f27b627e3387dde5bdd84a"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_openssl_grpc.xcframework.zip",
      checksum: "d19351a77a0f68102b124ef43db9d6d5c97212152a1c5a3e26196b81f368dbdd"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_Promises.xcframework.zip",
      checksum: "e46d1a39be4840a4a563410705533d913cc7cc1668aa2db66e904d7e91dc4ce7"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_RecaptchaInterop.xcframework.zip",
      checksum: "59128b22e3bf0d9efc493a0ff9e37728807c7bba3bc41add701bb0027fe24b25"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_SwiftProtobuf.xcframework.zip",
      checksum: "3a5be9bf2571f35cf8ce34d6660fdfb776391a0ae750532226c7911ff8c805c5"
    )
  ]
)
    
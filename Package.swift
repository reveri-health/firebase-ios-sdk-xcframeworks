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
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_absl.xcframework.zip",
      checksum: "403597b7c1d2e290c3b3ece78195dc63040af5f755848fc008496cc2b7f53669"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_AppCheckCore.xcframework.zip",
      checksum: "d5d1783617a3d1f8786e6e7c638965b85340935f9d4206e29322da7b3d13838c"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FBLPromises.xcframework.zip",
      checksum: "e648fdeb365552744ce701a9dad44c1cd3749993c6c0e5ddb20f9a6df3575ba5"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseABTesting.xcframework.zip",
      checksum: "4ed49384cf1a12ede2edf58ec1c346a7ce24f041aa398f1e71f42b99be578d52"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseAILogic.xcframework.zip",
      checksum: "b19a277a706c9cb371d6cb33425a7c220f83a790fb1babb89101e6e38457357c"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "b2472df4359cad3ea504afe82b17160499f0c43f56f5b2431944e244a13c883a"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "7e8528de04467fd186354ba2dde28ea6f50d7a730ce590c93825fbe02d0d887c"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "776921c0fc41813c78fe123bd8a785a1c62ae70f05caf2cdf045672d83278864"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "e2f2f862d9985d3a5621a16e395d14b9117598eae805d0acb5d3cf899d4a5827"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseAuth.xcframework.zip",
      checksum: "5c2ee95aeb7718ae98fbca60cf2a53fe5fba45bfbcd6acad4a8cc55d3b0ab57e"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "51b6d769a8e7f8970d9fdb69dc814da08918328b51eff337a272e8facc71e2c4"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseCore.xcframework.zip",
      checksum: "502143989e9daaeee40404c721d8dd9bf35e772aba2f947ee663e95dd9d31db4"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "fe15e13725cf58aa910bd601553553efed6666451496ff0ef33775827c970231"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "789f402295dec4c63248f8f2842bccb82fb3cec56e09c44e84d16afb22022769"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "8c3f2b41d48d705be1971a865883bb806d8c404352120c31364029fba18d82f1"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseDatabase.xcframework.zip",
      checksum: "e336a7c06c48d5341abe1d764fb709a033c4a6a6cb6e968471b6424dae3993d7"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseFirestore.xcframework.zip",
      checksum: "65168da1fc4b4280390f552d37ce224a1526a7efe1f6f1cff4e02c3d893be185"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "30951c9634e1f8e64f4bcd64f08fd5cf9690ac272dbcc7a1f74b121aa47559f1"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseFunctions.xcframework.zip",
      checksum: "0199080429640cf24b523a6126aff9253a5491d4d6f7c389fe3670474bb13635"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "351760bd79ac1b003a9dcb00c4aa1bc0e2736acbc767d33a1479aadb664e7403"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseInstallations.xcframework.zip",
      checksum: "c243dbe5b3d7a96573e60241fc685ecc00b6e0feba32e7064ef8d105481e4810"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseMessaging.xcframework.zip",
      checksum: "6105c663b02b0301df7d4bccbced6a1f9d28ddb7d293aac87ef5d362394b7aa8"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "006f82d12363a853f4f36c30ff327724834380245da470deecee5100a346e83e"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebasePerformance.xcframework.zip",
      checksum: "be797fdcfbd6e90e57e7a2b59411fa323310ff2ea3294723adc875a60a6a1b67"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "9bc91982f140b80836e538352e2d657fcbfe2c61312a1e73015e2d1b4d1de536"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "d813c1b776332a8c1ef60eaeb37b546655cb0742d667acd5676c46d9ada5fa62"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseSessions.xcframework.zip",
      checksum: "484fa90bc4aabbc69cfc09e767e05838a47792cdf5d045b5505a79e94f2f4173"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "0fb6861690d694e65f1e47a8b1a902480b2c9738512735db0b1a8603b52047c7"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseStorage.xcframework.zip",
      checksum: "49971aa7a67e3a31e27190a7fbf8afba4882ad46df1a0600dd46e2dae2853b76"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "fd8b7fc1525bcf19c1894b844afdfe4dba236195fd2dd0417764d1ae088eb1e9"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "0d5bf7cae5648409a394dafe93944937e026ccc3d0fdd15115e170fb510db455"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "fc9026e62e90c425b0cb668236f6efe025604fd93236842aa3ded7fc421b4b89"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_GoogleDataTransport.xcframework.zip",
      checksum: "ce348f44716c0dc4f3fbbceb0cf832fe306d548daabe1ba08276a7c4820ec6f4"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_GoogleUtilities.xcframework.zip",
      checksum: "564ffa914fd8bb24add4c2fe4ea1d66def75b44748c9e0842a164f0f86c396a8"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_grpc.xcframework.zip",
      checksum: "0161e42cbae96f00546e5c6f6d2bca526e428f53341246d3d8f300baf0d183f9"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_grpcpp.xcframework.zip",
      checksum: "f6b50f885c885f77bfe55ded3d746eb26fec5f97f906ea2dff486a339b7df62c"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "b4bbdf27f8fb8673944ce0fd0aca55185b2eb946669fc5f34455b63918876ea1"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_leveldb.xcframework.zip",
      checksum: "148c6c8a5782bb3e9e5ff6e6c4bd010a5df19fdad4a14d70239c1cf573649c02"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_nanopb.xcframework.zip",
      checksum: "8ef83ef22ac58c8f98d99590b2553585c5215b68fd65fe968375cb7f18af3f4d"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_openssl_grpc.xcframework.zip",
      checksum: "fcd6f6892215f4e44eef67b5a2f9684396972cfa86d6921b7227886ed46e8177"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_RecaptchaInterop.xcframework.zip",
      checksum: "6d608b4f998c0a1c0fdb5a52102a442d838eca139985f87e72c54b1b28b22ab1"
    )
  ]
)
    
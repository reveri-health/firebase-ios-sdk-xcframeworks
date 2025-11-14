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
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_absl.xcframework.zip",
      checksum: "383c645a448f38dd1cac2457a42f5955bf605dfa5ed6a1a6f781ef07839876c0"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_AppAuth.xcframework.zip",
      checksum: "db4cb708ac56393d927c56af5e35334ed32c56ec9a5404f70ce700a675644f93"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_AppCheckCore.xcframework.zip",
      checksum: "ac2bc3b4c594ccfa6823136dfe91f280f2fdf90127b38868a6bd15809c4b52ae"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FBLPromises.xcframework.zip",
      checksum: "aecae20ba5401ee968792e887f4f98712622819ffa4fef8675213da1d6a58125"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseABTesting.xcframework.zip",
      checksum: "4d30ed4a5fb8b651a235f0fa88c02fb880fc41c7087b9cafa0da963e48b56ee6"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseAILogic.xcframework.zip",
      checksum: "06bab7d52d2931029ee658a34d9b9ae3c475fac602dee606d7e95bbc1955fe50"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "0bbefca20f26b895942cef76e36dd3a52a6729338d22489fe5dd00f8b46f4f9d"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "5ab04537ec3b9d67b99d929a278d5e9bb991699c43d7e54a53cc6ce8de45265a"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "95ee165e92e5f22ae5eabbace34800b0a66285d108c2fa2a091f12b1dcc4161b"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "cc22321f90afdc056ed9871d3cad36152ffbfd8f97ac43526878f3e0d10c1062"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseAuth.xcframework.zip",
      checksum: "a604b8ac2d5f45441d199cbf611fd45e37b5a8a928a6e4ec5b1496f065545616"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "504ee0e6e4ee8b080edc7f11216d396d1d6293e4115116c2f9e95ea23a6994bf"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseCore.xcframework.zip",
      checksum: "83c70fac6cd7aa3cf02e730006492962994f3f1ff14a4d0cfed464f109147499"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "3f8a9f9e828da2612b9dec9b1c29c31877fa1a00a133d5ac94dda6ec5fe52c2a"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "0097ea50b6d05ff965940831289e748b1f490bdf870a9428e5149091a545dfce"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "a81183a5f5c34e3ba1f777741882e8d90cc9e936fdf2e4da9a048f76b67d26c1"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseDatabase.xcframework.zip",
      checksum: "13555f301b440234bc1c8ed8f019630be7574538d91ec0fdde32cfa802bba30b"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseFirestore.xcframework.zip",
      checksum: "bcacc2d33b2d3c05967210bc693cf93db27b6adb5b9dca3b6ff926adfcaa446b"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "a44ff66865f0efeafdccc96b0c9a57ad2058611b0ae82f615b1057cb95f86f7b"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseFunctions.xcframework.zip",
      checksum: "d64c636ca0a3286df5ba7a9ab85a341dc62921e3e8878a79a9441cbfecd57ebc"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "6010192dd07a5d4ae618022adbbce3f2744361d1bf8f2f18fc2360ff427195af"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseInstallations.xcframework.zip",
      checksum: "eb5762d421062a4be382d04a423de91dbefba36a7c8ef299cebd3c116e6aca01"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseMessaging.xcframework.zip",
      checksum: "d3971611fe3fc3ab90b0b29cf068f4075c45e32b5957b3a9ef9083da269e96a1"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "93457e5066ccc260727f5e8ab7517975202e4f9c54f9fdb5bdcf97bc840d6589"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "3895dc5b557a747f20bc2dc0d36c34a96d9d50f9f889979537b7f49860717504"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebasePerformance.xcframework.zip",
      checksum: "57928aa93ea86cced50fca19967acd3e15b9032fee60afe459ce783b4bedb71d"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "0bf89ab8c88fdd6ca39ecdb82ec0a9c3c34f8e45d9f9d66b6b2b3522a6564898"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "cff6f480a52e1ecc5e978b3c0488c0262963a0319d916841f2160d55ea1092f7"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseSessions.xcframework.zip",
      checksum: "4cec163c791077336b776a4424d1406b93f99da7be5a70bc076447a739c06775"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "2b248f9dec0b722e5c9bfac0db55f6e69f69bcee029fad214762838eaed58bf1"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseStorage.xcframework.zip",
      checksum: "e212d4488445a3bce709dc5ad494669aa5bfa37938f3a86df0081a872fdb3ae9"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "03e5995250b7803db9bb23e9b93179ab05fe8a0160e051994cf6a3e725c231ad"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "65da6a96cb3c5f4869aeef8c58a632125dde8e4f96454e0c89b3f676dfa99efc"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "c7dec08f54ab7980a9516ed06dfd5ebdf29a18da8fb1d152c717a9cdf8a40f46"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_GoogleDataTransport.xcframework.zip",
      checksum: "3c769c859f40c875236b9c42b7d669ad09a9c1f79a49bfac1e6ba368149de189"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_GoogleSignIn.xcframework.zip",
      checksum: "21e4fd4febb6f0cb951ecd886512c7171b85d44c95adbdf577361b7d51dc5918"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_GoogleUtilities.xcframework.zip",
      checksum: "17150ab80a9660849207d3a69bafcb4829ba2a97e7d66371e6411a819baaa034"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_grpc.xcframework.zip",
      checksum: "db60eddddcfa78ae50138681b2c143b66b0e7942d07ca4ff368b629b8d559c0a"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_grpcpp.xcframework.zip",
      checksum: "f477e077b312a9bd5bc8c956f64804861f99f6861c68ac7968ef04ab0bafa72e"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_GTMAppAuth.xcframework.zip",
      checksum: "1877b3a4db14219419c527c10d52c048dc9fd6efc1837e4ebd720441380e3fb6"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "b2a30b9fa3fb3dd2925ed4e2936219b3da26c0fb76bb57a6e4a1f16f75fd8db4"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_leveldb.xcframework.zip",
      checksum: "c2bed7a133df62e46cd845b223127f79f8ff9349480555b6f241b47f3e8f57bb"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_nanopb.xcframework.zip",
      checksum: "bb79aad49a1213ef1787e75df56c41efb714fdf5ba6fe0c55f38dfdf115d89c4"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_openssl_grpc.xcframework.zip",
      checksum: "145791b6c1c1964386473347d00290d71a7cdfa3341f4eac9a1f31ac1c2ac1a7"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_Promises.xcframework.zip",
      checksum: "23253b3a18ad7441e15b55271b4411ab4e8808e507995164b62075f69a1c24a2"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_RecaptchaInterop.xcframework.zip",
      checksum: "1f03f8976c34f81e59808e0847ed2961d439ca7037404975d585f422ef3d5d05"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_SwiftProtobuf.xcframework.zip",
      checksum: "f1c204472598e053b4ae0c2ac30e6db24205f8456c35d0a3f11dbe62e2d9b165"
    )
  ]
)
    
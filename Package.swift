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
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_absl.xcframework.zip",
      checksum: "912a0f4e2f81b5db0a0024f447e9fa8806ff2bfc0618fda9682995df2b11b235"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_AppAuth.xcframework.zip",
      checksum: "415d05874fa29b9bac0dcb442aafe9400d3d1aec5f6aeee0bedef8ea3e45dd4f"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_AppCheckCore.xcframework.zip",
      checksum: "223973e6b0aa3715f5e1622f5cf0ea5bc2f03e4bc9924296a268eb336a279aa0"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FBLPromises.xcframework.zip",
      checksum: "1d069fc0125587055b9dcf407926b51df24094cb87060b1155e9110031985c9f"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseABTesting.xcframework.zip",
      checksum: "edda97ef3f8ed31cabd9c21fb7c3c210f5f9b5944b7f2a665a27bde1c7b91077"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseAILogic.xcframework.zip",
      checksum: "b20fd979b053b523d83322462521b7691d7c12675c9d9e49ae841d67f7dfb740"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "d07a01a644decd238d5a642b994aaf9612eec006962a2fe6d7c872e9089c0be2"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "d774f44e6ad0687e39d900a86acacacf62f9f8b508736ef09f49681726ac8a8c"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "643841fb08d22a33fe50b56c1105b8433496893f45c24dd86153181c9374b998"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "e35d73ebe651dda2b938c6e06484012fe3d517cb25a63de5e5b1f1aa6faa1da8"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseAuth.xcframework.zip",
      checksum: "e7aec8a53e5ba4fdcade6a14d3278d9b748dcf3d82b61aa8aab4f514889cdffe"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "9ef6d7da31b6c004d81765e5f2dd77fcd82cdb93a4692fbdf4b5c5f90db8c77e"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseCore.xcframework.zip",
      checksum: "cab7b866c4ce93bddc8554ca7ea9bd11b9cc05f5bdd6db433bb4d6affe8934d0"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "1cb835a2cb250ff208072dc9d8d7b3980116c8a2e080bce891f9c982f656842f"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "3ca4c3ed621bd44f959d27942cde59770c34dd6e0eba728486f790d30be00bda"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "604bd999945b49e074e121fb55eed6d8a12c8f737d69e3cbb6bf37c7f27ad332"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseDatabase.xcframework.zip",
      checksum: "e7791acd2e6fab90e105a396cd099f0a975e676562ca6e5253e3795bc78d1086"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseFirestore.xcframework.zip",
      checksum: "11694aa139756bbe45cb4418675fb23a88a35f2b581cd7d49d4c6c7460939d90"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "6009bbb83ff644fb8bf649ea3cdf2fae06e419c665a04bd87e4b6ce8844aa5ee"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseFunctions.xcframework.zip",
      checksum: "678c76ac72bbb3e034216be7e235d11067074a14009c70d90998fa5374a712f4"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "5aa159a178a99790d52cd6cddef4281c0d598e68bae27599f330fbc66942d684"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseInstallations.xcframework.zip",
      checksum: "133f00349c0148cbc5d3d6015f8d257fc385d636b228cd0b9ea372de5c377d9f"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseMessaging.xcframework.zip",
      checksum: "203bd191aa4a4520214c9df587c4bdb9bbf7dc2dc4404ecee4b0b0edacd18dbf"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "5a270ca68480e91f40ee98a82e40b754bc00489be9ecff984d7c94ba6149bf92"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "15df63e899b624506d92a7d5bc0c4939a8f8a85d5f15784ea5fbc56be59845c3"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebasePerformance.xcframework.zip",
      checksum: "99961135dcc483e5ad823d486f2c2ef92f5dbb391affb30576d9c25b89ef9348"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "59533d8c7c44a3ad51d256266db64ef05cc01b30db54d201c80f3afe28d31289"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "bd0f9932b14baebb672c61d94072f43e7ba8db3d6fa99fb2a8ea971f6463e26b"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseSessions.xcframework.zip",
      checksum: "2053eefc8bc664d6fd23c58b6fcaa71a48cbc6e631529580fee2cf3f91f5a640"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "41062497aee009956ac3624a636c65b262ffd5c6dab5929e3e3aafeb85fb34e7"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseStorage.xcframework.zip",
      checksum: "208b7c18bc786093c2d528238916e6d3f84f5fee8246fb86dd4e2cfe75c7cfca"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "af4d56b25ef7f4d91c7cd77161ea21432479987a37299d9d874462c25ea3c6be"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "fdd867d1ff72eaea3238896ba17423cca92ad0396135adfc8df625ee59104bee"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "4ce0c966f0214a6ccb6d3fead98ddc3782d7a27e19c60bb7a58e9382f767ec8a"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_GoogleDataTransport.xcframework.zip",
      checksum: "4bcbf176691aa880d582958526ef16f0181da79f1da51b5b071d19bf74344c3f"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_GoogleSignIn.xcframework.zip",
      checksum: "d197b9c4bf207e81a42f31fe71ecb5375621232467138b3e76417313c25040c0"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_GoogleUtilities.xcframework.zip",
      checksum: "b30fa8b6cb92d529cd547acb0b0bea55ab7ba967e53b09b516219562bcf818ad"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_grpc.xcframework.zip",
      checksum: "711386689470b322089217f27e5e2f4966ea01007a4183d414bbd602daf86ac1"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_grpcpp.xcframework.zip",
      checksum: "44c45c50ce8a07410fc4f50418ff4a65640b69617a98fb44d6709f881add469e"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_GTMAppAuth.xcframework.zip",
      checksum: "f3f476862b0afbe7f49efb7921b74479c6b4650ab59211a5925934904f36f652"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "541fa2e5d94c400d125a9537c2f4ff34cf15d6dfeec1fa3fee8075e3713fa9c9"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_leveldb.xcframework.zip",
      checksum: "dbdda8cb5b9288a5a98cb3f777284256cf5939d8dfb05a8de65fda01fd6436fc"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_nanopb.xcframework.zip",
      checksum: "d97ff2ec7e3b36ee1042e6dd07f02e3052ff4217f89dbce8700244cf4237269b"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_openssl_grpc.xcframework.zip",
      checksum: "8738041732d3457ad4e9c0934a3aa7568453ab8d234f8af7b7af57efc1f16d91"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_Promises.xcframework.zip",
      checksum: "4fd27869d034fb8d7911701ea0c10ac0e96cc27ee5630b68b3313c749223e39d"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_RecaptchaInterop.xcframework.zip",
      checksum: "ad3abd40cae1ad40a887f5a980bee7fab7fd909641013c6e0f801521f0d22b83"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_SwiftProtobuf.xcframework.zip",
      checksum: "1b6458dfdefc9ff13d4256586be8787b94fbe2e48bbaeb1dc0b6b672faf58754"
    )
  ]
)
    
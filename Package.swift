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
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_absl.xcframework.zip",
      checksum: "a996a3d919a47e2369ab4b697e188d14df804cbaeb3b63624b4cbc70522430bd"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_AppAuth.xcframework.zip",
      checksum: "eb0c7bc1aeebc363e14f374a03ccf1ee561d44e37357e73f84136bfbde60c5e2"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_AppCheckCore.xcframework.zip",
      checksum: "a796ac865be75ceef8ef7b8219bcd6bf1bc6091289503b272631dc358e552dea"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FBLPromises.xcframework.zip",
      checksum: "fc0293461c456de765f0dfc94dcdf24505777e32a85009bf3df2a12c4fc51b05"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseABTesting.xcframework.zip",
      checksum: "a5837101ca4e57f139f3a487daaf17db5aaa7088225a34dbf103ce9f717ac8cc"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseAILogic.xcframework.zip",
      checksum: "57d01be20c5dd63ad43bf13800b0d2d8da1a77bfcad3029f3271eabe540619cc"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "11362255eca5cd498b0b7c57bf4fc289f460e9c19de626a3ad96e2dfe7615454"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "90be4d7b231606d2246bd12fefa12f54b63f946abad8c7dd8329031f95608a31"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "53e0b593e00d986d5f704833e895a4724b39e97f070303f147c09f7e02a1af9f"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "2d6b3a49d732d1ef9076425a10d3a54b9a24207146b96c8a8d1758ea472532a2"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseAuth.xcframework.zip",
      checksum: "60b152ce68e89bafbfa6fc1f44de05484623344a98d0f78db404be1a853c6a78"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "3ac7a33aa2ff2fa4fd1c7f3d878e1255ee745fabd3a8fb794e80ed17cf5753b4"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseCore.xcframework.zip",
      checksum: "c73a5f9ac48a2735721c47d299a34e7a0c9054dcc2597e3b8e7347c3f46a44cb"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "2df3a3a7d90e49108a953dd0e4eee6a218a9f602dfed2448629e612aae361bce"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "43173814137b758e0c0053885acdf9f6a4f896a9213f89d752dd38f1e3e9bc3f"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "93aa4c613a487c7c469dfe0cf8ab86cc4c2378731cc496ba6a04504f77d6e589"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseDatabase.xcframework.zip",
      checksum: "126a9e15454e4cbd8416968c5bdad1ba06c812139371d6d6b2cfd3924d78ff1f"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseFirestore.xcframework.zip",
      checksum: "1da3817c25d6e5ce57fa39edcc82b85a1cbbcc641356968ded633755f3e120f1"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "2405d7892c0996f561b9f166655cfb645e421d74702e755e10dcbe85d33aae84"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseFunctions.xcframework.zip",
      checksum: "db47347c7e16ecc9cb30b83053df937696f5f6a2d68b08d1930d154551897cf2"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "0353f5048cbb3ad3db19e4d369689283bb5db37c42a15047f427cd26ddf603ef"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseInstallations.xcframework.zip",
      checksum: "9836f3b0aa7c0083dffe97461868b60bdc8eb9496c45dd8edde637fe0dba707c"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseMessaging.xcframework.zip",
      checksum: "77af6a41c45ae9d44099c5cb89efee472d7ba1a2d7c570bc46936553d00a5754"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "ae2790a61e42184f53d10b4b1514991d84dcb49db2e3fa01beffe42882af9b0f"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "b28835c44ee4a296c8226cceb4184d5d527f0ae1fe353e7db013ac973b75ec10"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebasePerformance.xcframework.zip",
      checksum: "f2888c28dbda6d771688db39dd96eb73cdacb03f55dda11cc2126debef4c8a79"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "19d8abaf15c74c93f6697fdd511f28964ff2cdd9580e2730f0fcc4d7b1b71c87"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "4a0870e6bde69a028c17be887cf84fc74bcc1b183519664926978c24d592f5eb"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseSessions.xcframework.zip",
      checksum: "62fc536d371a1cfa4d97dcd943c6ab1a18fcb63193f0aac4d59e6a4d0cfb87ee"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "c5fbf93237ef1eaf41ca8c6c58ee394c31bee50992f295a07eb1d136cddee06b"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseStorage.xcframework.zip",
      checksum: "1ba14f221e8cc5ca4703c8e0d73ed6398fb96bd7c8fcb1595be0ea4c5e3202fd"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "9435b71da9d1f8cb75c93698c6717642d1a03c150842e60904ecde46735d71d1"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "6721c47e85184a281ca1c642758bae8f521ed48132e39d2090333a9648cbaff9"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "851a8d5d01c3c194070fe28a47235837f0e81c1933a795fb3441dc44381dd1f5"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleDataTransport.xcframework.zip",
      checksum: "97314eacbbe6dae197556a26389a787846d2312d921944c76c8f4c4d3539a942"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleSignIn.xcframework.zip",
      checksum: "05f38259ff4d202ab3da1483da6ee0634bf5b60d0e2f4b893be644c34eb263aa"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleUtilities.xcframework.zip",
      checksum: "d5ca126ee26c2127b15c8bf32cff35f6b9d4020ecd935740a2fb5203387753f5"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_grpc.xcframework.zip",
      checksum: "1cdcbf3efe6c00fa9cae0ead466b7ab9a2706884641302239162e6cf0ad2a7bb"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_grpcpp.xcframework.zip",
      checksum: "2968cd73b72ed057701c47cf1e0e5e7bfd18c2bca26b0f029d92921ea14d7bd3"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GTMAppAuth.xcframework.zip",
      checksum: "244dd9b446d4fe4dcc8c6027ff0fb1d5315231bcc368dc733bdb6a6619f2740e"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "aa25ea718a87cdd31d751f291f90d1843ee0afea4df6efa880fc1a3b00645bdd"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_leveldb.xcframework.zip",
      checksum: "26b67d0e9ec5d5ae50326f24d1a238a6cddd3cff9a96d6de571d3b13f4c6cde9"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_nanopb.xcframework.zip",
      checksum: "35f9284c469770b02ec21b9ed4b6a8ae66d470e1a9533b1164c802f0e683290d"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_openssl_grpc.xcframework.zip",
      checksum: "6d750d7e914c614f30666b357358bc308a510b8ede1b1073f294a5baea344d5c"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_Promises.xcframework.zip",
      checksum: "7ad66db1128d83c53896598acf86122cfda00bc1fd98b34dbcb15abe505f7a79"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_RecaptchaInterop.xcframework.zip",
      checksum: "843fc789f223dacd0a21e38a91e042f620529c12c18849fe899a9ea9a66eb1bf"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_SwiftProtobuf.xcframework.zip",
      checksum: "989015f2d721b131328419fd0e2b557a45ed368e48e35c35b5573a910a7b03ee"
    )
  ]
)
    
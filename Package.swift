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
        "_FirebaseMLModelDownloader",
        "_GoogleDataTransport",
        "_SwiftProtobuf"
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
        .target(name: "_GoogleSignIn", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_AppAuth.xcframework.zip",
      checksum: "901f88fef8120270527fd4c8fc51af3885cf7243b34fc82ef21f06030b295f80"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_AppCheckCore.xcframework.zip",
      checksum: "ddc4fe597aed0fc475d5a0860bc2b859f537b98ed881f37f30649816c6193437"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FBLPromises.xcframework.zip",
      checksum: "52b9b156f62705fdbbed7498378735f32265a0916cd2c6a50d1d1d4623298a96"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseABTesting.xcframework.zip",
      checksum: "25dd388fc82991c8f0db8d1d0a6603c9b066aaf0ecd08e4342b203f0bbbfab75"
    ),
    .binaryTarget(
      name: "_FirebaseAI",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseAI.xcframework.zip",
      checksum: "4a7e3096349831e33023d3238f9091ff272a7e1cc42e87111ba18155e7421753"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "8ba8c33aedd16af8824c83de0edf48b1a2e36a1b4b7023377583cf7716b549ca"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "c02a69975dbaf65fbcd223934dda5e404e52c96ef6958babb7a902e9506795a1"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "7ca63ac92af15da8be66ec6d44739fe69dc07bd99e43ef8b597927e65bc4ce4d"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "a7cadb79162c48ec5a646ecac11cf7932ea980c9d39ac4e0f4e15cc8c44c591d"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseAuth.xcframework.zip",
      checksum: "34fb6a5003c9892f69908bfba3f4044023a3d28e6678616e15bf5b6ee1dd28d1"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "82c2c60b77965246a41e99abbae355d01e5d3edcc98dd33cd606cc003eb6bf3b"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseCore.xcframework.zip",
      checksum: "9e559ec667feb8ee2ca20ed728c0cb58a44f9a6131a0d2351b1ad9eb5cced30f"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "ae013a1539719957a3b4da190bc9643f24c3eaf7ade2a06c5a63a09754eca586"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "f4b80c48357cef335971180a77196a18ee9cd41b222716677f5aa29dec853ced"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "379442bea02e054c94d4932b913754f81e165d7a815dc3ee9b0c609daa052ac9"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseDatabase.xcframework.zip",
      checksum: "5edb4ad934a7051a5c0875f9b8d0cda004fa04faaa73974fb4f884614f82f999"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseFirestore.xcframework.zip",
      checksum: "dbf3417819e0d0e99e2cc0164c76bc04d64aac90452ceef9b4ad1e52531102aa"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "a7fff319bfa90935d2aa79e522ffcf92678346248e89d9f923a8eb24285641c1"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseFunctions.xcframework.zip",
      checksum: "b916d618d0f4668958c55ea36dd1d15ecf8f0e5926a1c1cad9926f1005a24cbd"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "f5b7b13d7c09abfb7c08befa0bf6006d09e69f15c8bb9d4dc2e222aae3c47079"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseInstallations.xcframework.zip",
      checksum: "b8324564661a475fd29612c925b5f952ee878f1c5e58d91a1a003b4576c67703"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "a9f12a0d019bf0b2c09eb4291dd038b982765e0b0d2df24ea2c45453132ef730"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseMessaging.xcframework.zip",
      checksum: "7cc4c50dc239291a29f4354c2eac5781bd092ac71646ed73840b973e955c4012"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "e6e2242076446eea25464b8550a47658ee73862769a872ccae26b2187fc40f43"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebasePerformance.xcframework.zip",
      checksum: "ccf72921124c3d9ba18bbb1d95d28ef707e4069efb18b7049e96c23d21221ecb"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "e211bbf7e6a4c5c0ba441781dee851cabb5009eef33e23731066f3c9c84de854"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "17eff010fd48afcea1fe6f1041f831c96fcfa8f073e40377d79ba1d8953e9621"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseSessions.xcframework.zip",
      checksum: "abe00342d538bd956b4d6a2303d6cb26f85753402059bb1d04b35a6f18acacad"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "f135c83005f2da781cce0fbcb80e1fcc16d713e178c0cc55a4f64bdc4bdeb440"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseStorage.xcframework.zip",
      checksum: "a233a7e7d5823c45b9dbfaa30678ff9d7f6ee5e7b775f950da9c787edbedc49e"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_GTMAppAuth.xcframework.zip",
      checksum: "e836f21ce43a36a489bfe16221a1ddb4a282229a163590aff8d285bac02c43d6"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "94aed20f62e4689314a6a30db22fa78614d1b6083242f467d157d55236233aaf"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "0d6545c3d99a89f7aa7c7da2a5218dda619543c8a45a6c3c45e938a310f47f50"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "078209139ea608ceaa058a4781a402afc98a5844c329bdf7be9db213a84808bd"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "2ae1a72a14a587e9bbda46c02393f8f5c821b3b26c2eb334e4f328faa9483b24"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_GoogleDataTransport.xcframework.zip",
      checksum: "baae262b2e8bd8972e2cc89b6706142e7e0a9cd6c9843ff830c58eb770b25add"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_GoogleSignIn.xcframework.zip",
      checksum: "ad22876ddbb2ee792230af8121b2c923c53682015c65243e60538e9e113fdbed"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_GoogleUtilities.xcframework.zip",
      checksum: "cc4b40d47c1c0db491bb0549b43399c698cb56bde4264a60945016e622313bb4"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_Promises.xcframework.zip",
      checksum: "d683e61c48bf7aec5cea57869a3ffc3d24ef617a14f6f0e435126da7dc37becd"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_RecaptchaInterop.xcframework.zip",
      checksum: "4eb0c2a3dad4fbc932bb102e7ea24609f7a36facda64f81211ab986fda686069"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_SwiftProtobuf.xcframework.zip",
      checksum: "7d7b8bf7b04d1703cd366533480a1889633ad2b001532d7f7433df27415d0391"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_absl.xcframework.zip",
      checksum: "4edc72b3570ca2c6b34e7cf334eca91209a839327786adb030989b44f43e4d9e"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_grpc.xcframework.zip",
      checksum: "b1e61eefb41e7de561af2315fb727b9e0dd4c78604e98943b5f455bdb2b247b9"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_grpcpp.xcframework.zip",
      checksum: "78a6f94f3fff984fb79d23dd5831de2eff4eb6c99fa4a0f305364a7aab07bd22"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_leveldb.xcframework.zip",
      checksum: "5e443a2acf3b35c492fe0242f64eb9a00202e16dd1856591598e995dfc55511f"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_nanopb.xcframework.zip",
      checksum: "71b8832a957f03e8723ca06fb29003b6aa980db5172360a229acaae44a7bc68c"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_openssl_grpc.xcframework.zip",
      checksum: "dfae61022bd31b2411095513dc5e3cffec354e81df50cf0517d54f1855e886ff"
    )
  ]
)
    
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
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_absl.xcframework.zip",
      checksum: "28b3f7fba7dc2624aba03eea6d62157263711267fc0b91eaeac3fd358818d0c3"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_AppAuth.xcframework.zip",
      checksum: "3d8fab7f8a7d56577c70ac5b442f9f6a4939ee8e063d166110c427b9066c68c8"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_AppCheckCore.xcframework.zip",
      checksum: "788312c17759aff6f6fe7771efae30e3a635672a17cd83e0d362e5bacb3ef0f0"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FBLPromises.xcframework.zip",
      checksum: "9634c29ec98c5cbd09e1a38bb38fb4c325c38531bbaf8db65e6a92ebf59979f8"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseABTesting.xcframework.zip",
      checksum: "2e6dc78e1e4f7f0eb902124551983b5a0253b53929c5160bdde25fe3efcc12be"
    ),
    .binaryTarget(
      name: "_FirebaseAI",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseAI.xcframework.zip",
      checksum: "97393b88c45e30e6f3891cbdce85455568e7bc0576f965896ba4b6f9e1a90ac1"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "8eae0cfeaa7c7a697616289ddb1b723d736fb96a6b5b3e1704f0d3a1ca112bf9"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "fa45b26c39097b7cebd873291875722ba1c71e832dae682d874bf089ba994a6f"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "a342de03bd21415e78bdffd2a0cf9c23f471ea8b2e634e49d8fedf48d44f36ed"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "fcd5c61fff0906fd8dc10dc281c3e629080fc968f8d95d0d8be7bf4d61fefad1"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseAuth.xcframework.zip",
      checksum: "f806177a9b10ad48cc178dce5a60cb761a8d87063b371b4caaa84b405d2f7929"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "b83469aeae81f197b1ffa05fdcaa63778e718dfa1f2f6134ad33c4ac16b24617"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseCore.xcframework.zip",
      checksum: "aaa61d228fd4c26277e09203c2e8765e9b3493475b80f953962be93367d403f0"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "717b8e87fda2d3d87d360f53cedc4b4bd4f2e04165574bcb17f3b4ed72ef9c08"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "05db90d85101b3573a5687022fb7be1f1a303a6df191ea7d4b1fb6b048b4656a"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "7cc97ac642effe5675af293e383315b8838c61cfc620af1d0eb45961fcfd98e8"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseDatabase.xcframework.zip",
      checksum: "37713e143afdd8dd511a97dd3e5403f441d87da82a289a2de7dd588956018375"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseFirestore.xcframework.zip",
      checksum: "f629c602e32318fdc8e54e247cc9dcbb4cb68126e80c996e19a8b478c4567518"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "eedd764fac8ed49ba4234031393f565ad8fd5ae9eb3c28889cfff51b0d4ad003"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseFunctions.xcframework.zip",
      checksum: "408ad260de3c6c6e1a119e1f3d54f9642033454d8e03571e36ec26f5caf97651"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "1b10eeeb0bcd7f4a1fdf789ea5c99f26a598b1d877b2b93ed3a78ac494e17d18"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseInstallations.xcframework.zip",
      checksum: "25dbcf17bb933b3df2503d22996341ec6723c95db13b6981ef8ebfa104aa6525"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseMessaging.xcframework.zip",
      checksum: "4133e3c419d1395d3028c3caf42242b9f65409382ccf8466e1ecb5d1150c25e6"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "23304b7badc32d0bdb22b5c22c0856903eab9cc0dfb6c043b5bd5ffaabb933f5"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "5ffef214f794daf98ce0312e36b7b618b67cdfdff4338b63af8071ca14d51111"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebasePerformance.xcframework.zip",
      checksum: "09eda434b0345d2bfc6fb7fd2c92a51062bc99860fbdf677bf2cd8865901b562"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "87d1fab2b534003a6348dabbb4bc60c7b3734f234527b23f7c7b352666ed5e3d"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "aa0bece4e7b107391a7b447f5d1c0818913a3862158128579fcef112f76b0c81"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseSessions.xcframework.zip",
      checksum: "f394fe20849b6839f810f777cbe1fa6a078a6ce5281477dd2bf3c18bbf8aa814"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "59c5690482bdfe9a003c3e2f6bf333928e044055425b47012bd24138e7d01ed0"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseStorage.xcframework.zip",
      checksum: "03a8ef9aaf4803452f75305ae0bffc1ae5ed0241fcf57089dfb6f83b38f43009"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "72b03072eb5d14827be810ed7473804921126da4b0aab76670c7496c04ec5264"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "02e72a8524fb5438849143a6ca32a916a930bf52b37b7eb1cd513b2f5390567a"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "4bf8529373ac41000def401d7fd5bdee460cd3d5bbd8f33c9fcf3c089a7139d2"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_GoogleDataTransport.xcframework.zip",
      checksum: "3eede45d173eedbb61f116908143373f622b93fe8e5fb388c975afc433d22f9c"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_GoogleSignIn.xcframework.zip",
      checksum: "4b20210ed9eaf7ab5d643d80f5274536940405e1b2abf4aa1819326c328f936a"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_GoogleUtilities.xcframework.zip",
      checksum: "efc5b0a74a29c714f0fe71b98ef50293e82b413e0f620b77f1032db60fd20fcb"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_grpc.xcframework.zip",
      checksum: "cf8f6fd3f538789e502ddbc666235147896133244049cca2784527b33365389d"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_grpcpp.xcframework.zip",
      checksum: "ceaa095459c7cf1bcc6de043d78c7c6f3bb20567efc3fe503f992aab038735e5"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_GTMAppAuth.xcframework.zip",
      checksum: "90699275b5536aa87b74ae7b5d964033190dff57974487e953a72c99f9e95007"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "7aa4b0ae25e8129658dfc77a051d7211ed43723754b04d5a0efb0eb65e6e0ae5"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_leveldb.xcframework.zip",
      checksum: "07acc98c224bb29020db6a0efec23ed22d7f0749390a775ad373c2ff6fce076f"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_nanopb.xcframework.zip",
      checksum: "6a3e768f0b59b4fd68763d8fb8d65b4f8e23d09dba19f1e118a145befa17e4d2"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_openssl_grpc.xcframework.zip",
      checksum: "2a9cb45203ee4098173241b654fa32cae49b416f384e237b2c43c9e616a5ae39"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_Promises.xcframework.zip",
      checksum: "15aec8ec2ab396a8798172dc52f181306330e89cbbcba7d27e11d629b807dbcf"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_RecaptchaInterop.xcframework.zip",
      checksum: "43bb4d4829c639b55b953c58c65ff9fb662488b53818a72af29373bbb609a546"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_SwiftProtobuf.xcframework.zip",
      checksum: "0aefcbf9419e057612ff41b01f2c49d8c37beafdba27a9e884d29663170c2dae"
    )
  ]
)
    
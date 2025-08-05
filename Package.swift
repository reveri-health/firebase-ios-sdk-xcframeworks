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
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_AppAuth.xcframework.zip",
      checksum: "dd0b0e8ea82df0cd6c91ded281b6d289d1c9e25373a636cb2715d1507959b3ff"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_AppCheckCore.xcframework.zip",
      checksum: "c2640174455266bab4e76d5b60745dc71aaeaa1f18c28a992354621856136d57"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FBLPromises.xcframework.zip",
      checksum: "95ebf9b871559f171e8c6e62494fd1207a636a4994a502c08fa9cec49a68bc64"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseABTesting.xcframework.zip",
      checksum: "5d599b149ac55680f80fe710da3991f911962e7526fae9d37ef2059698be8052"
    ),
    .binaryTarget(
      name: "_FirebaseAI",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseAI.xcframework.zip",
      checksum: "089ccb47429e6c607422c7a486b12cea34481e23fc07cc63af6e539c2163bc24"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "da9c4527eff2959663e36deee451688f4ed6fe3e8f28759bbb1e302f3cf7abb4"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "cc8617a073dda5e4cab7504ad97513111dccf6832f983f674ed874f2104f06ad"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "8e58d09459dce24ee9fd8bc8d126db8b1ef0ae8e0e1ee3517420d5e63b82fb53"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "20211e8829125b6e723f16995c1c44526157884d36113d5220b341e73a6d2154"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseAuth.xcframework.zip",
      checksum: "4c14fef8dbc185621e013680f1cb06ea9023b78516e6c7195f94f091962d8320"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "140f667c4c9389d1a925933aa79b89f4f5079555ef53d66cd0a15280969c9d5b"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseCore.xcframework.zip",
      checksum: "1b9875608787512f84c74a4f1207c871365b1cf377008d92bcd21c869728fd4a"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "06987ffead7fe8d978d4dab5ac66a9592dbdaa7882aa7df3336a4bf92939aafb"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "edaf1bebbe0551129db3da27e91b4646c08fe02fbda89558a6fec47ba26e8388"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "5016d327d1619cb5f3470f6d5d74e6354dd469afeca2364310d413d73a3a59c4"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseDatabase.xcframework.zip",
      checksum: "b84c269036a15f6e79e947d1af8c3456c297ba4a503802802917f786e26c1b08"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseFirestore.xcframework.zip",
      checksum: "4f6c302fb690ce39a0945d3ce1a8ae06c5e3d7dae9090c313677af4adbc738fc"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "467118132a7dd5f023b27b0fc147ac495c184082c51749a7f15f06299314ce1f"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseFunctions.xcframework.zip",
      checksum: "b97d8734afaf13c3f2eb3e2c2c204e47e2084b98afc443c1cfb65bce6cd1ac19"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "f0c0c4c56f8235d41a1515231906e111aad6c92b788220f8ee7fe0f85e9b92e8"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseInstallations.xcframework.zip",
      checksum: "35aae8cb067a58723822f2a008f45f31eaf8649811210d404b43e50e94d35b4f"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "6e6334a247617a99b53aebcb0ef0ba0f58da5a83c5ea03035f86582147607b70"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseMessaging.xcframework.zip",
      checksum: "8c8b21f9693b39139c5a1cd29e2296a3c338d50fa68c76555a106ade84f65c09"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "e86504bc5d6582302d4034d2a44a8070bbf7853860426bdb7542423f45f2e6e6"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebasePerformance.xcframework.zip",
      checksum: "5365351623a8577194db167acf481867608a1815cd12d9bfc408de1c61acce47"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "9e7a835db7790155f7f51c39745d93598bc80274f7745447eaf0d7da3e3c8f3a"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "13ca00f79be1aec28112cd39c006aeb74ef1dc47d46e7784d64d457332986c0c"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseSessions.xcframework.zip",
      checksum: "f6a7186a04150f474876000029d6986c5f74dd9b45cf678deddaaabfc969f0d8"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "35ce72cf75d2cd1bdc5e4fe5603999593ecf64208cb6ff2955fee92878b23627"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseStorage.xcframework.zip",
      checksum: "c1b8e109dc7412be798828baf68b12c52b130d5bbb37798811c5686af093876f"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_GTMAppAuth.xcframework.zip",
      checksum: "e2a131d4347577737a3647cff2ca523df9a13acedfd2d8c5139b0b257c3eb376"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "9b054afd46ee7757cf8a385064e3e800f15c9776502d6280e7d9be600c629647"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "479b159050517302140736a135a38458d49e8c27b777064b0a3cbab07f4c63fa"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "4afa442547f838b7e5f2954aeb8d2b7af8b457fd1d45db75cf9cbf06a4ae4e1b"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "137a898367ce4b5e733c0e18cc8ccbad8afad7f49528eb59c106779bf7eeadcc"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_GoogleDataTransport.xcframework.zip",
      checksum: "100cf1fa563e580753e9d0094b1c277844f37b239d820d67a940911ba3df0c07"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_GoogleSignIn.xcframework.zip",
      checksum: "6ba6c545b2a79599504ca5bb815d92fc5ea4e86fc31c2fbcb3ce71a684e68ae8"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_GoogleUtilities.xcframework.zip",
      checksum: "a5f85e65968141f85f4646417c266a64c6dd5a8968d41324e530294d645009b7"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_Promises.xcframework.zip",
      checksum: "e3f1ce9f689680c611c1a858bd428cc4d1833606ca3c9a762626b67727a3e626"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_RecaptchaInterop.xcframework.zip",
      checksum: "d1c68a80931274c13ae042335935d9180748ed76c9fa1b9dfdaa7a70a18552ac"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_SwiftProtobuf.xcframework.zip",
      checksum: "84ce8987b8650f083a3c9e1e979ae70e141c7168171953e836cae0aeb849d5ac"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_absl.xcframework.zip",
      checksum: "7b868967bb60e895def73f27210149ffe995820d3af7e5eaf68ede14f26de154"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_grpc.xcframework.zip",
      checksum: "c987b186d1f4504d4309233acd502c5a65835add5e82525d7d12c562f21613dc"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_grpcpp.xcframework.zip",
      checksum: "f2970276abc8030c62d0fd15039f3ac0e8d3dfceaf73503a5293726ff566b38f"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_leveldb.xcframework.zip",
      checksum: "52abd821e64f316bbaf267d75f6173b6b80f589599811ba4f611a5c7f87bc448"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_nanopb.xcframework.zip",
      checksum: "0b44d90fbce48fb42b41334a276a53ac86103f3bcb3bc398b67008b445f01aae"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_openssl_grpc.xcframework.zip",
      checksum: "c461b9eb971dfa19cca810027e012241ad64f63e16f0b56f2f982e7070cd8b9f"
    )
  ]
)
    
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
      name: "FirebaseAnalytics",
      targets: ["FirebaseAnalyticsTarget"]
    ),
    .library(
      name: "FirebaseAnalyticsOnDeviceConversion",
      targets: ["FirebaseAnalyticsOnDeviceConversionTarget"]
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
      name: "FirebaseDynamicLinks",
      targets: ["FirebaseDynamicLinksTarget"]
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
      name: "Google-Mobile-Ads-SDK",
      targets: ["Google-Mobile-Ads-SDKTarget"]
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
        "FirebaseABTesting"
      ],
      path: "Sources/FirebaseABTesting"
    ),
    .target(
      name: "FirebaseAnalyticsTarget",
      dependencies: [
        "Firebase",
        "FBLPromises",
        "FirebaseAnalytics",
        "FirebaseCore",
        "FirebaseCoreInternal",
        "FirebaseInstallations",
        "GoogleAppMeasurement",
        "GoogleAppMeasurementIdentitySupport",
        "GoogleUtilities",
        "nanopb"
      ],
      path: "Sources/FirebaseAnalytics"
    ),
    .target(
      name: "FirebaseAnalyticsOnDeviceConversionTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "FirebaseAnalyticsOnDeviceConversion", condition: .when(platforms: [.iOS])),
        .target(name: "GoogleAppMeasurementOnDeviceConversion", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAnalyticsOnDeviceConversion"
    ),
    .target(
      name: "FirebaseAppCheckTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "AppCheckCore",
        "FirebaseAppCheck",
        "FirebaseAppCheckInterop"
      ],
      path: "Sources/FirebaseAppCheck"
    ),
    .target(
      name: "FirebaseAppDistributionTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "FirebaseAppDistribution", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAppDistribution"
    ),
    .target(
      name: "FirebaseAuthTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseAppCheckInterop",
        "FirebaseAuth",
        "GTMSessionFetcher",
        .target(name: "RecaptchaInterop", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAuth"
    ),
    .target(
      name: "FirebaseCrashlyticsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseCoreExtension",
        "FirebaseCrashlytics",
        "FirebaseSessions",
        "GoogleDataTransport",
        "Promises"
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
        "FirebaseAppCheckInterop",
        "FirebaseDatabase",
        "FirebaseSharedSwift",
        "leveldb"
      ],
      path: "Sources/FirebaseDatabase"
    ),
    .target(
      name: "FirebaseDynamicLinksTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "FirebaseDynamicLinks", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseDynamicLinks"
    ),
    .target(
      name: "FirebaseFirestoreTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseAppCheckInterop",
        "FirebaseCoreExtension",
        "FirebaseFirestore",
        "FirebaseFirestoreInternal",
        "FirebaseSharedSwift",
        "absl",
        "grpc",
        "grpcpp",
        "leveldb",
        "openssl_grpc"
      ],
      path: "Sources/FirebaseFirestore",
      resources: [
        .process("Resources/gRPCCertificates-Cpp.bundle")
      ]
    ),
    .target(
      name: "FirebaseFunctionsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseAppCheckInterop",
        "FirebaseAuthInterop",
        "FirebaseCoreExtension",
        "FirebaseFunctions",
        "FirebaseMessagingInterop",
        "FirebaseSharedSwift",
        "GTMSessionFetcher"
      ],
      path: "Sources/FirebaseFunctions"
    ),
    .target(
      name: "FirebaseInAppMessagingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseABTesting",
        .target(name: "FirebaseInAppMessaging", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseInAppMessaging",
      resources: [
        .process("Resources/InAppMessagingDisplayResources.bundle")
      ]
    ),
    .target(
      name: "FirebaseMLModelDownloaderTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseMLModelDownloader",
        "GoogleDataTransport",
        "SwiftProtobuf"
      ],
      path: "Sources/FirebaseMLModelDownloader"
    ),
    .target(
      name: "FirebaseMessagingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseMessaging",
        "GoogleDataTransport"
      ],
      path: "Sources/FirebaseMessaging"
    ),
    .target(
      name: "FirebasePerformanceTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseABTesting",
        "FirebaseCoreExtension",
        .target(name: "FirebasePerformance", condition: .when(platforms: [.iOS, .tvOS])),
        "FirebaseRemoteConfig",
        "FirebaseSessions",
        "FirebaseSharedSwift",
        "GoogleDataTransport",
        "Promises"
      ],
      path: "Sources/FirebasePerformance"
    ),
    .target(
      name: "FirebaseRemoteConfigTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseABTesting",
        "FirebaseRemoteConfig",
        "FirebaseSharedSwift"
      ],
      path: "Sources/FirebaseRemoteConfig"
    ),
    .target(
      name: "FirebaseStorageTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseAppCheckInterop",
        "FirebaseAuthInterop",
        "FirebaseCoreExtension",
        "FirebaseStorage",
        "GTMSessionFetcher"
      ],
      path: "Sources/FirebaseStorage"
    ),
    .target(
      name: "Google-Mobile-Ads-SDKTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "GoogleMobileAds", condition: .when(platforms: [.iOS])),
        .target(name: "UserMessagingPlatform", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/Google-Mobile-Ads-SDK"
    ),
    .target(
      name: "GoogleSignInTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "AppAuth", condition: .when(platforms: [.iOS])),
        .target(name: "GTMAppAuth", condition: .when(platforms: [.iOS])),
        "GTMSessionFetcher",
        .target(name: "GoogleSignIn", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn",
      resources: [
        .process("Resources/GoogleSignIn.bundle")
      ]
    ),
    .binaryTarget(
      name: "AppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/AppAuth.xcframework.zip",
      checksum: "0e332b317e107a64a8e6ebe40068e6b1bae3a3ce9896a40e85ed4bb41fb952bf"
    ),
    .binaryTarget(
      name: "AppCheckCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/AppCheckCore.xcframework.zip",
      checksum: "278a120e05e847aaeaab934560c8e4177ee9cb967dd162837c5e04a952dfd380"
    ),
    .binaryTarget(
      name: "FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/FBLPromises.xcframework.zip",
      checksum: "1485c65fe8eb1efd35b7cba574a1929dd09f8845cf0b937b9f953ad6889779d3"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/FirebaseABTesting.xcframework.zip",
      checksum: "de258f8a1933e9dc68433c209886a93f92d999a32646c381139c0d9149e5a0a1"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/FirebaseAnalytics.xcframework.zip",
      checksum: "110bd820fb12d2f676df96ac5beda398a031fad85977a9da7bd294c621a3e17f"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "2fc7fda1c5fce933090d0b1a19bab5cc82001d70e5fcb31a46e58aae6ff65c5b"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/FirebaseAppCheck.xcframework.zip",
      checksum: "eebe84bb0f73d525143e4d2cd867cb519b2d4f3fe6216789482f2b13235492e9"
    ),
    .binaryTarget(
      name: "FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/FirebaseAppCheckInterop.xcframework.zip",
      checksum: "e00081ee3126533ffbd2e72c442765cc8db994450ce966ff236f80b024d5cb5a"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/FirebaseAppDistribution.xcframework.zip",
      checksum: "339780465160d676dea84fcd183cb89921c043fd4d60ef83ce1741d17c2028af"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/FirebaseAuth.xcframework.zip",
      checksum: "acd4d4053fa9b73bdb9cbff14a81bdfdc0a121a8bce3e80e4eced92a5dd93d99"
    ),
    .binaryTarget(
      name: "FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/FirebaseAuthInterop.xcframework.zip",
      checksum: "fd99a24dc8d2328f3b2b3cb61d6f959d0b704f56b7221fc16f262078c0015006"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/FirebaseCore.xcframework.zip",
      checksum: "0e0a020f710f14e7fd7a7588976b24506c653fb6fa438d918e7f4fa096161aad"
    ),
    .binaryTarget(
      name: "FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/FirebaseCoreExtension.xcframework.zip",
      checksum: "5b79e2a1295e170faf34b4aab05abb643646b8a0ad8ea971ae4de4a6e5ce8362"
    ),
    .binaryTarget(
      name: "FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/FirebaseCoreInternal.xcframework.zip",
      checksum: "2e2c5a52a41535558be607402a7f1de1ad4d1f62f6c7766fbe2f4287b4602065"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/FirebaseCrashlytics.xcframework.zip",
      checksum: "d008990b0f80f7d300c363dbba79d139484f9133c5aa62f94ceb98db71047d97"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/FirebaseDatabase.xcframework.zip",
      checksum: "53889efc80566f4d7bbfd7f795c74ca1616ce399cd4a1302df9144a5dfaac25e"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/FirebaseDynamicLinks.xcframework.zip",
      checksum: "1d1a6497e20ac095b8eb7d6348db14dcd95a2694248c28b3fb863cbc1c82ce70"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/FirebaseFirestore.xcframework.zip",
      checksum: "13738e07b039b811098b729d7d6354d01d4598401475df1651680f1cfc412447"
    ),
    .binaryTarget(
      name: "FirebaseFirestoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/FirebaseFirestoreInternal.xcframework.zip",
      checksum: "41314a2dfff24ad58450b6f82e7653af064af56ea7920165d945875fb32b871c"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/FirebaseFunctions.xcframework.zip",
      checksum: "9cc80db5b4dfba1592c27c641a10aa3b8e40de847281105b99114e24c7d9615f"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/FirebaseInAppMessaging.xcframework.zip",
      checksum: "9a5c2a6bb8657d73e5e4b401d6ad307f3cecc49e38f7d4e9c92a84ca7bd11301"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/FirebaseInstallations.xcframework.zip",
      checksum: "845e3dd3841ab36f18064836dca4b9b1608b798e7b49500311374535b7783247"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "69c6171f9227d884249ad7bb3ac81c9bf754b30e701cb5277e069e7f70e00caf"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/FirebaseMessaging.xcframework.zip",
      checksum: "96ffae823bac9ef97909b95c32959ec7604de621b2857273289126f2283bd979"
    ),
    .binaryTarget(
      name: "FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/FirebaseMessagingInterop.xcframework.zip",
      checksum: "2f23204e353390c171c433691f00dd6194c73da5281ffab0d6ae3b042368b80f"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/FirebasePerformance.xcframework.zip",
      checksum: "2322bd35e2d98e5f81294d18ec6c2f7c16ed33f3b319576fd669602ca4797d69"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/FirebaseRemoteConfig.xcframework.zip",
      checksum: "f39a60a310c8f5dc002ef661e23526d3852c848b22383b76aaef10fe6b9ea41e"
    ),
    .binaryTarget(
      name: "FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/FirebaseSessions.xcframework.zip",
      checksum: "c84222fc99fcee5e62a21ff73169d87fdd06901054b65544b99a46c6185929db"
    ),
    .binaryTarget(
      name: "FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/FirebaseSharedSwift.xcframework.zip",
      checksum: "54c57348ec2795c704ed77408cd58334771f4873095ee00595bed1c0d3ee4014"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/FirebaseStorage.xcframework.zip",
      checksum: "d30981d778a56430352d9c2e74e6711b3a054b357e20ce868e41273cdae40a73"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/GTMAppAuth.xcframework.zip",
      checksum: "78f54bf62645bdeb2a62d8b60b2ce7a9fad9884b7af51a8a5377f43466118e89"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/GTMSessionFetcher.xcframework.zip",
      checksum: "b8ec53cfa4fbe9074d8d64727c30180988a0d0c5bd22b532236ecd33e5fde73a"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/GoogleAppMeasurement.xcframework.zip",
      checksum: "fd367272b2eac4ea2e5d203323bc2ff47bf4104c52d5cd080b59916fafa25793"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "6762c3532cdb5b7372894452dec01e70f3f8e8022ebee5e932ad9dfbfb6611da"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "33a4e17392ae3505fd230ecfd394972f73ddcc039dfa3238d4559b2c5c182a46"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/GoogleDataTransport.xcframework.zip",
      checksum: "ca0a370650fdd0c7d41c06e46dab524950e33ae4d2549ec9a7f551bdeca1f790"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/GoogleMobileAds.xcframework.zip",
      checksum: "652a53de6e1debc798d4ccb782a54eccf86807b4901c77720b33dfb538890744"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/GoogleSignIn.xcframework.zip",
      checksum: "78c6871dce45c3bb9849f7bad331c0a62640891b0d6fc655c26170fbfab60fa6"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/GoogleUtilities.xcframework.zip",
      checksum: "055a6e98c1b0e45cb24be7c24493709a67ed523f3ff84c0dbf96b62c1e7ebb41"
    ),
    .binaryTarget(
      name: "Promises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/Promises.xcframework.zip",
      checksum: "78267b96d92c0d76e2766c9b9d6d7188a2f8488faa2e33cd6e87d7007ead447e"
    ),
    .binaryTarget(
      name: "RecaptchaInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/RecaptchaInterop.xcframework.zip",
      checksum: "6bae7a8f0df9ce21648c4a7f8b1cc03d24d1c20393defb891e1833a3f38b0323"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/SwiftProtobuf.xcframework.zip",
      checksum: "e33736296aa8f41afa636d2a257fb63f7340e3b2ade64f3f0170baf7d859ba69"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/UserMessagingPlatform.xcframework.zip",
      checksum: "8c98c675dd75fbec014b31dcbef09c2e57b1a146b68d9a8e88af4a91c5118aa3"
    ),
    .binaryTarget(
      name: "absl",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/absl.xcframework.zip",
      checksum: "4b44157e1137ce75be944fe44acc9ea682930ede823a5ad234a584a17c20ed44"
    ),
    .binaryTarget(
      name: "grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/grpc.xcframework.zip",
      checksum: "c0f89e248cf1a2fb5c5684b477e200b66933981428ba0700555aa45628d9da76"
    ),
    .binaryTarget(
      name: "grpcpp",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/grpcpp.xcframework.zip",
      checksum: "059de433008b8e7c5117cad2832556f708f41d3569ab537b0f558f3b3b0f9543"
    ),
    .binaryTarget(
      name: "leveldb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/leveldb.xcframework.zip",
      checksum: "3cd9934e3b1256ccb1a4aeb02bb2ab3a2e0a14d4b1f8cb1cca67c90343ed82ab"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/nanopb.xcframework.zip",
      checksum: "e570aa2ae2e7cba03372f4747d4f0456d62312438480df7574abdad2b6fb30cd"
    ),
    .binaryTarget(
      name: "openssl_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/openssl_grpc.xcframework.zip",
      checksum: "e593ab97c7b3ff9fbed2bca62626a0b1addaa073d2cad75816b4a58c4020130c"
    )
  ]
)
    
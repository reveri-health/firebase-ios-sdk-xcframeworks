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
        "FirebaseRemoteConfigInterop",
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
        "FirebaseRemoteConfigInterop",
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
        "FirebaseRemoteConfigInterop",
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
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/AppAuth.xcframework.zip",
      checksum: "9173570cf43ccbe2d2596445874c54e75201437785377dbb1993c2d628b2542c"
    ),
    .binaryTarget(
      name: "AppCheckCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/AppCheckCore.xcframework.zip",
      checksum: "b1681069f37d9f8c45dd4addabcc48e9335b914b4a4178af7ee58ffe6e70236b"
    ),
    .binaryTarget(
      name: "FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/FBLPromises.xcframework.zip",
      checksum: "f115cdeaad4970f4cf2a7368a7eda23f456b03fabac81d05a7c7b1a1ba946551"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/FirebaseABTesting.xcframework.zip",
      checksum: "4561ad5036b99f8b635e000b91bf4f75292ac61912ba7a53b12ef63638ddd48a"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/FirebaseAnalytics.xcframework.zip",
      checksum: "c92279701228b94e5beec8c4faed580b19a53f771dc25bd594204aa32bf1d4fd"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "8d6f8a1435bfeee001701cfaecc5acdc343094adbba504f36f55231581d36876"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/FirebaseAppCheck.xcframework.zip",
      checksum: "cf857f067b7a97fa9923453ce962bf4cf9e8015e819e5790d33f38bb66669eba"
    ),
    .binaryTarget(
      name: "FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/FirebaseAppCheckInterop.xcframework.zip",
      checksum: "a4f59ebf87b512b176e711dd0045e813d2a7a23333e7b05e60887c6619be4aaf"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/FirebaseAppDistribution.xcframework.zip",
      checksum: "374deee3eea69c81dce6a367612359de38100dc42390a6a766d5ec0d6e638acf"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/FirebaseAuth.xcframework.zip",
      checksum: "d524a8221b17a8f96379757429353e5c322040c87d66352a804d7de08d49c2cf"
    ),
    .binaryTarget(
      name: "FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/FirebaseAuthInterop.xcframework.zip",
      checksum: "3d4a00ac327d63a0f90dfd76a4c8af2efd374683fc74d0351a586ea6b68ae4fd"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/FirebaseCore.xcframework.zip",
      checksum: "cf1bec3d3aa65cd5d611923f76fe5ae3c3a1ec3ed42f1d0b4fa5ed2ef774733d"
    ),
    .binaryTarget(
      name: "FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/FirebaseCoreExtension.xcframework.zip",
      checksum: "8aa789e4c8c96b8a1bd0731b95d6554e4e01f945f1f93a100bd21ad42d54620f"
    ),
    .binaryTarget(
      name: "FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/FirebaseCoreInternal.xcframework.zip",
      checksum: "45c51f9e2804e48d27bedb13dd3373bbd47dcb83bf1cc280d9396ff3ed8d9ffe"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/FirebaseCrashlytics.xcframework.zip",
      checksum: "506f26d83061469625278813f019259c83b63aa91eecc027d616f11224ff719c"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/FirebaseDatabase.xcframework.zip",
      checksum: "22777c99a32ba2f1f34f925703d4889623edacb4061c8c180fd4180759f64e38"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/FirebaseDynamicLinks.xcframework.zip",
      checksum: "1fc808f7de7d24ba2f095540f3ad63f398aa5d108345d3fdeb53ffaf99899e9d"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/FirebaseFirestore.xcframework.zip",
      checksum: "edc8cfb1a3764f875cade2b1f2fc42ec03a64963524d14a7d986ce74f9c5f842"
    ),
    .binaryTarget(
      name: "FirebaseFirestoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/FirebaseFirestoreInternal.xcframework.zip",
      checksum: "c670acaee2f7c2db65accd26d4999ad90a76d22299f4b110ca26eda1e0ab52f1"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/FirebaseFunctions.xcframework.zip",
      checksum: "1978082e350709b30b0af99a25932100c389bdda70b6ecc78f689f0ed64e96f1"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/FirebaseInAppMessaging.xcframework.zip",
      checksum: "44bf75e57287deba81ff795d985aa676ab879883295d79a41c1655cb4333c45f"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/FirebaseInstallations.xcframework.zip",
      checksum: "32229eaba65b3c6c74f355fd538f02f00ffcc8f863c7d8946f073d7429dc2b20"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "e18e7f56b810cbf9ab9c9792a249d07f528f064ec44d994ecd4f3a5307b05153"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/FirebaseMessaging.xcframework.zip",
      checksum: "6c6aaccd9c4c3e6be31615439091e5b8d6ca4241672c7cfaf1b0478e386eab9f"
    ),
    .binaryTarget(
      name: "FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/FirebaseMessagingInterop.xcframework.zip",
      checksum: "b00abb275c69817e028d95664d2c29f514e2d9b43f4f73d9f4fc75555a2a888e"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/FirebasePerformance.xcframework.zip",
      checksum: "429ea8b1d298ed14dc25644e0cf420f6f01e15736e14bbf95382888f464a0902"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/FirebaseRemoteConfig.xcframework.zip",
      checksum: "2901f25b6e17e40943981a4fa9d57d28359809374eae59a5f6f74419c83fc342"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfigInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "2a35d6b4d5a216c2a31700cd5c3d8d617144e3be7073291bdffdb89baf9b9779"
    ),
    .binaryTarget(
      name: "FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/FirebaseSessions.xcframework.zip",
      checksum: "cc75af62124071ac34fc0694a1adae06914aba202fa393bbe0a1b8b3af21b846"
    ),
    .binaryTarget(
      name: "FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/FirebaseSharedSwift.xcframework.zip",
      checksum: "584b7424bbea54ffddd90610437bf93d1149d53a71a2d92f40be8c0088289eb4"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/FirebaseStorage.xcframework.zip",
      checksum: "ecf12e673f2c249d39c51a81384cd6983c620ea93ee7dcba1ae0ef8b0fc31410"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/GTMAppAuth.xcframework.zip",
      checksum: "28202c32d2d95dafc94ddb52a12a14130ac7b6d3d52b68a735ee2ddc12edf8d3"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/GTMSessionFetcher.xcframework.zip",
      checksum: "247a9679d9bab3192b74410f16220ce29ce0f7eb1a85f2137e903f8c1c970bbe"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/GoogleAppMeasurement.xcframework.zip",
      checksum: "c69f189c2ca9b81e65c8b0c6f229f6cbf7058c303d3e1e438bb5217a2dc673ea"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "66894b0f72afbd0d85f3a80180f88db406697a3e6819c9e60d0ca7d74d0d91db"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "26798227c4e1a8f2c5e4a654b4a0968fdcf7332a8cc873cccd0a549f90b0dbf8"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/GoogleDataTransport.xcframework.zip",
      checksum: "7fc6751efe13beb41742fbb08478494a023358889c87bd7fa574979ae1a5d73f"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/GoogleMobileAds.xcframework.zip",
      checksum: "c51860cb30bb185cf194abcc51c53fd538fb120c9bdfc18f50337d4f453eef56"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/GoogleSignIn.xcframework.zip",
      checksum: "22d55bacb1d63b4b5d9889024ede7d4557b2d792526a07c8c2e555fb82facbfa"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/GoogleUtilities.xcframework.zip",
      checksum: "33a2858678fc9a5cd78bc953fd9555056af151887916ace1256555899796ea96"
    ),
    .binaryTarget(
      name: "Promises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/Promises.xcframework.zip",
      checksum: "1b0190ab2ff30c285cb17d0a03e4374b1687cc922866d526711e7f1eb7187ec5"
    ),
    .binaryTarget(
      name: "RecaptchaInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/RecaptchaInterop.xcframework.zip",
      checksum: "2d16b11ca0f50e1cf9428d88cb462e0f2a88da7603b745bc727536b9abdcf593"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/SwiftProtobuf.xcframework.zip",
      checksum: "3e229cd3d02bc4196bf2dfc25a0f3545a3bd253366c71bac3cd3203431f26ac6"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/UserMessagingPlatform.xcframework.zip",
      checksum: "f993d46da11de4f62d9d2c7b132e546d2121bdae46f30846e7ecb7074bafaac6"
    ),
    .binaryTarget(
      name: "absl",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/absl.xcframework.zip",
      checksum: "26c848c1e69ee2bc034eabe9c5c42f7d4a954933ae882545f9abd1e2cb5dcc29"
    ),
    .binaryTarget(
      name: "grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/grpc.xcframework.zip",
      checksum: "0328ee237529b3f97eeef6d650622803b3a29bc5f5d439d05c3df1b1eed27f96"
    ),
    .binaryTarget(
      name: "grpcpp",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/grpcpp.xcframework.zip",
      checksum: "c849275880e4282f41b45485d01bd0ab34d113e9e417b2d7b4e9906fef0c58b6"
    ),
    .binaryTarget(
      name: "leveldb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/leveldb.xcframework.zip",
      checksum: "296c854b7ac8b7ca6e9a959ed54db2fd89a1acf1ffa9ff16605714f703549751"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/nanopb.xcframework.zip",
      checksum: "3f1cc8f784ecaae32feea9ef8e76d3a6aba19fd99259bc532346334c0d9f5ec5"
    ),
    .binaryTarget(
      name: "openssl_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/openssl_grpc.xcframework.zip",
      checksum: "1e1237d5b4569a68fd14c97197af03e1fd86c550fff077d046d01bf62d73f1d3"
    )
  ]
)
    
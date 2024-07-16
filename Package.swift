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
      path: "Sources/FirebaseFirestore"
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
      path: "Sources/FirebaseInAppMessaging"
    ),
    .target(
      name: "FirebaseMLModelDownloaderTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseCoreExtension",
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
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "AppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/AppAuth.xcframework.zip",
      checksum: "4a0e42c2a0cb6136e5506e2fccef52142c86dbdd33f2732d61511ac4a58bf71b"
    ),
    .binaryTarget(
      name: "AppCheckCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/AppCheckCore.xcframework.zip",
      checksum: "27a93c359583d64b6f8e479334c948a4421552a80c3ed0b3d3a1b2b9bd676398"
    ),
    .binaryTarget(
      name: "FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/FBLPromises.xcframework.zip",
      checksum: "486e4501a60d306e2fc353a7c9d7f064a3f6038cba2e80544b0cc97827933e3f"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/FirebaseABTesting.xcframework.zip",
      checksum: "4587255d0ac59c6e5e5a5ed900dcd4bb8d3208dd439a20e76e9b521d0361bd39"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/FirebaseAnalytics.xcframework.zip",
      checksum: "acbe10e03bfb9792a3a5e4513c38ff894e0a87b3efbac98ea9bd8f4786d31e70"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "d5bf03cbc6bc31f7142edf350f3758b116a8e46ec1d9f6c2f1174dd56edfe0a9"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/FirebaseAppCheck.xcframework.zip",
      checksum: "ceaa532b6c8b12fb3661406e0aa52b39f47995033418d1a4b1440b57f9981b45"
    ),
    .binaryTarget(
      name: "FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/FirebaseAppCheckInterop.xcframework.zip",
      checksum: "4409ef2b683fa9b88b3a71f3f117fd5ccf6db892c24807f0f5098e5201154c3e"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/FirebaseAppDistribution.xcframework.zip",
      checksum: "2f7a86da360e4d3a147085203419d6d7b80c9a3375462fe8619319d9c4eda74f"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/FirebaseAuth.xcframework.zip",
      checksum: "58f0c7a3e7f8ad6ec8c33e35fb7a37ab8906555a95409a514a7197d4d5bebca6"
    ),
    .binaryTarget(
      name: "FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/FirebaseAuthInterop.xcframework.zip",
      checksum: "4b17e6c0435a7583c4fdee6bdc2efc4f6a593c93c53e935c0d52737645fd7864"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/FirebaseCore.xcframework.zip",
      checksum: "97227503d98c9a1536fad8e2b6bcc8bdea6eee679d994acfe00a93337f014808"
    ),
    .binaryTarget(
      name: "FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/FirebaseCoreExtension.xcframework.zip",
      checksum: "9be55275707883e1634365722b74e6d17bf672d4634c7e34227c76246082c9df"
    ),
    .binaryTarget(
      name: "FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/FirebaseCoreInternal.xcframework.zip",
      checksum: "6c123b074404c8f1a4d5d9c7d63d8130b9183874892cebc665ccf845eda0d16f"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/FirebaseCrashlytics.xcframework.zip",
      checksum: "688fb559e2a9daf3db0980c9d51b3784f066870a7d4106d6daa71238abdf7845"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/FirebaseDatabase.xcframework.zip",
      checksum: "ac33371d341aae6d134c737f5e4c9b7256501b447211af393ad4d6e3cf2b783d"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/FirebaseDynamicLinks.xcframework.zip",
      checksum: "b3e2b2fe7e9304c1eea3e5d43bde52bcb1991fabedb5c68753deaf85e59459f7"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/FirebaseFirestore.xcframework.zip",
      checksum: "f990f9a24a53f2f14b3834042beade33c7699fb5a2e8b8a07bb332e9d752c29b"
    ),
    .binaryTarget(
      name: "FirebaseFirestoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/FirebaseFirestoreInternal.xcframework.zip",
      checksum: "edccbc79153c08d92fb5fdc7c4e03ba8d46a0d7aff9ac4a70539993977fc72de"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/FirebaseFunctions.xcframework.zip",
      checksum: "069e49e89d62b8b31e6417bca4f7aaaffbf09f0e6fbf82784f33c5391af954c4"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/FirebaseInAppMessaging.xcframework.zip",
      checksum: "2e075384a64d213e72f1661292d0dc1b09bb5120392abae7707b43e9da1de42c"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/FirebaseInstallations.xcframework.zip",
      checksum: "da8afed1550c630e3aa56d114b1c4262a6c1862cca880a0c34f4ccf9a1938ed3"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "f4c9825cf4253331dbafde46ad87bed54e8d70c0d6a62e898025d9e5fa315670"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/FirebaseMessaging.xcframework.zip",
      checksum: "b183d090295aa89c8e413abddd0ade891f1d990f1091620961cf3a0d50a190c9"
    ),
    .binaryTarget(
      name: "FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/FirebaseMessagingInterop.xcframework.zip",
      checksum: "58ca3bebfe15901f3ee463a90bd6d2933b8eac73056e7f81b765080c8163c9fe"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/FirebasePerformance.xcframework.zip",
      checksum: "158142cae24d0f63414cba49ec32dbca2bf8b476a04c9333ed0cdba614881346"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/FirebaseRemoteConfig.xcframework.zip",
      checksum: "fd28d5977d11dcc548dc379f75a7c4ccb8a4474f88f9bc221c99db58eeb44297"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfigInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "8b5472a3edc1841ab042d21be9e92c38ba5aeb101d698ec71e3a660903ee9a78"
    ),
    .binaryTarget(
      name: "FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/FirebaseSessions.xcframework.zip",
      checksum: "a9248b2121397efe942bee712f1dd73c7a53e2f2f170b079446972eb1e8f9889"
    ),
    .binaryTarget(
      name: "FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/FirebaseSharedSwift.xcframework.zip",
      checksum: "49943ba741e1211e292da34f024abce7917831548d6cc50ace095cdd6012f381"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/FirebaseStorage.xcframework.zip",
      checksum: "da43c35e693c212aa1b572b494390f415abf44d42a07a3b05a9cb25f40afe239"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/GTMAppAuth.xcframework.zip",
      checksum: "a6bba2b7a0a90addeb894ff6f799e99250dfa041d2f2894340fe3eeadb47acff"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/GTMSessionFetcher.xcframework.zip",
      checksum: "63b367ef9028ee27a78ab6a963ecdf20430f0437efda342a7412e536e398849c"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/GoogleAppMeasurement.xcframework.zip",
      checksum: "eddfbef5f4fe43e57d8219e2b8dbaf4db72a7c0e068ff86dd7837a45a342c98e"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "1721a98d88764da408938afe4e21e9a85037115087b34c6594bd890c44e6f3ec"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "ae8ef4cfd00c2f7ea8a541b8cf455a0cced8ef1d0899d2d9050cb7194167ce0a"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/GoogleDataTransport.xcframework.zip",
      checksum: "29e77d6872e32888bec2d9c0b7d26f431c7eb02ffff6536db6b1446eac9bd0af"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/GoogleMobileAds.xcframework.zip",
      checksum: "54cf803b147b4079c083c58b7c81e7a1bafd7bb2275011f18d4794495f296cb1"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/GoogleSignIn.xcframework.zip",
      checksum: "5f31296dac14133a1accbb33947c38923a43b27082448a147f7a6160c509a129"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/GoogleUtilities.xcframework.zip",
      checksum: "39bd424a95718478cbd6e494d85d15f7202a159757aa1f8d2b74e277069c9081"
    ),
    .binaryTarget(
      name: "Promises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/Promises.xcframework.zip",
      checksum: "e8064b956a8b3ac3c5c2c636be9e296a3a69d7a8026bc462ff66f9d6164b22ec"
    ),
    .binaryTarget(
      name: "RecaptchaInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/RecaptchaInterop.xcframework.zip",
      checksum: "368221eb5d4901e19500015538fea2b8ed507ef07ce95c535d62add5be90067e"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/SwiftProtobuf.xcframework.zip",
      checksum: "e2e3325f4226a874c2be00359f488ef7357ae487965c33f6a3a6c78894deace1"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/UserMessagingPlatform.xcframework.zip",
      checksum: "2b34ef2ec9635873d50ad4e21cc04ae23913d13cdc14053e6bc08ccabdf68276"
    ),
    .binaryTarget(
      name: "absl",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/absl.xcframework.zip",
      checksum: "5fced69d2c63d090117f66502790d2112b341b7f5957e3381e4fc981e681606a"
    ),
    .binaryTarget(
      name: "grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/grpc.xcframework.zip",
      checksum: "7d0c6ddf78dec8b0b6969fe8fc532e1f5a00d22e527203f0b8bfb91a5b51fe6f"
    ),
    .binaryTarget(
      name: "grpcpp",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/grpcpp.xcframework.zip",
      checksum: "3ff77858214eafc588e9bc0b8803e4703b6a3aa342cbf18f962f051359e1d824"
    ),
    .binaryTarget(
      name: "leveldb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/leveldb.xcframework.zip",
      checksum: "907fd484116c3e372c328e4d27f03d38a1ea0b82af0b3cc30a549bf5e4d4a115"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/nanopb.xcframework.zip",
      checksum: "c7636e826d2c657ec53f48e6b1e3e23a04c940039585cd64719aa01d7dfa103b"
    ),
    .binaryTarget(
      name: "openssl_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/openssl_grpc.xcframework.zip",
      checksum: "e1e1c3b7978e711e25076f74184fdb1027b45a47c1bac12cdbe1443469f1e0c1"
    )
  ]
)
    
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
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/AppAuth.xcframework.zip",
      checksum: "3a27941d41e8557054378827605d6548aad0e54997eef820b708abb40dd2516a"
    ),
    .binaryTarget(
      name: "AppCheckCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/AppCheckCore.xcframework.zip",
      checksum: "e018067db99649955d456b1a9dc9dd879dfb101c03c88849ee44cf4b1625a786"
    ),
    .binaryTarget(
      name: "FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/FBLPromises.xcframework.zip",
      checksum: "e4f4f1e323ce362a272ed22201073da29926ec56c864bf60e8460ea9ab18762c"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/FirebaseABTesting.xcframework.zip",
      checksum: "5aff5fe125ad7f4a2bf200ce3637d3fd81a6fea01048368e89074f9a4cc4631d"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/FirebaseAnalytics.xcframework.zip",
      checksum: "1648e0c53c1bb1387dc8cf58409e52a3779780db3ebe74195bbcbef4083da2c2"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "f614dc1cc46bd6c035d0f5c73f89996a1135fcd58ef416b25915100a903d0bff"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/FirebaseAppCheck.xcframework.zip",
      checksum: "f819841fc98c5e7237e4a8d7c43a1f75d72171a92ef13a7df3afe4533a00248c"
    ),
    .binaryTarget(
      name: "FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/FirebaseAppCheckInterop.xcframework.zip",
      checksum: "fd3e8fad5bdb0204bb61e1ad2e9561bdcd477d12772c24d501e836fb1e36ec5d"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/FirebaseAppDistribution.xcframework.zip",
      checksum: "edeb3128f163a7e71f28b7cd9c19206975f1c447e54ce23f2532b4d06c606058"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/FirebaseAuth.xcframework.zip",
      checksum: "1abcb4e512832027d0d603d6ec35a32e25fd8a21a2136fc7f43e98174faf1c2f"
    ),
    .binaryTarget(
      name: "FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/FirebaseAuthInterop.xcframework.zip",
      checksum: "6de62e6c5f29510aa22f1123b3296f377fa733fc32ec4913fafb531da66735be"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/FirebaseCore.xcframework.zip",
      checksum: "710427c096b6e83d2138343ed2a64b82a07276a82ab52e6e7a0b3ac614706d5c"
    ),
    .binaryTarget(
      name: "FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/FirebaseCoreExtension.xcframework.zip",
      checksum: "cfe9be7d176d936295b4465082cf0589b89d9e1ffe98ceb9df3e319942152d5d"
    ),
    .binaryTarget(
      name: "FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/FirebaseCoreInternal.xcframework.zip",
      checksum: "1c1d718f8b215f5349a8d7d75872485a0cb007d5b85d74dd7f16ae5ca0c3bf58"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/FirebaseCrashlytics.xcframework.zip",
      checksum: "f5e9ca62794e20223c9dd19928d671e92d5e6f1c2c99f5af1caef4ac87894cd4"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/FirebaseDatabase.xcframework.zip",
      checksum: "67a9bc086836d809be02ee33a77bad2d3537c935b95eb931003ccbce3cf0a3b1"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/FirebaseDynamicLinks.xcframework.zip",
      checksum: "169038f12ca1701bc1495a0db4f8a5db1e18787848d23859d00c6aba5a11d16b"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/FirebaseFirestore.xcframework.zip",
      checksum: "6d4345468717c8ff573ad73771c3fa66d59740cbef9f7b185b120921407138c4"
    ),
    .binaryTarget(
      name: "FirebaseFirestoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/FirebaseFirestoreInternal.xcframework.zip",
      checksum: "d0a9848a4ea301696634bd14cf16e514ac2358abda3894d54d3b5d69495704d3"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/FirebaseFunctions.xcframework.zip",
      checksum: "4e09f44c00e1d85795d5b2e27bd7bbf792db214827edb38d97d4f3bddd50b0ac"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/FirebaseInAppMessaging.xcframework.zip",
      checksum: "f0f9ef603dfb5d37d5f67d32cafdf4b3490589dba9e2f80e0362eead3063ea6e"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/FirebaseInstallations.xcframework.zip",
      checksum: "4cfab3d30c17e37d2af23d1437e035928bdc5bbb7fa6971cea630726b6f57b5d"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "cbc6e43f2a7fbf5ba47e5bbbfa98c34642b5a17f81af538de405d36c4b197d0e"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/FirebaseMessaging.xcframework.zip",
      checksum: "c0936069c6f5526434b7b0929a80f9003db537dcc0fa21e3b8aeaac109cd0663"
    ),
    .binaryTarget(
      name: "FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/FirebaseMessagingInterop.xcframework.zip",
      checksum: "7ded4b9999ba4df024ea7af9cbc8fb816b50c5ca76746f5cfc5b6b749161ff3c"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/FirebasePerformance.xcframework.zip",
      checksum: "636f4aa9a8f2be2ca0baf56f5776c4dc9c536903d54ba9ca8c8e1ccb31593fac"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/FirebaseRemoteConfig.xcframework.zip",
      checksum: "49c51f1ac31a4efe294a0a8d65f6c4ef57c05b33b7cef7c598898952c2b381e4"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfigInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "25bc20ca5f130445daae23900f2951cded1a3683d410465dfc84cbf26a5a9e13"
    ),
    .binaryTarget(
      name: "FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/FirebaseSessions.xcframework.zip",
      checksum: "1a8345f9ada8c3e752342bf2574acdd6afbdb7e05f739f98011719724bc5db9d"
    ),
    .binaryTarget(
      name: "FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/FirebaseSharedSwift.xcframework.zip",
      checksum: "9eec66f61892b4e2a6187766d19d3e4c022fcbab0c99047c02940be42251300a"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/FirebaseStorage.xcframework.zip",
      checksum: "470a81c2477093b3b166008a2c0e545aba07a7d4005c086f7b55fac23bfbc4d0"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/GTMAppAuth.xcframework.zip",
      checksum: "e89bdc6bc23d18e73f0ca55cfcf384c861e53f3b431d70f60985b604370f1a29"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/GTMSessionFetcher.xcframework.zip",
      checksum: "009df824b4712a83f03b14887d16b498dbb15690d136cd69ce497bcc6d099614"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/GoogleAppMeasurement.xcframework.zip",
      checksum: "78284bad35128aa4ad1438a5e8e19336de2af510c3b5320fdf02e7de67008a03"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "b470539f6bb5e92c86a9b97da6c7d0dc900dad19f59309e699f8176799723646"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "cc116663e8963c8e13eafad092ab9e7795397b385e48ce23c49da779503552a5"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/GoogleDataTransport.xcframework.zip",
      checksum: "bf72962bf487a552c55b09b5808eea19e86c3cf8793db1405e3cd3b68c250ce7"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/GoogleMobileAds.xcframework.zip",
      checksum: "fe1ad982532193e28df1d7969f9219ec5597a3d4585169f03ef87ffcf994c5dc"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/GoogleSignIn.xcframework.zip",
      checksum: "970567715701837db55e8864bde2fec620c98380fb23627bdc14bf94df9266cc"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/GoogleUtilities.xcframework.zip",
      checksum: "f8952f619e0a2c1f9a09fb2e5b051a99d7f184512424d862812876ba9b9afc29"
    ),
    .binaryTarget(
      name: "Promises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/Promises.xcframework.zip",
      checksum: "e828871bd0ea17a3ffd20c8d5451ac01ddd592feee7bc55c04c60f1dc12096df"
    ),
    .binaryTarget(
      name: "RecaptchaInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/RecaptchaInterop.xcframework.zip",
      checksum: "6ee9cdb03c44bf5b04ce6f4946e386d6ddd92764dd1f007e92fef721946b2913"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/SwiftProtobuf.xcframework.zip",
      checksum: "c0155026ea7ca5d8995f6f91ed0295dfa5b1824ea9ed8cc86de0d4a4add0f4fe"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/UserMessagingPlatform.xcframework.zip",
      checksum: "6d5b075e9f5b0e5bd9ad4078cec6704dad4aba584c964c90d57f7f0356ebf3b8"
    ),
    .binaryTarget(
      name: "absl",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/absl.xcframework.zip",
      checksum: "1f07728f0f8a2047051de723dbc9bbc46b4b7c9ca74351763b77e0092197aad4"
    ),
    .binaryTarget(
      name: "grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/grpc.xcframework.zip",
      checksum: "fbae47adf3d0f3e164fadff2589873a6151759d4eee6c753700041b392ba06f2"
    ),
    .binaryTarget(
      name: "grpcpp",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/grpcpp.xcframework.zip",
      checksum: "3256f25b81cb206ff5b5fac7b26b40b766702b108bf9162c19600007850760d8"
    ),
    .binaryTarget(
      name: "leveldb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/leveldb.xcframework.zip",
      checksum: "70e41d8c2fa0db1a2c1584e8338f616fa5179ac8519aa6997f4654ebb4a9eaec"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/nanopb.xcframework.zip",
      checksum: "2d33718f20ea837f9e44269a46e7ff0dfca9275352b9f53ce1031e135bec776c"
    ),
    .binaryTarget(
      name: "openssl_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/openssl_grpc.xcframework.zip",
      checksum: "f3910873670be26641dd5d6bba5cc2cfe7dcda52f24c71924f07b5705a0962cc"
    )
  ]
)
    
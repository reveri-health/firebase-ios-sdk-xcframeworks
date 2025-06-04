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
      name: "FirebaseVertexAI",
      targets: ["FirebaseVertexAITarget"]
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
      name: "FirebaseAnalyticsOnDeviceConversionTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_FirebaseAnalyticsOnDeviceConversion", condition: .when(platforms: [.iOS])),
        .target(name: "_GoogleAppMeasurementOnDeviceConversion", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAnalyticsOnDeviceConversion"
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
      name: "FirebaseDynamicLinksTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_FirebaseDynamicLinks", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseDynamicLinks"
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
      name: "FirebaseVertexAITarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAI",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        "_FirebaseVertexAI"
      ],
      path: "Sources/FirebaseVertexAI"
    ),
    .target(
      name: "Google-Mobile-Ads-SDKTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_GoogleMobileAds", condition: .when(platforms: [.iOS])),
        .target(name: "_UserMessagingPlatform", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/Google-Mobile-Ads-SDK"
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
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_AppAuth.xcframework.zip",
      checksum: "69931f8d3670e4d5b22cfdb3468a1ae3bb892ea29377d7655cbcdaa1637e2a69"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_AppCheckCore.xcframework.zip",
      checksum: "d042c0568f55bd06b0537d1544febb4724e4ad1a762e79892b806b30f9615785"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FBLPromises.xcframework.zip",
      checksum: "5db85ecc3562d29c47327539381b6fae74c757a3f75bdb6a6613d0995e58f7a1"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseABTesting.xcframework.zip",
      checksum: "533d3932c248932536870b3ec212ef2993b6095bc2357fcfae180d6a05500a55"
    ),
    .binaryTarget(
      name: "_FirebaseAI",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseAI.xcframework.zip",
      checksum: "9c95c9979e68291a8eb25c38f88f89b9eb17df3aa2d7c9c1225483b0e036144a"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "cc51360a48631e2c838e5255b45dec0011d4ed77281d98e3efb1a57304d4eab0"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "594447163cbf258533060229375dd2b6821d5a75459b4d57b112d02d1d1f9fe3"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "33328ef42600e05c323764b8a8284bacea49b09ed494a039ce46fa10bc51a4b9"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "1cbbbdde6333d86d878ce2ea04b4705799bc09ddd29a8fa573dd1bcfe07f0cb1"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "ba8918f7dc8b9da259629da8eff3397662edb892bb79c3fda2f6d649c15e217b"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseAuth.xcframework.zip",
      checksum: "7ea90f8e7ff3e812cc51520540ec2c09ec6a3b29b0ff0deb92f7129ecd438f1b"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "ce221391fdc7462a537eb055055ff27fede51e9feeab0f80ae37cb33deae71c0"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseCore.xcframework.zip",
      checksum: "0f81d0d3ff8d262903c9ff841001f70e2e012156115bcfb35540965aa0dd1639"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "8c0394b829c4d66341bc205f2f145b0a129e28955cff43483b6786fd8eca46d3"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "0f5201b0d1937f4f2e2ceecdde0ecdab2cc2a30fd50cf9809791e881fb484679"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "e51512cc67ee12fa12ddbaa1230b4d9cd5b6f9cc0503886b62d828997497c765"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseDatabase.xcframework.zip",
      checksum: "62c14e69cc1969d2996b602509a23a43cd18aef120c05a66ed31076a50076578"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "f84b233368c7f765da3c95d801fd6c0299cefaaaaa6a0b2cc25033bb4115882f"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseFirestore.xcframework.zip",
      checksum: "94408ce3d5a3d41f11ed64570a226b88e19f3b1b98e77a2f1ac62d936acfc1ed"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "df47e9cd1cdca82b482472a37557fafd8f00013ee8ced072c01e3d4dd7bf4e05"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseFunctions.xcframework.zip",
      checksum: "d07eb40ebce55050fec606d1f7c3882db490dae5032b2cd94c2bd6bdbd9c5588"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "01b89074b119d420f2110bd1c321db9443263d8e9800a55225858ead342e493d"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseInstallations.xcframework.zip",
      checksum: "65f94671104580f91aded41af634638c25d04e6daf3d9f69dc5ff8bcfe4dc765"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "1d35a72480d951683d7ec01a712c7b8bc5ee3c6756cfcd0ff73bb5487826ba17"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseMessaging.xcframework.zip",
      checksum: "6886eb3c19f4ddf6fae21f0d934ad0922d7dff5c2a079b67638732a34d96119e"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "3817747f58382577f5a02ce1dc96ad4110d0f7724aa65f261bf85c150e22a0f0"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebasePerformance.xcframework.zip",
      checksum: "44d92dc9a061c240cae7daff4767fc238b80f3cbfc0af3d26f90f931b5929700"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "3569796945600b2768c359af195badf7cc91e4efd87ed14dd8cd1a228ae588ac"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "d4de77a14d9a466d68b65e42293120466cd8e636ca85d339ea85b2539584f914"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseSessions.xcframework.zip",
      checksum: "02597692f15714392bc5e1558aef5e04e903892b040f5738245f0e25a955eeb3"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "eaebb89c41fc051f3e63fc90971f47a1d9f4eb911232bc5c8c755e767abf3e35"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseStorage.xcframework.zip",
      checksum: "d0b16cdddbb0c7fcec11e866bc9d5a049cfb0dd9555e6f4a036ed1177cdd5932"
    ),
    .binaryTarget(
      name: "_FirebaseVertexAI",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseVertexAI.xcframework.zip",
      checksum: "3333d2665c64d5b77bbcc4257e6cadc74b141171ab58898e3f404b1d42288913"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_GTMAppAuth.xcframework.zip",
      checksum: "e4498ea157f36b42fba169b8823b6458b0982cb4b9af43359728d5ab5396f000"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "b59881042d7fc5fcf81c7a177974a6eec90e02d93538a7468f44b721465db12e"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "4b89eefd4502a5e9d735f010530815b88f565301a2871a4850749fd4950a65e4"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "23e358568f968d1633ed2581e4ddbfb82ceaddac8f9adcf97583d123e5ceea8b"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "ed4c12ba80048c825fb0af16a71ec64b958fa89a5b62b61aa2ca1e8c24dfffb0"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "f220885cc2005477d9610233b45eb8f53cca976f8bd7095e75039eab58ff04dd"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_GoogleDataTransport.xcframework.zip",
      checksum: "d103daa868d584dc88627c287d5a212f459df3b6f777d6105cc57a3befe4a16f"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_GoogleMobileAds.xcframework.zip",
      checksum: "0cce96eea650a223c6a094a5a8a02ef028b246ee29b687b58ccf9e384b108019"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_GoogleSignIn.xcframework.zip",
      checksum: "c962cfacf0ec671f2c05107629417e8cf5b08fd39d444c72e3c5d43778582476"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_GoogleUtilities.xcframework.zip",
      checksum: "9d227be0aca326733bcce23d10a7100bd8baee89137d153f26be024a182d277d"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_Promises.xcframework.zip",
      checksum: "9f0ed28c6fb9d6788099e6cd6cefe476324b7b9efe6216984d047e1efebb0e0a"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_RecaptchaInterop.xcframework.zip",
      checksum: "658d7c752b59e1bbe9dd03434a5d2a18efdf77740552765a5bc064b9ca9c9a08"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_SwiftProtobuf.xcframework.zip",
      checksum: "c671c69bee1e56f7974b151bd817748101cc0f00fab2e7985c665d24d497a91b"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "d6db0f82ba96022250f6381d71be79905bfd0ceaef3240761580beba15acc189"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_absl.xcframework.zip",
      checksum: "78000703f8088b2110041be0f6c82e65a48e08aad8e619bab31a435fcdddf144"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_grpc.xcframework.zip",
      checksum: "f5f4657e638741ce6393880a916d893e3875abd6ede91b9e9d1c362a5963afaa"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_grpcpp.xcframework.zip",
      checksum: "6d70a51c2d7f0682dc857aa7f81d14b5855501216d3b3f47adc1790850f49847"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_leveldb.xcframework.zip",
      checksum: "e83063895fa1972d70ead424e70c5fab5c9a4b9c9cd4a5dc2b431dae80986eab"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_nanopb.xcframework.zip",
      checksum: "232c2468a593e3cbcfd7da27be42419ed74459b30535927947542c78831376bf"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_openssl_grpc.xcframework.zip",
      checksum: "70a12f66a050411685ee8399f4ede92bea5b2ef5399120133668c3d2336659fe"
    )
  ]
)
    
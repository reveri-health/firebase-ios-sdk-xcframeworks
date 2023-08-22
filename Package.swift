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
        "FirebaseAnalyticsSwift",
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
        "FirebaseAppCheck"
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
        "PromisesSwift"
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
        "FirebaseDatabase",
        "FirebaseDatabaseSwift",
        "FirebaseSharedSwift",
        "leveldb-library"
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
        "BoringSSL-GRPC",
        "FirebaseCoreExtension",
        "FirebaseFirestore",
        "FirebaseFirestoreSwift",
        "FirebaseSharedSwift",
        "abseil",
        "gRPC-C++",
        "gRPC-Core",
        "leveldb-library"
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
        .target(name: "FirebaseInAppMessaging", condition: .when(platforms: [.iOS])),
        .target(name: "FirebaseInAppMessagingSwift", condition: .when(platforms: [.iOS]))
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
        "GoogleDataTransport",
        "PromisesSwift"
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
        "FirebaseRemoteConfigSwift",
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
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/AppAuth.xcframework.zip",
      checksum: "6cc70f6a4bf814ea21a7cf2818e9c69883ed5ec1fd2027a42d10094065258d2b"
    ),
    .binaryTarget(
      name: "BoringSSL-GRPC",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/BoringSSL-GRPC.xcframework.zip",
      checksum: "6b8053965c1a3638032b0c5b9a78d2f1c6d3029a445f3c6eea685d44e3e0eb23"
    ),
    .binaryTarget(
      name: "FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/FBLPromises.xcframework.zip",
      checksum: "c3c1a8b906e356817dc340500856524cfbf83c771a6014e4b8912283dae9a573"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/FirebaseABTesting.xcframework.zip",
      checksum: "8fe1e76cceee32a44c7d5c50674e597f2f37a8c2edd8eb291ca61c55aca84998"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/FirebaseAnalytics.xcframework.zip",
      checksum: "b5fab92dd897335f5295be39cf39b0d83a78e308aca1b165959020a7b3f658b1"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "edd8c682a1c75295bf4a3c780144fee0161588a5525a766e2f94ddbacf590cb9"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "1ac174b7e0c8529fa25487bebbde8ebf4d214d8a713ad646f6acd73afe0ca5bb"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/FirebaseAppCheck.xcframework.zip",
      checksum: "a05e44961e1704c4d5d8dfa649c8db0be8c8c395cf66d7c73264a83119b4c8c1"
    ),
    .binaryTarget(
      name: "FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/FirebaseAppCheckInterop.xcframework.zip",
      checksum: "3439dad5e5b8c97f5fae76d66cbf58afd6b8f8d9bac410b1532c252fb91319aa"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/FirebaseAppDistribution.xcframework.zip",
      checksum: "f82ccb604fa003cf774f73f50f89b0438729d63391268aa0e053d8116a1b6fbc"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/FirebaseAuth.xcframework.zip",
      checksum: "94649c53aceb38c27305a588fa15e436908497c08c0e2504bb632bf4a1023876"
    ),
    .binaryTarget(
      name: "FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/FirebaseAuthInterop.xcframework.zip",
      checksum: "67869d8217e02b2f23fdd338adce7442e9383a1839ebfa50372732c33e3dfd78"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/FirebaseCore.xcframework.zip",
      checksum: "56335124f0f4cbdbccbb6ce9e7b4dc65e83ce43c9810e2a041a6fad4493e01c7"
    ),
    .binaryTarget(
      name: "FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/FirebaseCoreExtension.xcframework.zip",
      checksum: "32131135d623ec70309d3a0189e5cf04131433bcffd4d85344547df44e948640"
    ),
    .binaryTarget(
      name: "FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/FirebaseCoreInternal.xcframework.zip",
      checksum: "252407b6c088b3f99063c6651b9219a291e97518f9dcb605596a5635da81cc76"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/FirebaseCrashlytics.xcframework.zip",
      checksum: "fb687d6a9a2e70317401d5503a1cef9ca67275565cb54a7bd5b3672e9f7c9113"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/FirebaseDatabase.xcframework.zip",
      checksum: "22911be4d83c03f319da9a57adeaf89e8e1e8790dd40ad4ab3a471c7d765f9f6"
    ),
    .binaryTarget(
      name: "FirebaseDatabaseSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/FirebaseDatabaseSwift.xcframework.zip",
      checksum: "61d9a0d38263ac0ac2cad53c70bc58e51d3226d790f28cde09e05a1dc4b71ebe"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/FirebaseDynamicLinks.xcframework.zip",
      checksum: "2cf2591c7388ec85f4cb4b82e1420623a80063ff8a7237c7a5fce40cabe26e17"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/FirebaseFirestore.xcframework.zip",
      checksum: "891c8158a9a24f3dfe10fd992150bd54edbcf8871968cff426b9f4c4c8999dca"
    ),
    .binaryTarget(
      name: "FirebaseFirestoreSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/FirebaseFirestoreSwift.xcframework.zip",
      checksum: "49d1014b79b7a442c4b8f126c57f3b1050a43659f3c1d2403f7b9b4d9f552ac9"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/FirebaseFunctions.xcframework.zip",
      checksum: "cac2b21fa598dc4b77e1af6035777b3f2a92b91971582360fd95c7b0a4e7d959"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/FirebaseInAppMessaging.xcframework.zip",
      checksum: "a22a756403d940de1832b84324ed911971922bfd9a30365b3ae12b59c67bfca6"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessagingSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "1572d8603a4ef20b83254357e852b296f0c31748b900d366d62eaa62cb466c9d"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/FirebaseInstallations.xcframework.zip",
      checksum: "01421b344ad039e511b4d739709b1f82533418f6bbb1a1d76f52fb934e825a41"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "aafe19f41e017515e6b61a4d335a4f0f002ef47531484101a34fa24111fa7aaf"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/FirebaseMessaging.xcframework.zip",
      checksum: "b008911fa51b6d702c8ac663ff37e10d0ed521bb46e5affafc5cc0ff94e256f6"
    ),
    .binaryTarget(
      name: "FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/FirebaseMessagingInterop.xcframework.zip",
      checksum: "31b3bdea35283fa3f75188aec6dfe0173b0b213aac6c8d1688c70ea3f2b5dbda"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/FirebasePerformance.xcframework.zip",
      checksum: "75497f21ce6a1c84f8a5ae5c16313c972467b3572f7ba85a6f001d3b74332443"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/FirebaseRemoteConfig.xcframework.zip",
      checksum: "9e9511cc67de283f6086a55b7b844b6a95ed068b07d9747ae54e261434331248"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfigSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "50649265294ceb55a323cab458c7a2cc92b05c473321a6984680f9516f59a8fa"
    ),
    .binaryTarget(
      name: "FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/FirebaseSessions.xcframework.zip",
      checksum: "a63962faa987be3ebfd3a9dc2a41251c0cd58e2fb1a11c75f305036d177dff9d"
    ),
    .binaryTarget(
      name: "FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/FirebaseSharedSwift.xcframework.zip",
      checksum: "88d47d94496f6c52213070fa190771843818f4882191ee9235f2015be67f12f2"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/FirebaseStorage.xcframework.zip",
      checksum: "628d38c6859eff5a84ffec88c86a77282a829c976ce6c32af3e90ab7fe892c07"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/GTMAppAuth.xcframework.zip",
      checksum: "64c03a716fdee1adf4bc3fe2551a57c0078c800014a856475a35c18558214981"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/GTMSessionFetcher.xcframework.zip",
      checksum: "30f6be84087aa3860410640358f70f913acbf5d2cae100e072d49df0b256de3c"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/GoogleAppMeasurement.xcframework.zip",
      checksum: "c6197b8bb369b3dbbdc486c1b8d43d178a677d53f7f5fd2cfba41b36a67ace22"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "a268a15d22c615c498159cc66731df05707a4bcfcd64c135983817cbcb9c49bc"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "d5ef76ebd4154cee47ce830b825eac0474671a6348678d8f8d8491dc2cf4438a"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/GoogleDataTransport.xcframework.zip",
      checksum: "fd2be8582852149162561aaf8e888cc5f0c6c8c067ba3e038fd3f55e97c3c1a1"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/GoogleMobileAds.xcframework.zip",
      checksum: "70f8f5df95b69ed54ef86ba0192b2465c9646073839b63d84810f935573b3ba3"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/GoogleSignIn.xcframework.zip",
      checksum: "c94e4d47f5cf4f9ab224d71c81c11fc71c53afa718d1e6fc279c78606d7a849e"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/GoogleUtilities.xcframework.zip",
      checksum: "9ef6608a2f638214736efccaf9041f7a3cb1b1feb832a4732fa05f0902610c8c"
    ),
    .binaryTarget(
      name: "PromisesSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/PromisesSwift.xcframework.zip",
      checksum: "101eab524c15a6a20ec33b2cae2a22190ecde064c4d423dfd98ace7b0991de74"
    ),
    .binaryTarget(
      name: "RecaptchaInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/RecaptchaInterop.xcframework.zip",
      checksum: "af3668e5dca23db510288de5195da19b34236fc21747b57cfc839cb68e0a9e20"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/SwiftProtobuf.xcframework.zip",
      checksum: "bdae55ed51ab170f296b902ab04817f1218fa6c18be42d55a977fd45aa79bd7b"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/UserMessagingPlatform.xcframework.zip",
      checksum: "2ba5b9e4c6b3444fd6dc0e502569bc287c1feae9bb9588a346faef1fca02afdf"
    ),
    .binaryTarget(
      name: "abseil",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/abseil.xcframework.zip",
      checksum: "1cb9f74ff6f446237d6742ee0a426ca32c484e33b89706b5523b2643cdba2b25"
    ),
    .binaryTarget(
      name: "gRPC-C++",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/gRPC-C++.xcframework.zip",
      checksum: "014599cd987422afdf4653c12eeca7c09e6916d15d9fc97c30e17b183a7e45b9"
    ),
    .binaryTarget(
      name: "gRPC-Core",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/gRPC-Core.xcframework.zip",
      checksum: "0299fd96a30cc1d4ab3105eaa3c4db1eaf029fbd5ffe02026cbe0f74bd1150f9"
    ),
    .binaryTarget(
      name: "leveldb-library",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/leveldb-library.xcframework.zip",
      checksum: "e50ebd96cc0e260858681eb1fa555575f563aedb7605bab4ad686c04e6c28285"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/nanopb.xcframework.zip",
      checksum: "5154e459b5edf21077a2425e055a233784a679e7350f6235651b36e0be588440"
    )
  ]
)
    
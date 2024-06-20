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
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/AppAuth.xcframework.zip",
      checksum: "eddf1f321f4154610ab5bed006c2a0c2d4619dce6ab97a79e2ef4bc460ce51e6"
    ),
    .binaryTarget(
      name: "AppCheckCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/AppCheckCore.xcframework.zip",
      checksum: "b11efc806abe2af15f17e48e66937a55f10b1862a56c666294fa25563d4e313c"
    ),
    .binaryTarget(
      name: "FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/FBLPromises.xcframework.zip",
      checksum: "c5062f120d679165dd537521dd8d6a28d451f8fda0352926b42b69d23628fc07"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/FirebaseABTesting.xcframework.zip",
      checksum: "3c950f0c7adbeed0454449cd383921aa1cad859906f51e5afcbda311055d9c51"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/FirebaseAnalytics.xcframework.zip",
      checksum: "596d91a24af8074f4015a74f009a0d26a293a111ff953e765c0d02078a6e5525"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "b96e4bc08e5fc7d3d4e25ea35d271a166cc45f15e86000a373d716375e867fae"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/FirebaseAppCheck.xcframework.zip",
      checksum: "f8ed41e4c3030978ade3527c35c937b1cbfcc5bfa9f4f23a302e42fd4145fa69"
    ),
    .binaryTarget(
      name: "FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/FirebaseAppCheckInterop.xcframework.zip",
      checksum: "d1f42abf11efbd0d6959620ec067080f1e868b278a2a24c23dd3eae5456813d9"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/FirebaseAppDistribution.xcframework.zip",
      checksum: "60d9efbe16af2fb6473c629dde40635c361ecc10a7701b4417eef5236bac789b"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/FirebaseAuth.xcframework.zip",
      checksum: "80ee83c998b08a1c89e936ce2218a5f2aabe591cb6c788e55442a39b1e2e921c"
    ),
    .binaryTarget(
      name: "FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/FirebaseAuthInterop.xcframework.zip",
      checksum: "a11e8113f94439b57bcdfc1f70fd2a7097eac4fa2469e561df303d44d697d7ab"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/FirebaseCore.xcframework.zip",
      checksum: "f95f88bb585aaeb4d6cacdaddc97747fac7d5aa5c31137fdec5a03b1a90016a7"
    ),
    .binaryTarget(
      name: "FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/FirebaseCoreExtension.xcframework.zip",
      checksum: "adfb52982471a7a2800211ad0dc3c3edba7f4093099b9616d50f946505eee3c8"
    ),
    .binaryTarget(
      name: "FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/FirebaseCoreInternal.xcframework.zip",
      checksum: "885684dd43db62dd8627703e93ff996f55163829086e6e3ff009db68e067d807"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/FirebaseCrashlytics.xcframework.zip",
      checksum: "d89859719e1e5ff2ba594f541c5fbb38a61fb50e13f0b8e9303847ec401dbdf2"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/FirebaseDatabase.xcframework.zip",
      checksum: "f7c3b2a1c5095c00c4d28b66084e9c6b6a1f001f970a4ef7e85b934eadb699af"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/FirebaseDynamicLinks.xcframework.zip",
      checksum: "eab56520a20485ef1c75bcbe53add7259f33a4f9a1541b23c384d33abacd8a50"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/FirebaseFirestore.xcframework.zip",
      checksum: "c22e3ac8b819af54fe12f63f129c33d2486250557127017de980c24fd33c5294"
    ),
    .binaryTarget(
      name: "FirebaseFirestoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/FirebaseFirestoreInternal.xcframework.zip",
      checksum: "6767ea4d6c70a7f35c18d0393bdcf19ea9a34566604224d879e5bcf569fbf399"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/FirebaseFunctions.xcframework.zip",
      checksum: "f75a5d2b47b4f2323a61b9c919a6f1d9e973aebbc7d223cca8a116db28abd976"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/FirebaseInAppMessaging.xcframework.zip",
      checksum: "0f67b9fbb8b563ec51a5ad1af31d5e01391def17d937dc3e62a53114a814c640"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/FirebaseInstallations.xcframework.zip",
      checksum: "c38264204e13e1981573666a6dcf4b5bf484b482e26d146908085bbe79561671"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "14217d4f94daa244edac5df099e6dffca372580253cb3aef6ea24dff8b11624e"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/FirebaseMessaging.xcframework.zip",
      checksum: "405285f8f5dfbe734dc4a2fccee70c4f66a4f686a03f0ccfb5dca0a1fc7a571c"
    ),
    .binaryTarget(
      name: "FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/FirebaseMessagingInterop.xcframework.zip",
      checksum: "462a656c5da1d9e580e468c64a5b98860b49cd09adc0e150b4603ca94bb01195"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/FirebasePerformance.xcframework.zip",
      checksum: "c688fe81648ae58252cc20ef0e5c36495cb3c199abd5d9715e451640c2bc9be6"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/FirebaseRemoteConfig.xcframework.zip",
      checksum: "e9da4a4781be787bcc6b3cac94dce1324dfbf38d0d165ccef5dd80ee97f6975c"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfigInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "0095f6801f439731023e051a67696eb617ba10eda8837be4807d0fa79a2a3834"
    ),
    .binaryTarget(
      name: "FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/FirebaseSessions.xcframework.zip",
      checksum: "b702a2387f5c2c5eb56b4c689330d8374393c27ab2592f15d976ec7d66f6edd5"
    ),
    .binaryTarget(
      name: "FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/FirebaseSharedSwift.xcframework.zip",
      checksum: "1c916af933f8c29261b4f253fc053850eb1b7fa1e4af7eb670206cb7f407d55a"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/FirebaseStorage.xcframework.zip",
      checksum: "b49637242a07bdabe257807fc9e518b200d9dfd513e65b00280a991c3cc5fe15"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/GTMAppAuth.xcframework.zip",
      checksum: "f804ab52c07af90db9cc759b7d4b3fabbbe44d6776fa64ede151b0251e6bb417"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/GTMSessionFetcher.xcframework.zip",
      checksum: "073c93a25e48e216d3e44e447c09efbfa0fcaea68fdd6e69a3c76ae61fafe21b"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/GoogleAppMeasurement.xcframework.zip",
      checksum: "0842266273919bab854d46c91fbdd517772b2fef515c1bbf3ba06577cb3215a5"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "472ffed785f7f0079c30337d5e56e3eb61ff1741a2cf9183ac5dac2994136f2c"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "3cd8b196b94d452a2d9070b9811bcb7c1f08e0e571f366447179e0180f3403f0"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/GoogleDataTransport.xcframework.zip",
      checksum: "36772c2d8b490c2972edb6d2cc164081fbc0b1107803c045b385f305ee98cbc3"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/GoogleMobileAds.xcframework.zip",
      checksum: "8572e6f6463c532e9af391c336ba71a2eab7eff39cc40b5785089c734d32ee4c"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/GoogleSignIn.xcframework.zip",
      checksum: "19ae34aa3084591a908549cb7ce775c0928521dec83c391ee987503a9c685a26"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/GoogleUtilities.xcframework.zip",
      checksum: "de5b87e5265891cac1c70cb3205ffb405cdcf59ef005300d7a62f3cb11041f3b"
    ),
    .binaryTarget(
      name: "Promises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/Promises.xcframework.zip",
      checksum: "ed22ac975e18026bea5b48630872a9d5581a9187083fece277b36422013d610e"
    ),
    .binaryTarget(
      name: "RecaptchaInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/RecaptchaInterop.xcframework.zip",
      checksum: "fa5452b1098a63c4b4e1b4ee5e4df7ad07446ac740fcdcd8ed46640ca2e879f4"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/SwiftProtobuf.xcframework.zip",
      checksum: "7bd627c7d7ffd3bdc033c6a0076942b87f9dcd962f77b4356f9996bbfe006582"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/UserMessagingPlatform.xcframework.zip",
      checksum: "1c0293bb0453951980947ddf12407c722a368024757869d835e0e92705c01cbf"
    ),
    .binaryTarget(
      name: "absl",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/absl.xcframework.zip",
      checksum: "af391f631d78ec68ba93cd5391eec87e51e2688c1366c69b32b4a77b996c9148"
    ),
    .binaryTarget(
      name: "grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/grpc.xcframework.zip",
      checksum: "11e01dcc33aa506fea197f18684c2440389a6c0e6f5394a6985b2bf019428978"
    ),
    .binaryTarget(
      name: "grpcpp",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/grpcpp.xcframework.zip",
      checksum: "57ac9225f7e1934c9e00217dc3291696369e71a86e84a7878554c59cbdecaf49"
    ),
    .binaryTarget(
      name: "leveldb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/leveldb.xcframework.zip",
      checksum: "254bc7e9366f735aa2caddddb9e40217716017c3a63a842d14210260908f4fe2"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/nanopb.xcframework.zip",
      checksum: "52b5a0bc045c5d06706ca1144c336c0ee520bd82ecfe5e1417bb731ff1addb0e"
    ),
    .binaryTarget(
      name: "openssl_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/openssl_grpc.xcframework.zip",
      checksum: "71e386cff84eaf7225e48465cb99078405e7420d3e8a3a22044ea334c98ae037"
    )
  ]
)
    
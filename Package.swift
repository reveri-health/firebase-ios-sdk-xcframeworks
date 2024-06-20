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
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "AppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/AppAuth.xcframework.zip",
      checksum: "182bf1c2b0c6c72bcd8f96a104e1cc1704f2c529b4f64e14cdae4edc7a786ff3"
    ),
    .binaryTarget(
      name: "AppCheckCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/AppCheckCore.xcframework.zip",
      checksum: "063966902bc9fdd1ccc2259bd781fda98e7cfd84815a98f5560931366393b4cb"
    ),
    .binaryTarget(
      name: "FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/FBLPromises.xcframework.zip",
      checksum: "c322b843cb8bcb24f81fbe4a0be8f9ec2a1262d4d11c33b0ab58bc2ad2db7c02"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/FirebaseABTesting.xcframework.zip",
      checksum: "6ea73a94c52de1e45d2d67b620faa69f191b35bbaa65ec92dce2a799dee0bbde"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/FirebaseAnalytics.xcframework.zip",
      checksum: "00f7fa11d152b7265a11843ccde6791153771149c9c1769c1a1af867fc39f916"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "0c326b0033f39b5bad7ccc067e5587d1be04576faa2d5dca28b0d34f67bcb702"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/FirebaseAppCheck.xcframework.zip",
      checksum: "a20141b96bf348713943dccc16301b312c9cd1927aa1258c60aaa3c89241fdc9"
    ),
    .binaryTarget(
      name: "FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/FirebaseAppCheckInterop.xcframework.zip",
      checksum: "d52c12bf6be0edbbdc852ff40a27de7204e98ea54c938b106dd05d68eed95c7e"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/FirebaseAppDistribution.xcframework.zip",
      checksum: "428c1200cb4bee67305821f958d2a893f196b09276a20ca2467be98b1267ec6a"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/FirebaseAuth.xcframework.zip",
      checksum: "97851cecd3f3c6e6408454272cbd14cfa6a3010c6c24db171a8cad8a4ff29eca"
    ),
    .binaryTarget(
      name: "FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/FirebaseAuthInterop.xcframework.zip",
      checksum: "aabada51665ae12c917af87af5e0991e1f97f2b3d48d5494502cf7bd805b20a5"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/FirebaseCore.xcframework.zip",
      checksum: "6c58e041a965826e49e681b75d209b212b818d6122e7768e59c130130a9b98d0"
    ),
    .binaryTarget(
      name: "FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/FirebaseCoreExtension.xcframework.zip",
      checksum: "9e019012815aea83ec39a0323e18c7e903aa4ea217f170b0f3a853ed7d97f92a"
    ),
    .binaryTarget(
      name: "FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/FirebaseCoreInternal.xcframework.zip",
      checksum: "5c10c9da3f9a15c417f34c0e62d49bfd0297f4fd69578ccb8667dee3a7c0b8fa"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/FirebaseCrashlytics.xcframework.zip",
      checksum: "1aafb30cde30c5ab27fa22a219eea9c0814e8b816aa315c99461721bc3579b93"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/FirebaseDatabase.xcframework.zip",
      checksum: "8b797430a78a59af4a507b42bc957ab32e7804f84d19473170af84f228ec70a8"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/FirebaseDynamicLinks.xcframework.zip",
      checksum: "eda03c31b35f6e79b26c58304bf4d13da65e82c2c09dc48a7133f41ef517b44a"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/FirebaseFirestore.xcframework.zip",
      checksum: "8873cda710adf77d8c53747dcc2348ef085346ac23bebc33f79702ada81cf285"
    ),
    .binaryTarget(
      name: "FirebaseFirestoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/FirebaseFirestoreInternal.xcframework.zip",
      checksum: "a50de10fe91fc9b99d174b7c78b7d905db5e4bd994e597e3d9b2492dd2f7635e"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/FirebaseFunctions.xcframework.zip",
      checksum: "99fe05321fc83a798c03a842eeea6358c51110fd18677be7d2f378abfca468c7"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/FirebaseInAppMessaging.xcframework.zip",
      checksum: "af79e0f2a8817e2c9088e7787a6d03fdff4bdb17a6c600516e99edcfcfae4286"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/FirebaseInstallations.xcframework.zip",
      checksum: "88f38f62b2efae30814e10a3bb7f2466210fbeca12e8bdbe867d1d0a5bf540fd"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "5c0f63eea1c8bb8739ae4fa5981857a4d5cf42a55e46ee18a88200839f54eca4"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/FirebaseMessaging.xcframework.zip",
      checksum: "444f7538dcd7a3c781d75625e21be632a08432eca3365cd76af37bf141aa31aa"
    ),
    .binaryTarget(
      name: "FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/FirebaseMessagingInterop.xcframework.zip",
      checksum: "dbd6e741ba21abc699582da2c11194a5a825e027f6cc16c6f756a7213dbf7162"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/FirebasePerformance.xcframework.zip",
      checksum: "0fd9035b47047785593fa43f5ac99d0b76650383eaad45845f6a7296e1c767e0"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/FirebaseRemoteConfig.xcframework.zip",
      checksum: "0f5d8f79d3662ceb76e0d6c1d56593093336ac2260f8f776281ccc52b6192bea"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfigInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "c56277df4ef061bb030b84f778dd933c2a7dadba152480e4efb7ea28d0f64efa"
    ),
    .binaryTarget(
      name: "FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/FirebaseSessions.xcframework.zip",
      checksum: "0ba0101060bce5a6d17d6bd7c1e8e63276427836dee50bf375af0d9f9b430b0a"
    ),
    .binaryTarget(
      name: "FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/FirebaseSharedSwift.xcframework.zip",
      checksum: "5a2c2a791ffe3a93006b64a049a86a2342030a37922cf08c83d77f369d1d5145"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/FirebaseStorage.xcframework.zip",
      checksum: "dc1e0eea694ac211d88ab67c08d6aae64c13c04eddf9e66c9207c09636191fb4"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/GTMAppAuth.xcframework.zip",
      checksum: "aecdb653f26d8e674a83ee16fc488301eed519f5ba82b6d584fe30266176d154"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/GTMSessionFetcher.xcframework.zip",
      checksum: "19fda5fcecc648d82f809242f6213a8880e0d17afeb88f0d11eb8047d8186648"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/GoogleAppMeasurement.xcframework.zip",
      checksum: "8d2c502db4c8e5cdd9b96d0b460e1cc1d4ed32b468f233d37e0eb0f4530f0e33"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "c929a8deccf5548d454c956f80325c62f8cbb19599af283a0596c4bc6759fb25"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "e75a1a25aa51868a9f91c7aab23dd66550ab272fc19e16f9624199068c161490"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/GoogleDataTransport.xcframework.zip",
      checksum: "03b7af016d138795bf8156d2d2da6e6ff652f97a2f95303cdfa9b01c1d6fb441"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/GoogleMobileAds.xcframework.zip",
      checksum: "e90c0766607266f2846db75354ded3098b90542e93ab9bb248de224e2653dd30"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/GoogleSignIn.xcframework.zip",
      checksum: "9611d78eb5380e17aa1b2d7d8013ddd5f821c390d72f42bbddae419bebc58d35"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/GoogleUtilities.xcframework.zip",
      checksum: "23e1e593c9034e78d1c65cbeed8db9acc8421c90c35d6a800a11e74fc33e9fb8"
    ),
    .binaryTarget(
      name: "Promises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/Promises.xcframework.zip",
      checksum: "9592fc02198a79a2e0148dbbbf02b084f72d4895b7903e09649c5716a1fa8650"
    ),
    .binaryTarget(
      name: "RecaptchaInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/RecaptchaInterop.xcframework.zip",
      checksum: "66e8eb9467c5180ca4b22cadd05410f49411028d2650179741e731ccd919259b"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/SwiftProtobuf.xcframework.zip",
      checksum: "d4b3575d583c6aa459808d5125eb50b35ba210d2099a25ed039f6beca5c5bf73"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/UserMessagingPlatform.xcframework.zip",
      checksum: "127b8b2dabe1384bc63299bb942b95166e2fb300192fe4bd33d8789436d07169"
    ),
    .binaryTarget(
      name: "absl",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/absl.xcframework.zip",
      checksum: "0624a7666ef50980cade60bcf2f69baa8f67dae31fd40cdb45254627ec1d512d"
    ),
    .binaryTarget(
      name: "grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/grpc.xcframework.zip",
      checksum: "ae8232bed99c4321c0c3bb165b53ac3f17fcf5a1ac4f953761926d261289c682"
    ),
    .binaryTarget(
      name: "grpcpp",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/grpcpp.xcframework.zip",
      checksum: "b941485a34e1a4f9697baad8a04f2abb70a9fc5ba4079326f26b0451a3b33523"
    ),
    .binaryTarget(
      name: "leveldb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/leveldb.xcframework.zip",
      checksum: "0b08bd38ec114923d2deb2943b1c71b4ce9b5ab25e9f61142892ea18ac988797"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/nanopb.xcframework.zip",
      checksum: "a7c5bc2616facfa0755ad32b2d1a82ac5f431c97c7649076a2f5894814e06004"
    ),
    .binaryTarget(
      name: "openssl_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/openssl_grpc.xcframework.zip",
      checksum: "6882ff4ffc7e14a1729c685e7900c8d7d3e3f69a4e7bc9c0278bcfceb95bc919"
    )
  ]
)
    
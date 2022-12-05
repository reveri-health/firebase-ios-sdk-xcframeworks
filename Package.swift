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
        .target(name: "FirebaseAppDistribution", condition: .when(platforms: [.iOS])),
        "GoogleDataTransport"
      ],
      path: "Sources/FirebaseAppDistribution"
    ),
    .target(
      name: "FirebaseAuthTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseAuth",
        "GTMSessionFetcher"
      ],
      path: "Sources/FirebaseAuth"
    ),
    .target(
      name: "FirebaseCrashlyticsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseCrashlytics",
        "GoogleDataTransport"
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
        "Libuv-gRPC",
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
        .target(name: "FirebasePerformance", condition: .when(platforms: [.iOS, .tvOS])),
        "FirebaseRemoteConfig",
        "GoogleDataTransport"
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
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/AppAuth.xcframework.zip",
      checksum: "15e08feffc6f47e2a5ebd7736ea825320f53bf86e751671996bee615711e2a3c"
    ),
    .binaryTarget(
      name: "BoringSSL-GRPC",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/BoringSSL-GRPC.xcframework.zip",
      checksum: "7d546de7ae3f82651e2daa1e10e24dc633a328da85ddd778799607418b48540f"
    ),
    .binaryTarget(
      name: "FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/FBLPromises.xcframework.zip",
      checksum: "85e84837c67ad9dc5a727f1e44b905f67fd248db253f39349902fad878600269"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/FirebaseABTesting.xcframework.zip",
      checksum: "026b8b5bd6e15e91cd0a78d2922036152a46492f3caed5728bc4041a2cd46b80"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/FirebaseAnalytics.xcframework.zip",
      checksum: "071b256f3454814a5ab480ff55176c0bd801ca6eda22ef5f189bbeb17e1cd6e1"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "47a631b7cef7decad743b5b0f73dc20f2b1290842f9b1c38e4a9bd9be0e81a56"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "1314570c3cc771d33463b42dae9f2c75ad2263c8b1b36bb572a38bcb78c8ca44"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/FirebaseAppCheck.xcframework.zip",
      checksum: "c8099f0dd5c0bd75f05426445d68ba0d6b433d5fc8dfc67bd316f49618ad016c"
    ),
    .binaryTarget(
      name: "FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/FirebaseAppCheckInterop.xcframework.zip",
      checksum: "4cacb7aad597903e55cb6b3412613fcdbf39dff55d613fc8818f5cec501c76e4"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/FirebaseAppDistribution.xcframework.zip",
      checksum: "3f2da2ae08803e53233367023e9f0d9fa19eeedbd1aa94678dd019c63b4bb577"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/FirebaseAuth.xcframework.zip",
      checksum: "5da5300e91ab29b3ce90c296905cae3c19510878dcf8c7d64ac420da1c99c0df"
    ),
    .binaryTarget(
      name: "FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/FirebaseAuthInterop.xcframework.zip",
      checksum: "175c5e8e481a15daec097d928aa7de0366723fc47274a0e660a9c8b41e9bafb9"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/FirebaseCore.xcframework.zip",
      checksum: "6efeffb0e377f39b4d15b4522c1b5a611d19ed5d5ccd22cd1d7c1a26529fcd13"
    ),
    .binaryTarget(
      name: "FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/FirebaseCoreExtension.xcframework.zip",
      checksum: "16b4e4cd54b83ed42bd277ef212643d86b67d536b8a68ecea1f7debce92ff60a"
    ),
    .binaryTarget(
      name: "FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/FirebaseCoreInternal.xcframework.zip",
      checksum: "82658158c6cb4f9cd4773096489035c67bc780257780934b6a721dbfdd5c7403"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/FirebaseCrashlytics.xcframework.zip",
      checksum: "ba4a29346f0827077e387308f7577085ee41625c82a6bb3a6aa57539dcfb4406"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/FirebaseDatabase.xcframework.zip",
      checksum: "bdf8795cb6fc66ae7bf3dd5c5362b581ab6df2a174b74531e631fcf5593507fb"
    ),
    .binaryTarget(
      name: "FirebaseDatabaseSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/FirebaseDatabaseSwift.xcframework.zip",
      checksum: "6eda8300e9698ca578dbd19aa1fb770bfbea4deb9d67e9bd6d3e767aa3a99742"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/FirebaseDynamicLinks.xcframework.zip",
      checksum: "f452e3b9a12d6449ecb48525124428df4a59ad59e56f6c3af6745d156d0cc3a3"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/FirebaseFirestore.xcframework.zip",
      checksum: "c49863505f0d5fe75f8785e2537fb5a7b0823e0dba16ff9e73b1f780ee3af267"
    ),
    .binaryTarget(
      name: "FirebaseFirestoreSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/FirebaseFirestoreSwift.xcframework.zip",
      checksum: "717d6b211a1b4e5de9823e0eba361d98ef4b5a24e0783e3abef5afe923dd4093"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/FirebaseFunctions.xcframework.zip",
      checksum: "cd096f4d819c3cb1f0f476c8162bccd654cb016b8f8a6b04918848b52e6089b2"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/FirebaseInAppMessaging.xcframework.zip",
      checksum: "16a35954729f405d80e0d0e08fb1403d9d4f8352ef975ae8d01f41b781cbea98"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessagingSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "8d95446d0bb89c9822c6f2700e84bf8efc2f6dd2b69a7f63685336f7b022e096"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/FirebaseInstallations.xcframework.zip",
      checksum: "0774e5a96c2a956fab3ffb2daba447bbf5a725f6a273c8d684c3836d79b8a52b"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "22574b5ab28eab00bdc8fe809a9f5b049a2d41921d935cb76a7290deb9ba0d38"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/FirebaseMessaging.xcframework.zip",
      checksum: "847573b4cde8e0e1745d2dfed1c423bfa74462ce9c39e75fcb205b0cf8e8d2f2"
    ),
    .binaryTarget(
      name: "FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/FirebaseMessagingInterop.xcframework.zip",
      checksum: "c6d6f868dce9296e5b23624fcf7c0e437e6a20890ff887dc97e167c0a9b473fa"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/FirebasePerformance.xcframework.zip",
      checksum: "06363c2019c5a6d2605cd93ed6faa9e341e7e2908054baff697505fb8a4a74a5"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/FirebaseRemoteConfig.xcframework.zip",
      checksum: "846ec0a801f40f809946c24b8f9469ed65171e8f296ba940680d0b4f00e3d7f6"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfigSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "ff0913f5c4503141508f155d044895f7d5138cd092229bff27724e4830a5ebb6"
    ),
    .binaryTarget(
      name: "FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/FirebaseSharedSwift.xcframework.zip",
      checksum: "551cacf33dfb10afbadf5fdd3fa21717486470a6fa754a8fc4c56448c7e70a34"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/FirebaseStorage.xcframework.zip",
      checksum: "136d1f070703bf7c8a2d4ec9029554d6a8e3df2c604aa2fa3374a452a5a14f26"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/GTMAppAuth.xcframework.zip",
      checksum: "a35ee5764bac63b0d4b95a2e2f3962897223c62d232583a3afec086e7255f7ec"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/GTMSessionFetcher.xcframework.zip",
      checksum: "23ab4e86aa5c7a4e56175ea4a5a72669c816b9570426e150a50aecca9943ae59"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/GoogleAppMeasurement.xcframework.zip",
      checksum: "40a8f00985483d156a3466aa3fb9021f092b77cbe67f5bdb8871c40bcefe44ab"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "26111f98b39788b8a5a9b2e26293a5bfba374d2bf85b0e37d9a48bd45947376c"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "4b5abbce2264b40d1cea0ccc51ec57b4482c13ce5a497d6efecd973b8f50a505"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/GoogleDataTransport.xcframework.zip",
      checksum: "77c88f01793efde9894608b73a61e322a3fb053401377f6d5f490dd652f25bd0"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/GoogleMobileAds.xcframework.zip",
      checksum: "da27e920a2eb3dfc268f7510d1eb52d1df98a23ae7ae20e007062eaa08b35f13"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/GoogleSignIn.xcframework.zip",
      checksum: "c07bb469122e916640662c60e33ee97722f308d9bf5a17668ea062b67c134445"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/GoogleUtilities.xcframework.zip",
      checksum: "fd1bc9d7c14074bda94598ab997382af98b56f87987d4933491ba9a25721141a"
    ),
    .binaryTarget(
      name: "Libuv-gRPC",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/Libuv-gRPC.xcframework.zip",
      checksum: "e1e119b87939889841ceda17f77d634a2a0550bd01275ba8296ee5c98bceecb4"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/SwiftProtobuf.xcframework.zip",
      checksum: "540ad6c6dd8e03cd7f365cb3fb645fa02bd11649463b56546776b4103342c363"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/UserMessagingPlatform.xcframework.zip",
      checksum: "93b67174a9ffb45eee79082710b69257294986eb3b5844979e16908390977192"
    ),
    .binaryTarget(
      name: "abseil",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/abseil.xcframework.zip",
      checksum: "65ecde3b155bdebf549c8fa598551d25a77a310c694f119499f29c8703d03c73"
    ),
    .binaryTarget(
      name: "gRPC-C++",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/gRPC-C++.xcframework.zip",
      checksum: "d2f217232a788553fb4dcca0566bb7e7caacbbee6190dceaed5adfb9f6ad3f99"
    ),
    .binaryTarget(
      name: "gRPC-Core",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/gRPC-Core.xcframework.zip",
      checksum: "8e1d36817d335f84747ee0e8b0d07c7400cc051a8e113ed98743b37371029a31"
    ),
    .binaryTarget(
      name: "leveldb-library",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/leveldb-library.xcframework.zip",
      checksum: "aaca59eb7dde1a8f13da0c4f7f4fffc02c811a0c07c01db6528870e39c796ffc"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/nanopb.xcframework.zip",
      checksum: "e3cbbf8d80a2ff8f22c41612d3c421ef84a1aaef9cb57ef55074ca2245dab45c"
    )
  ]
)
    
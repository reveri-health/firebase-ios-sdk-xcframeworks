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
      name: "FirebaseAILogic",
      targets: ["FirebaseAILogicTarget"]
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
      name: "FirebaseAILogicTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_AppCheckCore",
        "_FirebaseAILogic",
        "_FirebaseAppCheck",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAILogic"
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
        "_FirebaseAppCheckInterop",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
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
        "_GoogleDataTransport"
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
        "_absl",
        "_FirebaseAppCheckInterop",
        "_FirebaseCoreExtension",
        "_FirebaseFirestore",
        "_FirebaseFirestoreInternal",
        "_FirebaseSharedSwift",
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
        "_GoogleDataTransport"
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
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_absl.xcframework.zip",
      checksum: "c5172283c0e9caa10927dd73b21796a157c8b6d2980c4955bc1e0f6f5a757566"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_AppCheckCore.xcframework.zip",
      checksum: "1fe66ad0b4dd55ec93d68e1fb6d83394643bc22e2605da75e736e1f46296487a"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FBLPromises.xcframework.zip",
      checksum: "d9aa0d25389c8a0992f888427af64f7f825814284c08fee6cf6a78b5275cdc02"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseABTesting.xcframework.zip",
      checksum: "c7c75f408a17f20cd6d1c3c1186188dbc78c615b46f5a995d39201e9d02259bb"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseAILogic.xcframework.zip",
      checksum: "e23512216b74ce49dcca88b73f21365a3de298c03fa943535d495732a559f430"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseAnalytics.xcframework.zip",
      checksum: "b920575b899e87f99a085d44042465b9bbcf8b7da30f537d393423dab95877fe"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseAppCheck.xcframework.zip",
      checksum: "f9e7df5fd94b6a5a020caf9c096edea80ef805afd4ccb09f97d91a424887ecab"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "d009abda97470ff03908722921060d3c49cbe0edb5405dae1c0588d75181d230"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseAppDistribution.xcframework.zip",
      checksum: "d0f7e3ff5a1f8d9fee75fdaf1130c8a0c5ead59e7c16c8b1fcd26916470419d9"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseAuth.xcframework.zip",
      checksum: "ef6ebe6b67854007939766431231f74f07b4b5db6dcfb886680df4e932e4b562"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseAuthInterop.xcframework.zip",
      checksum: "5f4f64868f8f1d1adb0663734453972f85f095e431e59d6003f803f0580b1281"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseCore.xcframework.zip",
      checksum: "ec6b57f084f2239376441a2a240353ed2a3ef6dbe74051e1c5ee8c634fb3a2cc"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseCoreExtension.xcframework.zip",
      checksum: "4a12e02fa4a94c8ad34d6777da2726a35131fc5bed61c04b3d2c22590f71a488"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseCoreInternal.xcframework.zip",
      checksum: "dc25eaf36b5aed5cec2178726994f8a94e221402f9d9709a1097bd2d8b2a7cbe"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseCrashlytics.xcframework.zip",
      checksum: "418fbf22c363143bed7dd840386f2982795f44ebf36be280b819a88423085230"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseDatabase.xcframework.zip",
      checksum: "25f540203d8b4182304382cff15ee3326796f7ddd1308c78230cdfbf423128f9"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseFirestore.xcframework.zip",
      checksum: "feb56e6381251d79a467a9425ce73b311d5398b5a48490fd25c69df203772482"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "ff0fd7a9201c5e805905a24fa8e3abe135ae65a7d77036f8616ebd716d85191d"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseFunctions.xcframework.zip",
      checksum: "7f73c279b0e283a21be9aba8771a9207d7d12ee7bacddc1316d2863bb19c5552"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "1f8b6c39b8f9af75826f327f94fbba4d13534c719d6a55cf312d10ec81370bb7"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseInstallations.xcframework.zip",
      checksum: "c93a153645c9e8de28ef56761ad27e4fb9c293db1a89ddc6c954909e24827a4e"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseMessaging.xcframework.zip",
      checksum: "46970ed1e2e4f111c06f0432b27d9fc9cfc12dfc6274be0e71ae7929360579c0"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "62c296d694bbdbc74a347d8ac7284183e5f5b88c557e6b04df9c0265839a7678"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebasePerformance.xcframework.zip",
      checksum: "8429f38f78171cc828971a0f56b57f3ebecc0b9be361140e184a7adc3eca62be"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "d4f1e267751bfaea20067bdcb8b17b2e1c85f1f27b66b89cb29607825d47fe9c"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "91ff7865dacfde1f4d5b5372e2ff12c4079809e8de29dc88fa228232494e8e60"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseSessions.xcframework.zip",
      checksum: "7372a880ca52ea6466bab6d4b86be620bfbebbfeae652981ca85ef8922503810"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseSharedSwift.xcframework.zip",
      checksum: "7c299d3b15a29b5cd3595c1369d798e68d7786d4cc6a1aff55f519aac393cbcf"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseStorage.xcframework.zip",
      checksum: "55ffae555d73d6def50df38da55dc402753c1ce2f4e3467734af5d00f52e83b7"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "70f013777ffcb9591b0d66a4cefddf6c9682717374cb504beb39a62b3ecc986e"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_GoogleAppMeasurement.xcframework.zip",
      checksum: "5d01c07597fcc8c30e9e43c926661c6c27b8e1519f8ec1ab642f910a1765c74f"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "e830ae04e5ce14c5a761e0314a77463c630d72199f61940aa371b136ef1c047e"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_GoogleDataTransport.xcframework.zip",
      checksum: "eabf63db81bddc84fbba927b6c479da687ea8809c56aaf4d0f06aa9182872707"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_GoogleUtilities.xcframework.zip",
      checksum: "3171b0dd825089dcdbe32276c7c5dbc59ffafc8c47bc65563bac45ad1ac93efa"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_grpc.xcframework.zip",
      checksum: "92981f3ac10bb524ef054633ca32ac012841a5800a1203dbffbf313c2991314c"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_grpcpp.xcframework.zip",
      checksum: "34958954de838811201a9b2d87b1260d8bc1c54f005a73582b13c71dfd6858d2"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_GTMSessionFetcher.xcframework.zip",
      checksum: "db096ae43ff73880531eb3f282fc09d23784b43a90c9077dc7c36d12a222f3f9"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_leveldb.xcframework.zip",
      checksum: "8874990e37959089391fc357eb6be23262121eeeb86ecfe506232d4d3d19b2bd"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_nanopb.xcframework.zip",
      checksum: "c79b92e73068714ff32fadc2ddd503fc671bec7ea27431d9200b83bd95eb3343"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_openssl_grpc.xcframework.zip",
      checksum: "17bb5185bf771473ab415dce6050a0a880a5ee60bed09b6c485065b2430c1f19"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_RecaptchaInterop.xcframework.zip",
      checksum: "47fa73a815bcf5db34cee8dc1c30a57309137a8ce6b300cda873fecefe036dad"
    )
  ]
)
    
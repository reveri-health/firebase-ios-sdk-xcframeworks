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
      name: "FirebaseMLModelDownloader",
      targets: ["FirebaseMLModelDownloaderTarget"]
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
      name: "FirebaseAILogicTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAILogic",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension"
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
      name: "FirebaseMLModelDownloaderTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseCoreExtension",
        "_FirebaseMLModelDownloader"
      ],
      path: "Sources/FirebaseMLModelDownloader"
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
      name: "GoogleSignInTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_AppAuth", condition: .when(platforms: [.iOS])),
        "_AppCheckCore",
        .target(name: "_GoogleSignIn", condition: .when(platforms: [.iOS])),
        .target(name: "_GTMAppAuth", condition: .when(platforms: [.iOS])),
        "_GTMSessionFetcher"
      ],
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_absl.xcframework.zip",
      checksum: "3fa7c5966851aa0be3adb04d1c555db3b57091f3e7560411f9d40e99e9ad43bf"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_AppAuth.xcframework.zip",
      checksum: "bead68b56cb163ca6386034c899ed0399197e2902fcc5c39306fc10d9e577ae3"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_AppCheckCore.xcframework.zip",
      checksum: "90833cb6c3bc51f215c353991eb83a153ff1b3ec4137842142c0c265a3164bfc"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FBLPromises.xcframework.zip",
      checksum: "be98c61ab742acf6edd6cf30bc521ae1b332072be9e149d38d0b155e859f8e9d"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseABTesting.xcframework.zip",
      checksum: "772c80e305b7f474ed95fa40fa5f0c37ee5233547c714efc2371f60a13e134f0"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseAILogic.xcframework.zip",
      checksum: "df7b2c2c1a49ce3d79f05c63831e8f420f120622135b758a4cf60466a9298fdc"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "734f5f5fd3f341d425f60b651feacca0c7336815580da5155e7d36c0ec4223de"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "0eacc0364915ded196f5a48f3aefb3fc5fd15900c4b639ea28c02bb642d93d84"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "83d33706f4b8654bb802f6adcab0d3e08e3fb2e8a0b87a384fe91bd0e19ff2cc"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "1715877d295bc0b599f325c4fcacd6d1217f220d2f3ffa0bf519db2916b483f4"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseAuth.xcframework.zip",
      checksum: "da1c9d4b49f51394f152155c679a05936d98ff66cc2187ee4447ae2cd3bdee59"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "4c2ccf7cdac5ad99d94960aa29971801eeda0773631d4a8151ef83f61304123f"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseCore.xcframework.zip",
      checksum: "7868799c4836d1a9e9ec8cc48b7c10bc5c27ae0e8c1dc0e22a1f8bd198aa54c1"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "1e091bb327cc4145a7ca3220350535a03dcc29383d0f22c86cfe2891844b6031"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "d2459ce6ac58373a05b7a2dbaae44aab2618181c9e2a02edbb8bc6c795d0a5a5"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "c8a8c4422cd32b0b8d71782afb7a95605eb96ac8bcec81ca16bd9998f78e9363"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseDatabase.xcframework.zip",
      checksum: "a60f92395a0d25146f3942f1d8ee229e59ffb6eb84f8cf5571ed5e0648917cfa"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseFirestore.xcframework.zip",
      checksum: "01aceaac17e5d7013dd44bbd8479da88dccfcf6843b4572802acace6751dbe1c"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "1839a6b05cf639d68041df06b57c7b5b1947a4e8ce487b6f6bbee1010f0c8027"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseFunctions.xcframework.zip",
      checksum: "3327dd6a1d594b834528ea3690b07245f6e5255401a287ca670db67a851eb4ce"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "034f46fe892b26b941e995b1fa03a0db2ed973c1fb47daa542c208ef550b98be"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseInstallations.xcframework.zip",
      checksum: "3419d77b12ac26f0fded6b0a645b3d5b6774752379baa9f904614f67a38e5623"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseMessaging.xcframework.zip",
      checksum: "5991b890a8fbd658ab9bda8370beab593a2aa58ba026c5c3c9f98a83c4d24ac2"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "e5a090dccdb83dfc5ca14c0f29be4494c6e92c5f9c7fba0ee1a50438048496bf"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "fc6ebc3fb20fdc7bb46341d512ef9e3ac9ff3c7d8794a4e745417f5608f98bc0"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebasePerformance.xcframework.zip",
      checksum: "1925826601a9c816fa5a173f287ab83d6a441de6aeb07b1dcb1359bceac47169"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "44c85cff2c73997916710a9bc5eca27f12843e688b186040749a31206da5865d"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "d9dd57add6859920bd7aa89ef39dad6e984be4431b7c5ce70e01f0617223a18c"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseSessions.xcframework.zip",
      checksum: "a58fc29395482a732fd1630050b8907d4bc5412027635f5ca9b8577c2d357d49"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "c2d069f32a6aedd32da4e476888cb8b413d1bff185a89659893462de67538c02"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseStorage.xcframework.zip",
      checksum: "1b6e1649aa9de2b16bd8e73b975f391e9dd14212dc8cbb4f9e915add249720fb"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "2c85b78bd7b63fb467a40fdd68dedbb1f879daae263be9a98a1ea2ca19fa7bd7"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "bdc524203db51a044be0c75d233055117abfdd4026113ef0fc8f33be7708dd99"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "2a9aa2638d0829777a3faf76ebe02a16e2a8a84f76c78febe85d3d008c9afa6b"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_GoogleDataTransport.xcframework.zip",
      checksum: "a13098a79294899ffd3455adb1fbde0f0f4044762423607f120b9b80a50833fa"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_GoogleSignIn.xcframework.zip",
      checksum: "1e83422bdbc432c7f3cedcad4a6ab1269cc6898bd44e10ecaae3441fd660f98f"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_GoogleUtilities.xcframework.zip",
      checksum: "87cb248f2205c23a2cce8b1a4be094b7c72e389150069380bb346bfabc0432ba"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_grpc.xcframework.zip",
      checksum: "5aaa51af99aaaad73ba3a70913fcbec60b6a8fe4e60324ede87debb93a056afd"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_grpcpp.xcframework.zip",
      checksum: "a9208b31908b99ad9f5f8e576ebfb3a815d4f8f60a464545346a4e014bff5e1d"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_GTMAppAuth.xcframework.zip",
      checksum: "8542e8dd7aa0fc0f2158bb62bb7ceddeac45f54a37b9473c5563442cef6b60e4"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "49e861d1fb419e62fe5a3ed25286b4aa21e72d83067ac784823929afc1b20072"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_leveldb.xcframework.zip",
      checksum: "d037a3f7f9e44a77037ae26504f87e506254672f0a18836c66b9569668f0cf32"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_nanopb.xcframework.zip",
      checksum: "5835f43f20e7c3cb62c285057f701d06f67735831487045f2757b9c8d718593d"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_openssl_grpc.xcframework.zip",
      checksum: "3ba479d08b02ce4ed0b898c9887b998f734cfebb465e2a1dd800c5b3eeb42b7a"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_Promises.xcframework.zip",
      checksum: "612d9ab5c1ea844281c4f93d8d8621291ea039779e2eb01c40b936eec86d8c85"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_RecaptchaInterop.xcframework.zip",
      checksum: "f68c9f28bcd0f2b616e8d86b98f226496d7802fe29b6253aa81434b65611e7bd"
    )
  ]
)
    
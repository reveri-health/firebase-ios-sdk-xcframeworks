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
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/AppAuth.xcframework.zip",
      checksum: "2cb16e2abe21115876019bdcfe796ecbe34b89df35ef261e49de2ef856a53a97"
    ),
    .binaryTarget(
      name: "BoringSSL-GRPC",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/BoringSSL-GRPC.xcframework.zip",
      checksum: "0fb8b3b4e434dd2d9e4b2e0760f821863bf14c26dc035cf098a9cb25f2b662b5"
    ),
    .binaryTarget(
      name: "FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/FBLPromises.xcframework.zip",
      checksum: "5dd54ff6614b33275abc099f8b9edc79010ae0bb997217dc1c95704d0ffcb478"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/FirebaseABTesting.xcframework.zip",
      checksum: "1080c2bab44c3ad0df5ef0052684e87053870e09cd8427a1cfaaa39e8144d130"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/FirebaseAnalytics.xcframework.zip",
      checksum: "4d44bc160a3d83ccab1dd4566d8c20aef84265c056d0191479f067a3c21a1686"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "119ca14cb248b0b7e7fea35c5f30f041b687d37c05410ab6dcf4c824ce15c464"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "4c037f88091c2c5fdf2b4d1920fa95f9a137b34b642b6c4bd3cdac117033ab64"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/FirebaseAppCheck.xcframework.zip",
      checksum: "0dbb96ab7a23abfccc8fd681583e50fa91b4d44411a4c2192b763fbae2cc3c67"
    ),
    .binaryTarget(
      name: "FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/FirebaseAppCheckInterop.xcframework.zip",
      checksum: "9ef5305d7d74cf96ebf622382586accb557a4badacaa7bc39255c2995c32d348"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/FirebaseAppDistribution.xcframework.zip",
      checksum: "fb71fe5c3a6edef1946f72fea87115d4a1d592b9d5e17237a86ba70419ef4434"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/FirebaseAuth.xcframework.zip",
      checksum: "f438338427f8d63f9c464e8fdb5ad0e3f862331cac5a8f9eb68789bc15491140"
    ),
    .binaryTarget(
      name: "FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/FirebaseAuthInterop.xcframework.zip",
      checksum: "2358a9caebf8260d44cfa2bb369a3d8555d2445372048d7e7b55e48649dfd9ba"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/FirebaseCore.xcframework.zip",
      checksum: "5b3f912c1d39c523d15b6facebd9f143ff337bf82f256b0473978b3b5a714478"
    ),
    .binaryTarget(
      name: "FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/FirebaseCoreExtension.xcframework.zip",
      checksum: "661076a138ed0699301f3cd13a2ab66ee4c35f14e4f63ecafe5e91e1a0577a4c"
    ),
    .binaryTarget(
      name: "FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/FirebaseCoreInternal.xcframework.zip",
      checksum: "5bbc6340de9e0797de614864dad37610afcc388f53baacfad5365caaf4562978"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/FirebaseCrashlytics.xcframework.zip",
      checksum: "9046b5007bc9f8fbc2fd5b4a0a29e9731edfc35cd9c7072db15886c807b05f71"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/FirebaseDatabase.xcframework.zip",
      checksum: "3b2e839b14d0f5b7a26c4dcf6f0a5fbb04ad3f82306990c58971df7364b1d2ff"
    ),
    .binaryTarget(
      name: "FirebaseDatabaseSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/FirebaseDatabaseSwift.xcframework.zip",
      checksum: "ae0aecdaa84aa94734b7a33c16e886ea4968b60d633d4392dfc254598658e96d"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/FirebaseDynamicLinks.xcframework.zip",
      checksum: "8fab2cee39457a972dc0a0b6ba690384b504a9ec9c7b5a100394f9bf50ff2ba6"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/FirebaseFirestore.xcframework.zip",
      checksum: "f90a3c2790546d8ff99231dffacb783e008366c7120b03d4f1980ce1667e040c"
    ),
    .binaryTarget(
      name: "FirebaseFirestoreSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/FirebaseFirestoreSwift.xcframework.zip",
      checksum: "5e8e2000ad49f1de315bc5af3f49c7057a1c7fe4d950808ce94a533f9fb42b12"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/FirebaseFunctions.xcframework.zip",
      checksum: "861d699c04c593616d596f7cea235eb1363bfc423562851cd7307f958eb951d4"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/FirebaseInAppMessaging.xcframework.zip",
      checksum: "0df8b0ba6869c4e030ad9964400757979bb53bf3f2693c51e6002026ebb60176"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessagingSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "336463f6c3e298f9e28d58644edc91676c1a09403b2db347944161b3822c73ec"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/FirebaseInstallations.xcframework.zip",
      checksum: "a39ad125311196b4dd2cf24f5bb325b1c2ba2367f2e94cfb0929e8488deacb0e"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "3eb6cb3c72ced3b64ec1d5db601ec0e86de537d46a75b2c41fed708d6b744373"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/FirebaseMessaging.xcframework.zip",
      checksum: "0de4096b802de857e7cfaddcf1d0c4ccfa673d4decaf713257953fe0b6c5bb6a"
    ),
    .binaryTarget(
      name: "FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/FirebaseMessagingInterop.xcframework.zip",
      checksum: "f72baf040bfa66142888b9261819c032b3f41f5afc4d8030ce6501425e6b37ab"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/FirebasePerformance.xcframework.zip",
      checksum: "bf38c57b81b151c1dbecd09ccab400cdbb9d2ea93787eef3ec162b63881dfd92"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/FirebaseRemoteConfig.xcframework.zip",
      checksum: "f49cda8d2f519bb0fd05373ccf068959d373e079aabc50574ed0e87ee7b3de7c"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfigSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "7ef3a165c8484af801caabf107dd483c7df997579cc779a2fce2fd5a165c6757"
    ),
    .binaryTarget(
      name: "FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/FirebaseSessions.xcframework.zip",
      checksum: "3ea7bfa1820b9aabf82745fe66db07eb240985c128124332567d81edc71d150b"
    ),
    .binaryTarget(
      name: "FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/FirebaseSharedSwift.xcframework.zip",
      checksum: "d14359e18d6f5b2165ccc6db93a70b7d2aa549fde67c34aa99357c4da574616c"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/FirebaseStorage.xcframework.zip",
      checksum: "cb483219fe48dd1e0c88a03f49e405379e3fb06b2e0df644f53cb8b0bbb165cd"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/GTMAppAuth.xcframework.zip",
      checksum: "27e245bb430ba03db1f2eb53a670bfcf8223b1a522f045c8b3a28ebfe67d29c9"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/GTMSessionFetcher.xcframework.zip",
      checksum: "6a21218ba0b8f71cae172c8b13527feff6042d8d6a43a742dd94780fe82c6bd0"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/GoogleAppMeasurement.xcframework.zip",
      checksum: "61269d5daa721168cc102478aaa0135abf950379472d80176836088181f5770a"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "1822b8f80a6a0edf2b979ed6f9061ed281331f62ebe65db11c64c683871f1ee2"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "29167bceac725bed6db2513a45610046c91514977c5965b237e2e25897b76633"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/GoogleDataTransport.xcframework.zip",
      checksum: "660ab3e32c069595047136ca388e07a6c36ebdc198a0bf85a7fe75fd1a889cd7"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/GoogleMobileAds.xcframework.zip",
      checksum: "ceb9e124554dc971fbd1a212ae2bf4ab64d0bdd4a6110f2040f4575721be67f9"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/GoogleSignIn.xcframework.zip",
      checksum: "99420d62274363dffb14b4c4e6a1440d255af379413a6ee78114e7263edad976"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/GoogleUtilities.xcframework.zip",
      checksum: "d04b811ad541d6a7ca70074174e9c8d7374bcc8b83346f5add8eb66db8cb2928"
    ),
    .binaryTarget(
      name: "PromisesSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/PromisesSwift.xcframework.zip",
      checksum: "42c0c0065568ac8f5bcf8bdd044b9ebe2708f5f0b1c49e2a9486cf789abb5f4b"
    ),
    .binaryTarget(
      name: "RecaptchaInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/RecaptchaInterop.xcframework.zip",
      checksum: "f04c9395e860506486bb9508b72f6fb6df1491b4e470bb45a210598cd4dc1590"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/SwiftProtobuf.xcframework.zip",
      checksum: "ab0b575f1e04b9a9ee401e9679e86bef0dc15e9152c9faf425b790d82ae8e776"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/UserMessagingPlatform.xcframework.zip",
      checksum: "5167b534285f98055213e5e3f9835223d3432c158e73c2f1dc1873ca9bb61040"
    ),
    .binaryTarget(
      name: "abseil",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/abseil.xcframework.zip",
      checksum: "85bf0f54e131dff92acb1c095942819b48d34db944a9011881406ab9a6d9275f"
    ),
    .binaryTarget(
      name: "gRPC-C++",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/gRPC-C++.xcframework.zip",
      checksum: "21e70c07a3f3c8b00ca9c093de86c31f9dca1b6b15d2718b01bfd18016f5edd5"
    ),
    .binaryTarget(
      name: "gRPC-Core",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/gRPC-Core.xcframework.zip",
      checksum: "da393be95bf278c3dbba59df04086d8befe3006f489af2b36c07b5f52f80580f"
    ),
    .binaryTarget(
      name: "leveldb-library",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/leveldb-library.xcframework.zip",
      checksum: "a03135056c815a32a42b793a6c1a59695b9eca47eb573b1c6b64c3a8fa563b2e"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/nanopb.xcframework.zip",
      checksum: "8efc6b7eee2e76675c103a7f6d3b5eb712bae8258ab9d66625e80830d071d244"
    )
  ]
)
    
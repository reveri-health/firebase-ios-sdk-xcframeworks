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
        "GTMSessionFetcher"
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
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/AppAuth.xcframework.zip",
      checksum: "13af0df0ea2b0347fb5a7b66050db2d439211c18f682472d7862dcb4192d8fed"
    ),
    .binaryTarget(
      name: "BoringSSL-GRPC",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/BoringSSL-GRPC.xcframework.zip",
      checksum: "9080183b66d5cda68a9b7d8c06bc97c8e0ba7c5b2a00d33f380f1bacce614994"
    ),
    .binaryTarget(
      name: "FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/FBLPromises.xcframework.zip",
      checksum: "83882cefbb5c156e17b2ffdc1e984189130242acf3d29da304a397c502504f22"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/FirebaseABTesting.xcframework.zip",
      checksum: "3fddd16a83936bf578892c82a46e6c0f5e029ca19a3a243f9b239f80de22dc4d"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/FirebaseAnalytics.xcframework.zip",
      checksum: "f2afd14394664197346bab0c93179cdd09c5d6b245602b5cc184e8d94f1b698d"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "7a8f237c12447818392b238451daff2c45647b06bb03ad4a048539f780a2a202"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "da9f5cd1d1bd5ada5f35f3e7eba406275d0bc11ab2bfc67274d2cda7530a3152"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/FirebaseAppCheck.xcframework.zip",
      checksum: "d103c899f973964dcdd227ec4a982fc9d569ee32d92459fd2b39864435dffb73"
    ),
    .binaryTarget(
      name: "FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/FirebaseAppCheckInterop.xcframework.zip",
      checksum: "7219104c93f60fe94919c0a7e7ef99c9565b57d2eb44bc8540ccc94cb62def1e"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/FirebaseAppDistribution.xcframework.zip",
      checksum: "3f807d4e5e5059986301bcfdeaba5d52790d45456d6b2602fd6f67a722806a0a"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/FirebaseAuth.xcframework.zip",
      checksum: "0cbd7472e1529035deb9db25eceb73a283bd5914786d7b12b2974599aea1a3ff"
    ),
    .binaryTarget(
      name: "FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/FirebaseAuthInterop.xcframework.zip",
      checksum: "9a7128b2a6f2368265147d695713c29da8af4ac66fff4acf82c868f8e27903a6"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/FirebaseCore.xcframework.zip",
      checksum: "ece0b752826d4504550e62adc8190f84701c8b1f79155421e2e2577c1f5de8eb"
    ),
    .binaryTarget(
      name: "FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/FirebaseCoreExtension.xcframework.zip",
      checksum: "d0646d4dcf3355d7023f7660e00050995b138493e889fff626646dc03143f408"
    ),
    .binaryTarget(
      name: "FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/FirebaseCoreInternal.xcframework.zip",
      checksum: "043c24b41e9a2e84ab25055bc224ab582e18309b8b85d0df61435ecba2c42bf6"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/FirebaseCrashlytics.xcframework.zip",
      checksum: "e4a80179f8f52b831b2cab7d2ae2bd15acda6192bb3da50b6b5bab3676778dcf"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/FirebaseDatabase.xcframework.zip",
      checksum: "ecb6d5c371d3392aba2cf5e4786320ecddfdb518f78b645df7f541807b168faf"
    ),
    .binaryTarget(
      name: "FirebaseDatabaseSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/FirebaseDatabaseSwift.xcframework.zip",
      checksum: "e0d04907caaa7d54288ec1e71f78b275a138f90e4447b26954b7d3f7612d27d7"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/FirebaseDynamicLinks.xcframework.zip",
      checksum: "068b976afd5dc18cbc0513d2ee523dfa39aab1aa98683f6b8a719f085781e84e"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/FirebaseFirestore.xcframework.zip",
      checksum: "b4fee9596f26455943a9dc7a4a2d8fb7477b3e3c3bbc8c5538c760784d36e739"
    ),
    .binaryTarget(
      name: "FirebaseFirestoreSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/FirebaseFirestoreSwift.xcframework.zip",
      checksum: "5bd321355413a6e59ab4ecc61c53b2e88ddf121530fa4fde63df3fa8b603444f"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/FirebaseFunctions.xcframework.zip",
      checksum: "69d086d94631c32a98fa016a4ed56a89e14dd9e496e42090a9495cacf739e26b"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/FirebaseInAppMessaging.xcframework.zip",
      checksum: "c39c56b4f25d870d004861b83d563fa870f02f447409e1dc6c4de18d3cc42cac"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessagingSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "c69ca8d05084cda9b94ffa3fcdcd738c11c621e52eb996d8e5d6bb6f10f7e9f7"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/FirebaseInstallations.xcframework.zip",
      checksum: "10db88202ab90c420363fa25a6bbb3afa442867c067ea099dc2e88f0ff208e1c"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "b9e556105bd28a89ccdd9d53ae7419bf927ca7a2e5a9035c7ba5ed0998c64920"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/FirebaseMessaging.xcframework.zip",
      checksum: "4b804665def15a547c4da70e46afd41694d11a8d03c551e9ad6603933397df23"
    ),
    .binaryTarget(
      name: "FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/FirebaseMessagingInterop.xcframework.zip",
      checksum: "51f5486e46ff492acfdb6d7ee216276cd34438db6e59eda76131fc47a3b9431c"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/FirebasePerformance.xcframework.zip",
      checksum: "ce836d0fd800e752a6e63b8166a20a1053da4ca77f79df4c3e6389b25cdf194e"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/FirebaseRemoteConfig.xcframework.zip",
      checksum: "9e8e9ca2c31c47b41cb063adb8e51c6bb3a56ba60a8deacfb56dde09e3ce26c0"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfigSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "61a750d899ba1597d2ad16b7fd10c426fe2249932158b1bc4c9f9bb0ef1ea2e1"
    ),
    .binaryTarget(
      name: "FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/FirebaseSessions.xcframework.zip",
      checksum: "0c664272a5beb02de74f21b005350c348031ab308979373681974161afdafc3d"
    ),
    .binaryTarget(
      name: "FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/FirebaseSharedSwift.xcframework.zip",
      checksum: "062b11bf8d0ac28845d4fdf2a194e90b273ed396f51102c8fee31aacdf34fb87"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/FirebaseStorage.xcframework.zip",
      checksum: "1d7d0859787a4fac12c2d42fef2a00b29810688c52b08a491a9261ec6f8c1040"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/GTMAppAuth.xcframework.zip",
      checksum: "cec9ffaad89ff8c31e6a2f824c21d005611abed3a1743f76cab51f5324c90d6e"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/GTMSessionFetcher.xcframework.zip",
      checksum: "2a6785977f7866510ec0db20622058f7599836279485e2a7e2562b4f0bd0c066"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/GoogleAppMeasurement.xcframework.zip",
      checksum: "a779b3b8bc2e6fef0b5e4f52978be61ee5ae12d430583615295af191e6973c32"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "c45df5045f7f7d0c666ec23f71a705b85e36f1b0fa90562e59de0f84d0a0e0de"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "64a413445b43b3894969460b4ca7fd833ed853eed342dedf72c3dd738e44b3ea"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/GoogleDataTransport.xcframework.zip",
      checksum: "83439fb6c24a7438e681cb454263aee491b44e0a74f1b5e617e11d1e2bddb77f"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/GoogleMobileAds.xcframework.zip",
      checksum: "59c7623e3489ffcf2b6ca41e08ddc6a856e0226311ad9089c5cf0bff0db85045"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/GoogleSignIn.xcframework.zip",
      checksum: "1f1892fb0abc0d91c010e5394541741563aae9f24c4e1f926d96cb4461db38be"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/GoogleUtilities.xcframework.zip",
      checksum: "b317099c43f675dfdbe1720cf3ab600f88ae64713fb7e0bef48255d0680b7ef3"
    ),
    .binaryTarget(
      name: "PromisesSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/PromisesSwift.xcframework.zip",
      checksum: "e726724c6580f10bdf1531f7cb265ec3a2122943fb0f3022abf07f521082bdad"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/SwiftProtobuf.xcframework.zip",
      checksum: "e698c43d0014cd2d4eb55a3cb9530d2d753b612284d164f587fc2c0484d38ef3"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/UserMessagingPlatform.xcframework.zip",
      checksum: "a5df12540657d448cb2b47dd9bb2b18228f1ff8a5b033f2de2def135a2961f59"
    ),
    .binaryTarget(
      name: "abseil",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/abseil.xcframework.zip",
      checksum: "5389d9da7e1dd73e0c6792365068d57cb699a61d44a3609d0ca490b214b9a882"
    ),
    .binaryTarget(
      name: "gRPC-C++",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/gRPC-C++.xcframework.zip",
      checksum: "33693f01208391744cf26ef0e12f8bc623d6c1da64f981ac08527952d1abd9ee"
    ),
    .binaryTarget(
      name: "gRPC-Core",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/gRPC-Core.xcframework.zip",
      checksum: "0780b7de101111245bab1bc94d4c73a57695b58ffd7807d7f88cc8f095eedb3d"
    ),
    .binaryTarget(
      name: "leveldb-library",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/leveldb-library.xcframework.zip",
      checksum: "56f63da47b90845b629b0f8eae9a769eeb58effa25f6a1736c1242f3169ecc8c"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/nanopb.xcframework.zip",
      checksum: "d4ed062027172cf9c654ff4176f8c1d55dfbbbd2b4ba887cc11e92e29c83de59"
    )
  ]
)
    
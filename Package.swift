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
        "FirebaseAppCheckInterop",
        "FirebaseDatabase",
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
        "FirebaseAppCheckInterop",
        "FirebaseCoreExtension",
        "FirebaseFirestore",
        "FirebaseFirestoreInternal",
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
        "FirebaseSessions",
        "FirebaseSharedSwift",
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
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/AppAuth.xcframework.zip",
      checksum: "484f78a7e87f500c245e08f87a2d0e91e0fd462653dcd7afd6c2d5bc1ba880f8"
    ),
    .binaryTarget(
      name: "AppCheckCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/AppCheckCore.xcframework.zip",
      checksum: "a3ede09a8b5fd80681c98756378f5a7413f73c8c3a3dfb1488349dc8cddf2ae6"
    ),
    .binaryTarget(
      name: "BoringSSL-GRPC",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/BoringSSL-GRPC.xcframework.zip",
      checksum: "a7ca1ad617b38d09f9e7ee58e0c2b7a373a90f9150e2496a186f8ade03bf8695"
    ),
    .binaryTarget(
      name: "FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/FBLPromises.xcframework.zip",
      checksum: "ef7253af2e434d4e430c7769c1f4910655a068f3423c74949b761eaf54dd8687"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/FirebaseABTesting.xcframework.zip",
      checksum: "ed45b4778ee84a6825e759d0676c64720b404a1665db90638beead17ba7651d7"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/FirebaseAnalytics.xcframework.zip",
      checksum: "5678a2f7cbac493ee0500dda401a299842285a7f706e6ed751f29ea041103c6f"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "ef0012697a917b324c734c52db58ce9eff3c758465f5e11e1029ea8e69901234"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/FirebaseAppCheck.xcframework.zip",
      checksum: "3eb44a199fc1d9d9bcdeece33523784c155af572156b38e14c9d63009c07391d"
    ),
    .binaryTarget(
      name: "FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/FirebaseAppCheckInterop.xcframework.zip",
      checksum: "e69982f3837ac7d1a579d97521b681525a704f1b9cad37e0652fa7fe3d161a1d"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/FirebaseAppDistribution.xcframework.zip",
      checksum: "8a4757072828d0996d31c892bd846f00e92728b23a50d8c013a0637df7bdd2fa"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/FirebaseAuth.xcframework.zip",
      checksum: "523eaafdb4f468dd53fe52699cf26e5668b5a293f5753c0a9775ec8a83b502dd"
    ),
    .binaryTarget(
      name: "FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/FirebaseAuthInterop.xcframework.zip",
      checksum: "05f9af02082153bf637d71933306df9ade3cb9d7ebe2cb04a22a4a54c1a02f16"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/FirebaseCore.xcframework.zip",
      checksum: "0f8d2849411402eefd4f4a5f777ba5c70863b3e41cea11770dd6ab3e86acd192"
    ),
    .binaryTarget(
      name: "FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/FirebaseCoreExtension.xcframework.zip",
      checksum: "46585f19993d4c8ed8f2cdd201b91c32aeb4926b6703600ba4fb02c9c221640b"
    ),
    .binaryTarget(
      name: "FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/FirebaseCoreInternal.xcframework.zip",
      checksum: "2094cff4b297f73d3250753f35867e0444701b8da4b947879f565c0d2ae257fc"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/FirebaseCrashlytics.xcframework.zip",
      checksum: "d4fff59a42c5bd7247da47f0745f1744131068ed60493036772a49f25d519bf2"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/FirebaseDatabase.xcframework.zip",
      checksum: "0eb86d11628efd2b0d4105ecd347cf4a0ec0ec1c1a259121e62a1d387352725a"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/FirebaseDynamicLinks.xcframework.zip",
      checksum: "6bf69bd68cd0b167fb90ff3ceb9b972f3b4c0fffe04ce848ecd6d1c1adfd4dd4"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/FirebaseFirestore.xcframework.zip",
      checksum: "44b27227cdd05128237fc648192c564fef7b0e8878a6bb00e425ee7118e72270"
    ),
    .binaryTarget(
      name: "FirebaseFirestoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/FirebaseFirestoreInternal.xcframework.zip",
      checksum: "757a872de2271f670268418fb4c6ca12b8567086597fcaadc155e7d7418dbd57"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/FirebaseFunctions.xcframework.zip",
      checksum: "8b0da7da40cfd0816b2529b72c417bb04c4ce0d5e9c4124c5fbab17cfdcb407c"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/FirebaseInAppMessaging.xcframework.zip",
      checksum: "b8152502e9fb63e71c6e4eb1f69f1e651089335497dd18cc68ab920d307611f4"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/FirebaseInstallations.xcframework.zip",
      checksum: "def5dc8ad5d2c2e50eff4428f1f43b19a351450cde13a7c12f09fdc6c2db368f"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "c863689118d07b1a4872126f118d2dafd63895bdf59b8474ebac42b8363476b2"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/FirebaseMessaging.xcframework.zip",
      checksum: "a4a053da118d32ace57e7d5a6cff6ec3799f8eba9853b4100b7a00f092dc7a2c"
    ),
    .binaryTarget(
      name: "FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/FirebaseMessagingInterop.xcframework.zip",
      checksum: "b3f275c0baa04ec3053677b28036170f37d116ff9cfd5b26bffc301301c7583c"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/FirebasePerformance.xcframework.zip",
      checksum: "87c5ac8a74f8b1c258eb7f83699a97270379bd6395bac4c0f31fb313c4b5d233"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/FirebaseRemoteConfig.xcframework.zip",
      checksum: "c0d77f091a261c07db192e57918d1e0c3e1eb1b2b44396b35eb543d367862f14"
    ),
    .binaryTarget(
      name: "FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/FirebaseSessions.xcframework.zip",
      checksum: "b03c38dda5fa9575314f0711af8a3621cdae4b22c952bc4c50411bfd1936c4c7"
    ),
    .binaryTarget(
      name: "FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/FirebaseSharedSwift.xcframework.zip",
      checksum: "88711e347d40e1cc0d2644f6d0b3a9379ec0ffca4aa1fb9082d6c6b312138ba4"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/FirebaseStorage.xcframework.zip",
      checksum: "78d3cc2bab8b97d175c5569cd2a721fb379f21f3668146a6c2aa7b0593fe300d"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/GTMAppAuth.xcframework.zip",
      checksum: "bb610078bbd92a84780c278db2cee978fe79c42d449a5fe8537b503b27f69eaf"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/GTMSessionFetcher.xcframework.zip",
      checksum: "21b3ad7e5b76ea1de1494d20a5605185ab4683e203882e477f2745c977127c41"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/GoogleAppMeasurement.xcframework.zip",
      checksum: "20a19ea9e804ffa01ae0375e87cdae2ba75f392dbd1d149f1f5b3928a9f2e773"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "90e182d10a58579bdb08a3005d48bdeca2232830b6b2bd969252a3e5ff7217e1"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "8b72382306fb753a3d6b580adb59b46633157f9aaa22e6b0a9c6f5833ff72e30"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/GoogleDataTransport.xcframework.zip",
      checksum: "20cdb9419273867dc54a0d19f9a79673a7a65d91d0737ea9d6504a06806687f8"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/GoogleMobileAds.xcframework.zip",
      checksum: "aaf3b681a2461a26c63496e87c92aa15443db5d878670c8d12b17d55087dfe82"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/GoogleSignIn.xcframework.zip",
      checksum: "3f29c133b77d12740e9d39b0313bf7356593eec4ce4ea32f7d81fbfdfa5fe386"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/GoogleUtilities.xcframework.zip",
      checksum: "174effdfdb869e6d705f870f1754a0aac3d4e65b2d8c81ab32e135097b2dcec2"
    ),
    .binaryTarget(
      name: "PromisesSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/PromisesSwift.xcframework.zip",
      checksum: "bc5364660123806524c9e928c2dc79ad2509f47cba8ab3114f0febd306863961"
    ),
    .binaryTarget(
      name: "RecaptchaInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/RecaptchaInterop.xcframework.zip",
      checksum: "0550b54d138801c7ebcb5bd96d6bbfb8c9376bb707d463d47ea5ba158e94b2ca"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/SwiftProtobuf.xcframework.zip",
      checksum: "88a517c8e65ea8bf30a72b2e846da0d84a9aa996647f31e71c7c963e31210fab"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/UserMessagingPlatform.xcframework.zip",
      checksum: "51af1f4b4a0fa63325db46e7aa56324e705b8885a3909a6fc3b35b04efb818ed"
    ),
    .binaryTarget(
      name: "abseil",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/abseil.xcframework.zip",
      checksum: "54ffac340e39695fc39ecf9bf2e9eef5f4b6018db96609ddc151e6430f6f490d"
    ),
    .binaryTarget(
      name: "gRPC-C++",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/gRPC-C++.xcframework.zip",
      checksum: "9e18fa96006445d4db8c9696ac4f84dc2d7862bacbe3e09928d5c10f2ccbf978"
    ),
    .binaryTarget(
      name: "gRPC-Core",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/gRPC-Core.xcframework.zip",
      checksum: "8478f80ff8efee8a8985b55a1960b3204283c2fe66bbed168ccb82088815a52a"
    ),
    .binaryTarget(
      name: "leveldb-library",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/leveldb-library.xcframework.zip",
      checksum: "f913241fd42c16e29a6dc425fe5cb932b9c032de26b9d135260544d030855201"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/nanopb.xcframework.zip",
      checksum: "742bbaf9973ac7a404ba0a30e8cbcfa93ae98f26c8ffcaa20623ace0109b55e7"
    )
  ]
)
    
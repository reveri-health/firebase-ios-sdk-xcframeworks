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
        "FirebaseCoreDiagnostics",
        "FirebaseCoreInternal",
        "FirebaseInstallations",
        "GoogleAppMeasurement",
        "GoogleAppMeasurementIdentitySupport",
        "GoogleDataTransport",
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
        "FirebaseCrashlytics"
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
        "FirebaseFirestore",
        "FirebaseFirestoreSwift",
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
        "SwiftProtobuf"
      ],
      path: "Sources/FirebaseMLModelDownloader"
    ),
    .target(
      name: "FirebaseMessagingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseMessaging"
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
        "FirebaseRemoteConfig"
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
        "FirebaseStorageInternal",
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
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/AppAuth.xcframework.zip",
      checksum: "3aa1f986377296c065fad8352a30bcfde1300f756bb2d131c783304efd8d0a49"
    ),
    .binaryTarget(
      name: "BoringSSL-GRPC",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/BoringSSL-GRPC.xcframework.zip",
      checksum: "3c89163e9150beaef39a271d742f6507fc9ae6e0fb82b81e0acaa65c2ddb3d30"
    ),
    .binaryTarget(
      name: "FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FBLPromises.xcframework.zip",
      checksum: "5dea55d4eb7c9bd883a8844e959612ce4859b31f00ba7577cef604d33129196e"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseABTesting.xcframework.zip",
      checksum: "e7a8c66a84750357764808443dd7d34001a3412951982f2a0c4ee6e33d1a54a9"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseAnalytics.xcframework.zip",
      checksum: "ab7475c3d2dfa973349221b8208020670a52781baf2f73e1b25f3ff41d2d400a"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "004c2209e6f283a41c273f2051007d79a537351964ea0e47a9ebac8a1dbea5ea"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "b48826e84acb85cf8dc7873f3268427d4471c280978272e5d61c6f926eafc0c1"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseAppCheck.xcframework.zip",
      checksum: "765ad372cb1b13d6a8fbd3d22b1e95a7de17ea0bfd48bc3c9af1cae5e369849d"
    ),
    .binaryTarget(
      name: "FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseAppCheckInterop.xcframework.zip",
      checksum: "ba4bc60bcd86a66745ac3a6591283936cf76921338477edb94c7471a47537857"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseAppDistribution.xcframework.zip",
      checksum: "9c4fc77d76a5270d6963c38f79b9b4371dd5daaa0b4fd2660d1c018f8fdd69d7"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseAuth.xcframework.zip",
      checksum: "705765f62c3faff747e76d1a9db201b25d46631476264965c32b8bd17c12ce3c"
    ),
    .binaryTarget(
      name: "FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseAuthInterop.xcframework.zip",
      checksum: "f1168a1fb43420e3455904b1e9e70e75a7c9faa1540030de216e9474ae44c814"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseCore.xcframework.zip",
      checksum: "c93bd25eaecda358a8a17f3025de5dad7b0b2f32cfe710fc4d22943914e1ee6f"
    ),
    .binaryTarget(
      name: "FirebaseCoreDiagnostics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseCoreDiagnostics.xcframework.zip",
      checksum: "8acc61b33a8dd8f7c89c7fbb04584d70c57bcc09e724e9cbd99062aedbd71335"
    ),
    .binaryTarget(
      name: "FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseCoreExtension.xcframework.zip",
      checksum: "68f7660f03f801f94fe75bc7a4c24275df32215d21cb8b17da5fdb38d2e2510f"
    ),
    .binaryTarget(
      name: "FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseCoreInternal.xcframework.zip",
      checksum: "ff306b273fe9e5194f6c12effa5bebe60e4150d7bdf01da404402b48c3fae957"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseCrashlytics.xcframework.zip",
      checksum: "2c801da839af4e13de8e6b5dc752456466fd39fdce4681dfb5c4118b642e8532"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseDatabase.xcframework.zip",
      checksum: "54c2ea2497ca5117180d3768364f8a476fc1dd65f8bdfc288e3f7d1e7831a9aa"
    ),
    .binaryTarget(
      name: "FirebaseDatabaseSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseDatabaseSwift.xcframework.zip",
      checksum: "8e5b052a299f5d4c920d099fa8903517daef472fcfe4e558ed8d81d01a06b990"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseDynamicLinks.xcframework.zip",
      checksum: "2158b71e94e922d2e1e8cd5013e61804c0184ed50223d2f9dc060db9298c7ebb"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseFirestore.xcframework.zip",
      checksum: "290c8dd45d9f8870dd9605a425cd68fe3959976a716e8c5f3960de68f5b06fc4"
    ),
    .binaryTarget(
      name: "FirebaseFirestoreSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseFirestoreSwift.xcframework.zip",
      checksum: "1436366e0757dff080d8e0ef4b0565ff9d6690c10766996bc644ef445ce325a5"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseFunctions.xcframework.zip",
      checksum: "f33ea15665baa85bd44c775b9f88c5e2f0d28e3bc66d00b6e95ef6764ec390cb"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseInAppMessaging.xcframework.zip",
      checksum: "f30d9f25e29a318d448bff0ed3ea0dd98865c32bf9d68478a8e08279a732f637"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessagingSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "c4ef289874f58690de4a09de66fa05f6a5aacd87cce12d3a1b2778249b44a81f"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseInstallations.xcframework.zip",
      checksum: "31343c58abb4208f1382deedfc5a9f22ff2a1f34f2de4274858d91344cf54def"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "4db4c8c8b5a7104f916ef63f9702c7b5dd2960a311a4b224f15a645192dad8bc"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseMessaging.xcframework.zip",
      checksum: "678b51cc66f06006e71eb359f6adaa1f49618ff6961f36e1bd34643f5944122e"
    ),
    .binaryTarget(
      name: "FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseMessagingInterop.xcframework.zip",
      checksum: "2868b0456a7469b7db457d16f606fda298fb536980c6502e0ec75aed05299fbc"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebasePerformance.xcframework.zip",
      checksum: "3854be7c5b25b97c86087ab18bf8fd6bf61df522457701fe1d89f808e24c49fb"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseRemoteConfig.xcframework.zip",
      checksum: "8ac4f20f5a6ef03d054ba6110ca192bf1d52d2e8e8b9fc3dbc43c70313503450"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfigSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "978fc73d665ed3836046578e84fb48d49e31644c118f803809b62a7d0b1689ac"
    ),
    .binaryTarget(
      name: "FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseSharedSwift.xcframework.zip",
      checksum: "b10949130d56b3232ce3733c839e2199281969e676988db5062094a0d8de85ba"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseStorage.xcframework.zip",
      checksum: "550f221e2ab6ddb1ebfb5f00e6565655b6b0a4cf8eca7d5a88f191bcb3dab9fa"
    ),
    .binaryTarget(
      name: "FirebaseStorageInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/FirebaseStorageInternal.xcframework.zip",
      checksum: "ac0e66a7286a338729d0d29e9f6a24bc7c1407f847ee94ef39c6bdd8735ffa2a"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/GTMAppAuth.xcframework.zip",
      checksum: "8d0319ff31683781acb2c416e4d547256e8693ac0ad25579fe3c4721ad129549"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/GTMSessionFetcher.xcframework.zip",
      checksum: "0bc6b790e98ab2c9f3381e1eaaffeea29a444c88fb0dc885bc8a71bfb77660c0"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/GoogleAppMeasurement.xcframework.zip",
      checksum: "7a3dcad9ccd03c0e48983ce2c28b328388dd468cd5718cdad617f1e0da523ec1"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "31eef940618ff7ecd178b13c83137f2b74d622e45fd650d66478e6101f5ef7e4"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "1428e58a6987980cbcb83ee417edd251cf89d11ea9540dda1b62ee94f6bb8e97"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/GoogleDataTransport.xcframework.zip",
      checksum: "5b9f7ab3ce13242a091b555f2eac8013240826d6b0d7b5609b5f9cbb0db13a38"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/GoogleMobileAds.xcframework.zip",
      checksum: "96602b6ea6cae996430d06199df4eb40d7be720b7e6651b88c81c19f5313612b"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/GoogleSignIn.xcframework.zip",
      checksum: "c395c7107bf55560d3bc16960fb840639bafaf8c335a8d06011b09da1e8cb820"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/GoogleUtilities.xcframework.zip",
      checksum: "e484faae22a0dae3b9faef6661f798207053ecede57cf6f88aaa49f8d9fc00dd"
    ),
    .binaryTarget(
      name: "Libuv-gRPC",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/Libuv-gRPC.xcframework.zip",
      checksum: "0a3741bd55f793d00b169e216272eea7949dd3b8c75d41a296acf611f0e1daa1"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/SwiftProtobuf.xcframework.zip",
      checksum: "65d41a7396983b0e231d4ad2456a0b24fd596a1141b2ac029757091e50fc128c"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/UserMessagingPlatform.xcframework.zip",
      checksum: "63d8a6b0c9bc1b4fb21f8e9a02ed45ed8beb2432c8b79fce6a4888e02c13f540"
    ),
    .binaryTarget(
      name: "abseil",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/abseil.xcframework.zip",
      checksum: "1a345fec6ef9f9776f215b657e4291778955ea4a714d0ce4b06bc6cce54dbeca"
    ),
    .binaryTarget(
      name: "gRPC-C++",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/gRPC-C++.xcframework.zip",
      checksum: "f5bb7ed1e316fbb196c2b5e6501b5b24df3e45436b87479ec24404cb7320564b"
    ),
    .binaryTarget(
      name: "gRPC-Core",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/gRPC-Core.xcframework.zip",
      checksum: "9c11b5e2caaa3afffd04031a9cbbd7867b9dda7d34c646462901cbb5ad094164"
    ),
    .binaryTarget(
      name: "leveldb-library",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/leveldb-library.xcframework.zip",
      checksum: "ecf34e2db20b62e408e3fb6204ff1b4f920e409039cd5cf0be152f02060c7e8d"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/nanopb.xcframework.zip",
      checksum: "4506d8f73a6a13667e89df8dc6ec1a0b2eed11bd60309f0aa8c25e29d851ea2f"
    )
  ]
)
    
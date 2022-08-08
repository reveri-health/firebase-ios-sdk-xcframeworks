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
        "PromisesObjC",
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
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/AppAuth.xcframework.zip",
      checksum: "0df32304a68135e59cf51cadf264e0dbc16067babe7eff10fec0c621998b3c76"
    ),
    .binaryTarget(
      name: "BoringSSL-GRPC",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/BoringSSL-GRPC.xcframework.zip",
      checksum: "f2c46c6ad38db0cddc5f938a89e6ca47e0165fe2362621db8144ca69aae2501f"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/FirebaseABTesting.xcframework.zip",
      checksum: "08db9b65853df537aa4132e974526297a1d6a1211be7dc5b0bc06172499b8f6f"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/FirebaseAnalytics.xcframework.zip",
      checksum: "9dbe6c9c879daeb21e57f0376640183998f16ffbd33da262c6633ae38365beb1"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "78d9c1cdb3163ab8f485081ec6deeb6bfab4310e9a6baa059db3956fab9eb0c1"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "7e2357319cdcaaf49ce74ff484ebf0c425212976b4f38c44b10e08421cd95a38"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/FirebaseAppCheck.xcframework.zip",
      checksum: "9fe4eaa65d8080c7e0c3c6cd70817b9fcdae24988b2a67a3714a955733dd885a"
    ),
    .binaryTarget(
      name: "FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/FirebaseAppCheckInterop.xcframework.zip",
      checksum: "b30b4783a3774e1cd5ded9bfa3c85651ccb8a0350ce70da57eb829b1e45b844d"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/FirebaseAppDistribution.xcframework.zip",
      checksum: "96cb79df8534948e365024a18e6c6d2d146ec8f1b92310a80f5f20166090232c"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/FirebaseAuth.xcframework.zip",
      checksum: "4c4a597aac54cb9ee2b703fdbd1ad671468dff3cf217e1a910e523c78ffbdd91"
    ),
    .binaryTarget(
      name: "FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/FirebaseAuthInterop.xcframework.zip",
      checksum: "777555be76af9cf1f820f11562777cac4650a3b6350309801e2112f871eaf456"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/FirebaseCore.xcframework.zip",
      checksum: "956f762adfcfd2b3a0188a4c1fdbc8dc90341dc644b3edc0fd575dbb795fd384"
    ),
    .binaryTarget(
      name: "FirebaseCoreDiagnostics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/FirebaseCoreDiagnostics.xcframework.zip",
      checksum: "a3fb66e44b22cd64a8a45058f11921dccfce5022751c98b8abe95faed603df7a"
    ),
    .binaryTarget(
      name: "FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/FirebaseCoreExtension.xcframework.zip",
      checksum: "573119e34ef6156a5598b4a011a859c4ef3de8f8e8380b3dd36ffff78a1b572c"
    ),
    .binaryTarget(
      name: "FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/FirebaseCoreInternal.xcframework.zip",
      checksum: "1a90472f7d36078b60fa14c26d48ac3a3a9d552e378768ffe7b80c458f51ae6a"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/FirebaseCrashlytics.xcframework.zip",
      checksum: "26bf3c5a343cd4d3c98dc9717e25ebcc8d17d7728f902e73095073a838fa8134"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/FirebaseDatabase.xcframework.zip",
      checksum: "3e8dd811a42ecde19d6382153f76ef18f654f63beaea1d9c513e0e1176037b8d"
    ),
    .binaryTarget(
      name: "FirebaseDatabaseSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/FirebaseDatabaseSwift.xcframework.zip",
      checksum: "ef70d5f4945318c74d4cee3e59173d663b07ed6c544441abf9a4e6696bdd7c5e"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/FirebaseDynamicLinks.xcframework.zip",
      checksum: "ea5fd3d48081d77435a1ab1819411ca2f15e17d82427667e5459101f8d36cc84"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/FirebaseFirestore.xcframework.zip",
      checksum: "54f85a86d88cf9bedfe99b8b9153f9876a3f77be174c4104edcd42a0aca25719"
    ),
    .binaryTarget(
      name: "FirebaseFirestoreSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/FirebaseFirestoreSwift.xcframework.zip",
      checksum: "90e6daf29a2d9efe55ee68b0ce2191390ea10c53438e5d5f918653332422c612"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/FirebaseFunctions.xcframework.zip",
      checksum: "f7c8c1e9dfacfd02359964807136b58debaa661882baf62c24780f7600741f5b"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/FirebaseInAppMessaging.xcframework.zip",
      checksum: "730d4ed01cb775469b12639ec9c2f1ca38744b5e7b7b129639083e0b518afc82"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessagingSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "0947a96bea50f93b3328164c24a29fa115cbe280da8bc6dfa7c77b15a6e04431"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/FirebaseInstallations.xcframework.zip",
      checksum: "622b7474a0df0dad67081f9479de2c9cbc996113892b800b5cfeb7566ccd8ff2"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "b9126ea343e59329814ce67de979e0d6d062a88853d4b1c6b788add0dbae824f"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/FirebaseMessaging.xcframework.zip",
      checksum: "a7a39eaa99e2e0dec28ec5f8d2c98136a0134d0d31f73a1939e9524302f10a8b"
    ),
    .binaryTarget(
      name: "FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/FirebaseMessagingInterop.xcframework.zip",
      checksum: "87e4b8995a91466508735460d1edfa6d93b2dd444768c03ec649bbca50dc0274"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/FirebasePerformance.xcframework.zip",
      checksum: "4ddf9a0b6073e8399305effc1fbb75d909d9b3acef5bc95b9f1bb29a37134ad1"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/FirebaseRemoteConfig.xcframework.zip",
      checksum: "b30ed261c8e8e952da1f6a2607ae4dfafef6598735c1bf276d8a24a1f6ee56fa"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfigSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "7d35a66e6f4118105bf3c9270520c9a70b7d1c927bb98f419565f1de5b658b05"
    ),
    .binaryTarget(
      name: "FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/FirebaseSharedSwift.xcframework.zip",
      checksum: "0380761060b22183fc4ad4d2374af6af1d3f04dd55bf86f8701342396f3d55a2"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/FirebaseStorage.xcframework.zip",
      checksum: "d935373e63d990007aa79a02f4e9a36e47f910ee3722ed624cd3c9186f38e01e"
    ),
    .binaryTarget(
      name: "FirebaseStorageInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/FirebaseStorageInternal.xcframework.zip",
      checksum: "113ef068a2c1fb8b186e6b48e3a8e6f0f7e12294f5d4abeee56e16166c0e0478"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/GTMAppAuth.xcframework.zip",
      checksum: "2d3b6dfc8dcfad36efeeff0f2e479415936afe5283ca9af3cf72f71668d2c96b"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/GTMSessionFetcher.xcframework.zip",
      checksum: "5c37e31681cd6c1b6a4b56dd2f252006c57ee8c2d3683e0ee231d68f1945b012"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/GoogleAppMeasurement.xcframework.zip",
      checksum: "461ce49094fc70b6a389bbbcf253432c1759fb197303aa8e05dff9508b11d8e1"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "81214046a24e3825a19a12720c6bf91c73b58e40dd732fb991b7a405a3063be2"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "f1910de38573aa5b335f1202fec4b57fe4771815d130ee4ca0ae60e668d40a0a"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/GoogleDataTransport.xcframework.zip",
      checksum: "3527c389fad3f3b684f0b186f2a0f3c17523aca3af245df8a3709ee2ea8c0886"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/GoogleMobileAds.xcframework.zip",
      checksum: "8766338089e0492bbd6d9527985b2287e7be6ebe2dc072cbef5748dbc5652013"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/GoogleSignIn.xcframework.zip",
      checksum: "1b703f33c6fe6f5e063c3321adda6ec356d41613660bcc015f0bc0c731ceb15b"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/GoogleUtilities.xcframework.zip",
      checksum: "59fcade4555fcbf7aada12a227dd8cc8bb83375f74696796dfeecdfe4ce646e4"
    ),
    .binaryTarget(
      name: "Libuv-gRPC",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/Libuv-gRPC.xcframework.zip",
      checksum: "70abf481a6b214bd0e5750b9b200b9779a1fe5c86c0f9e3cd4fe4aa7c5a29ce4"
    ),
    .binaryTarget(
      name: "PromisesObjC",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/PromisesObjC.xcframework.zip",
      checksum: "a44e5b1c8fa211521ff4f803c6ab6424e270382dd0da614237a55cc02bd23fae"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/SwiftProtobuf.xcframework.zip",
      checksum: "c518f817a4ba478f944b8fbe86dd0accd2f44ded58df8c82a70eac93122fdfad"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/UserMessagingPlatform.xcframework.zip",
      checksum: "d61ebf6ca808ed306130794fc4562654e0ad1fc92d37b1629a2767646d3a7117"
    ),
    .binaryTarget(
      name: "abseil",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/abseil.xcframework.zip",
      checksum: "7e344bf225c45818ac03889fcbc86a98f62733e37860add8b88980fc1730e0ca"
    ),
    .binaryTarget(
      name: "gRPC-C++",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/gRPC-C++.xcframework.zip",
      checksum: "9f991d2a350a79f222a7a41379546a7e7d781b67d0e6840b27aec2d6dfd79743"
    ),
    .binaryTarget(
      name: "gRPC-Core",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/gRPC-Core.xcframework.zip",
      checksum: "3d639df658d9fca9940e571b86bb8a9bea650bfed09de8257d090874fddfcd19"
    ),
    .binaryTarget(
      name: "leveldb-library",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/leveldb-library.xcframework.zip",
      checksum: "6cc2b26d4c63684a7241726000e6065fc01986e72b74c7936b1a38226b4a7aab"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/nanopb.xcframework.zip",
      checksum: "2d681d9c56ba09e13188e307931d46fec0585f6ffc60631d7b8e2694e3b9402f"
    )
  ]
)
    
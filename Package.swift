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
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/AppAuth.xcframework.zip",
      checksum: "11f8495ed37f69e16d1fbe14ef9ee0803f4f94d1dfb59a0155b71e65f8eb5467"
    ),
    .binaryTarget(
      name: "BoringSSL-GRPC",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/BoringSSL-GRPC.xcframework.zip",
      checksum: "c881a6adb4424d35750dac97f60371b7d793f25024c16cd2d5072c007c666351"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/FirebaseABTesting.xcframework.zip",
      checksum: "6b0524c219f730ff33b04824180e2e5bd4d59e29121ef4e3f0165ac1710391d4"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/FirebaseAnalytics.xcframework.zip",
      checksum: "f6898599477972adf5692212a0993a6d489d3e1f9086767eeca4c979d60dba4b"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "398d96a6d055231b913367f14e4cb2b5c51d07180512abb698b205c096aaa44f"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "576f46fe62bf29815201266fc978dce93cb2ef480f7fc671d26c40eb6369abd4"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/FirebaseAppCheck.xcframework.zip",
      checksum: "6840f51c9ced389f9b4dee8f67218d1761d2ef199cec6e4683b45075d011e964"
    ),
    .binaryTarget(
      name: "FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/FirebaseAppCheckInterop.xcframework.zip",
      checksum: "2f84198b9075725b448c2d5e7c8391217dc89ececa536b90fa9a5f3c2f7dd1c1"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/FirebaseAppDistribution.xcframework.zip",
      checksum: "c3a839b15ba55bb2f6f9cee36d3b5a67bd58ddc003c4de565f27bc4244f28b21"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/FirebaseAuth.xcframework.zip",
      checksum: "05f552cba25c786323eef6b073913b60b4b65fad7cb0dcab7373d77b98f3eaff"
    ),
    .binaryTarget(
      name: "FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/FirebaseAuthInterop.xcframework.zip",
      checksum: "a3b9a62b3e4d05ed1d0405383572eff0dd6e6d4322b8677e77307ca1ac790f1d"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/FirebaseCore.xcframework.zip",
      checksum: "23f69bca6297ac275a04a330b287a3ea60666aa7c5ed3d98efd3476e08e2a593"
    ),
    .binaryTarget(
      name: "FirebaseCoreDiagnostics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/FirebaseCoreDiagnostics.xcframework.zip",
      checksum: "f30a3be0efdc6e5308c185e950e00c6e9cb628ad465e5ab5f24564d26bb4fde4"
    ),
    .binaryTarget(
      name: "FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/FirebaseCoreExtension.xcframework.zip",
      checksum: "757349bba3ab981fdbe7cab981260c81dd8acb47155e2e45e90d8f588571cc5b"
    ),
    .binaryTarget(
      name: "FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/FirebaseCoreInternal.xcframework.zip",
      checksum: "4fd2613bfdfefb967bcde97005d725d5ec1c3e7e86a40b30cb5d9e03cb961a5e"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/FirebaseCrashlytics.xcframework.zip",
      checksum: "c6098abc6ee1551707409b38a1028185df7f681db2e232b9f812ff22bbcef684"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/FirebaseDatabase.xcframework.zip",
      checksum: "a1011716c2acb31aa28e81640132c11396a16896fc6195b80b564e9ff0a1ca15"
    ),
    .binaryTarget(
      name: "FirebaseDatabaseSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/FirebaseDatabaseSwift.xcframework.zip",
      checksum: "4c8a6e6f3b6be1cde271d1aee300613ea7e7c888155210fe6353b5e2c497354d"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/FirebaseDynamicLinks.xcframework.zip",
      checksum: "54b4a064ddb1f1356e5ad4286ceca6ed70947e25745ea6b0cb0f7761a4a38d96"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/FirebaseFirestore.xcframework.zip",
      checksum: "636b574a541353b4c4683c3987484e837b2e3cbd036671930914faa10d21a56e"
    ),
    .binaryTarget(
      name: "FirebaseFirestoreSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/FirebaseFirestoreSwift.xcframework.zip",
      checksum: "c87f5b0988c0e62f4d5a91e9d539f744bf20ece7b59a309d9d80f51b99c82827"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/FirebaseFunctions.xcframework.zip",
      checksum: "2d0b8053eb76ca7035430439cf96b65f38c5869dc7e5f71fb09ed46f914d180f"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/FirebaseInAppMessaging.xcframework.zip",
      checksum: "7c6adb22f3b6cb330ff73655ef67c20030030202fe42d11d2a384db1a91b352f"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessagingSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "475902b62d4d1eef87391e792f5593a9cc414b749256551a86247ce5952917ed"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/FirebaseInstallations.xcframework.zip",
      checksum: "44be3d4cc5830ae406c3431039b156495c845425b1f1efc2018d04c7ddd098a4"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "bf95246b2497511b67c734c8662f2d1933e71c6a3589f2ad7448f36e4f510f64"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/FirebaseMessaging.xcframework.zip",
      checksum: "83beba926b6df83f87ef1cce84a6e581de0e0b3b777c0dfd42213d3dffb54556"
    ),
    .binaryTarget(
      name: "FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/FirebaseMessagingInterop.xcframework.zip",
      checksum: "fe651ae7e0969f7e17802d632b7604181a8fd3cb1668d2ba57c1a8693d89ad17"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/FirebasePerformance.xcframework.zip",
      checksum: "c0f6cf08eb7d26d786e2d9d72697a92e30903812daf54a6cd8085182e0eca4b4"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/FirebaseRemoteConfig.xcframework.zip",
      checksum: "598bba3dd20863fb0ae30f9dd64c0bdbf340536ddce5adae8074658bff38205a"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfigSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "55a11fab23640f050b11defe8080c21f62d1dcf39df30fd8c46b3330712e065b"
    ),
    .binaryTarget(
      name: "FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/FirebaseSharedSwift.xcframework.zip",
      checksum: "4770825ea8423275e0879a15555b222d5170655089e16339cb2267bf45de470d"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/FirebaseStorage.xcframework.zip",
      checksum: "15abbea0b59137efe39035665bd794e14e94806b805e886734391cbce7cead76"
    ),
    .binaryTarget(
      name: "FirebaseStorageInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/FirebaseStorageInternal.xcframework.zip",
      checksum: "15c5735143c5e6bd3192370e1f41e7389fa251a64ec018eecda0017b7ffb49b2"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/GTMAppAuth.xcframework.zip",
      checksum: "876e65e1da6d49a9932e5d18244c3c76a7566e534c1004fea7f6b6385a0f8917"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/GTMSessionFetcher.xcframework.zip",
      checksum: "0ec2baef3447e2ff1bd3f8de35070e99d0a2c6039251076cade5421b93f1f607"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/GoogleAppMeasurement.xcframework.zip",
      checksum: "49ebca1dc53b7107e7ff824883811e92bc8ee328af9748b33201f1f67a2349dc"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "fb3b75cdb2d398e04a3562448dc0813dfe73f31e8708368adce985446a805ada"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "6d69d511c6f2554e783425ea338671d90801ddd0a130991c343570372627f766"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/GoogleDataTransport.xcframework.zip",
      checksum: "d664dd14360e693869848b52fd48c7681dff574c0d51bbfeff219e5e2ebd3177"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/GoogleMobileAds.xcframework.zip",
      checksum: "56a286db1e78c7090086c81404bbdd12252cfdd5e260d9463c1af61388199e56"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/GoogleSignIn.xcframework.zip",
      checksum: "67fcd18090b692635c843cef3bc974befcaa8fef6c1e714cd36c2d2bd60178ca"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/GoogleUtilities.xcframework.zip",
      checksum: "6a40e08c51748a799e9899fa1778090fb59f577bfaa941413f4fc991d41edebc"
    ),
    .binaryTarget(
      name: "Libuv-gRPC",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/Libuv-gRPC.xcframework.zip",
      checksum: "2ab63d4b3a1c95378e281d3e69a9c6310d66bb252b9c5e63693f30701f02a904"
    ),
    .binaryTarget(
      name: "PromisesObjC",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/PromisesObjC.xcframework.zip",
      checksum: "3882e6d79af211b632adcb0a41f8d21c7e07f7351b523c6c09c0be246664438d"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/SwiftProtobuf.xcframework.zip",
      checksum: "b25457ad929d9a9f3a4e459f7ba8d7c7338ab6ba3c7241e26c86f025c4c71235"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/UserMessagingPlatform.xcframework.zip",
      checksum: "58c6da348572a54e7a244da97a826b0e99f0438a0058623b825240cbc839d4f1"
    ),
    .binaryTarget(
      name: "abseil",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/abseil.xcframework.zip",
      checksum: "f52ee4d5a22729d84a02dc3a025abcd3418a94699ab7c6784e9c3a04cc784cba"
    ),
    .binaryTarget(
      name: "gRPC-C++",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/gRPC-C++.xcframework.zip",
      checksum: "83f0cd7042cbe4cf13d9672d0a76a0827d4b5ee24dd5581469f015a2bac22778"
    ),
    .binaryTarget(
      name: "gRPC-Core",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/gRPC-Core.xcframework.zip",
      checksum: "de738561161a9228ced028c9b3926c23605b101a66cfb4c9109cf4502227b047"
    ),
    .binaryTarget(
      name: "leveldb-library",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/leveldb-library.xcframework.zip",
      checksum: "0f40eaa0c8e1c8fb253679c7617156214b86741e9bc851ebcc9c3ebead24000c"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/0.0.0/nanopb.xcframework.zip",
      checksum: "a744db24cfd0219edb14e495f8945bbee09bb60da45abb703ea7ac6086bba036"
    )
  ]
)
    
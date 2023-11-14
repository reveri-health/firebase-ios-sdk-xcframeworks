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
        "FirebaseAppCheckInterop",
        "FirebaseCoreExtension",
        "FirebaseFirestore",
        "FirebaseFirestoreInternal",
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
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/AppAuth.xcframework.zip",
      checksum: "97bf81986e024cd2c656e02f0369521b224d0e032cc6d4009f2439c581960f8a"
    ),
    .binaryTarget(
      name: "AppCheckCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/AppCheckCore.xcframework.zip",
      checksum: "358750e3681dbd3f606925798adf4ccfa5a68a1ed5766454c92bf77030227f3e"
    ),
    .binaryTarget(
      name: "BoringSSL-GRPC",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/BoringSSL-GRPC.xcframework.zip",
      checksum: "2cbc45c98f6a85e39b961f68228641664b006eb2e7c5b8335f18d61b0fac4fda"
    ),
    .binaryTarget(
      name: "FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/FBLPromises.xcframework.zip",
      checksum: "240502891e1fcb08c90efda111593ea33385e63b879c2aaff3fa7e66361d22d6"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/FirebaseABTesting.xcframework.zip",
      checksum: "8537870af71a555f744309e38f3af27cee55b0767f523599ce263f35022fd221"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/FirebaseAnalytics.xcframework.zip",
      checksum: "db2ab84e8790685bf8e096fc68d1c852da1a145173263a047c2fec8c1c6169d6"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "6734f22d17a5ba6268846d5f14815cbf84dc74875120d683029b3c5829521c22"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "6afbf9f2f495764b7ad09815a26709a7a49b84eee5a9bfc4e2a6fbf5c5e7c8f5"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/FirebaseAppCheck.xcframework.zip",
      checksum: "855b31563832f05ebf7f117c8f4195f28828d8307a7520af2a62bf2968c7622e"
    ),
    .binaryTarget(
      name: "FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/FirebaseAppCheckInterop.xcframework.zip",
      checksum: "434d287971546f84a7224afce6d2432ba1109581c3da75bfd8bc4291f22f4740"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/FirebaseAppDistribution.xcframework.zip",
      checksum: "35435fd7922539ba61eb4f6e3ff09d51a28d9f04453f6e0bd1a9317b4be16f47"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/FirebaseAuth.xcframework.zip",
      checksum: "c528b62b154fdeadac8fc2f5f90614f658032b29dc0710b1e98256fd2e8a7caa"
    ),
    .binaryTarget(
      name: "FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/FirebaseAuthInterop.xcframework.zip",
      checksum: "f0997f7184ee8270107aaceacef3cc0752132e271a2a2d85fc03ced91a516482"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/FirebaseCore.xcframework.zip",
      checksum: "a3768923b5102b5d9b954291f1843e5cbbf5c4d925a381d677508c7a252fea36"
    ),
    .binaryTarget(
      name: "FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/FirebaseCoreExtension.xcframework.zip",
      checksum: "3aa616d52fef2c96530050bd077e21e2cc146d0bafcb0b4bb4a136703715fb64"
    ),
    .binaryTarget(
      name: "FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/FirebaseCoreInternal.xcframework.zip",
      checksum: "87aa56d42bc0f851dcf9e0877287742d4f3014bddc68d605627a53c03828254c"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/FirebaseCrashlytics.xcframework.zip",
      checksum: "e6e3552b15c437a71f084fca40ecd24c79e4d14aadb2e44fe07631cd6dcc4fac"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/FirebaseDatabase.xcframework.zip",
      checksum: "86012a509760212df285d12b2a385292278e4072b029e91ce4b54da617e37c68"
    ),
    .binaryTarget(
      name: "FirebaseDatabaseSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/FirebaseDatabaseSwift.xcframework.zip",
      checksum: "30630b22b4e2478390d436c147a72b29846cf0f088f44607e32022f2061b9a76"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/FirebaseDynamicLinks.xcframework.zip",
      checksum: "81e7a83354e52d30a7b3411078a707846141da3029c4a2855ac54312f505f19c"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/FirebaseFirestore.xcframework.zip",
      checksum: "4fdd74b869b7bea2de5743b64fd065937f796539632beb2150a304f833aa1e21"
    ),
    .binaryTarget(
      name: "FirebaseFirestoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/FirebaseFirestoreInternal.xcframework.zip",
      checksum: "39d716a5a1286388b29a0f92f89ea4cc9465bb0fd0bd016326053cc9140da069"
    ),
    .binaryTarget(
      name: "FirebaseFirestoreSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/FirebaseFirestoreSwift.xcframework.zip",
      checksum: "31adfb715a9e467461eb9c100a328d1fafdb9065bcbf48221f1909a41a94e44e"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/FirebaseFunctions.xcframework.zip",
      checksum: "51bacd50b05e89ff8810b3b9fd28c5332205b9687d17bc25943f178a5a76eb3b"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/FirebaseInAppMessaging.xcframework.zip",
      checksum: "0f2a4e75946660ad34247064b9aa4b8e01e77ee247963e7eb32a675b12ec5081"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessagingSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "28558ed713f823c3e43b6fab6103a339799f46649fe0e1cc052de95bfe8387cc"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/FirebaseInstallations.xcframework.zip",
      checksum: "a2547c295b9a5064da535c3f74010565f22dbcc1f18b14c3cded897f014da856"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "77e0d36dd66700ad260d4e91463e7cf2f725e777c1ac851a0d8693d87c43e0d1"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/FirebaseMessaging.xcframework.zip",
      checksum: "f0a1be19658b72feb378077c5b7e1b663104f9b6892eaf8c750e1e2571f81720"
    ),
    .binaryTarget(
      name: "FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/FirebaseMessagingInterop.xcframework.zip",
      checksum: "1ec9a02a30f5bb424825ce2ad684bef6a9f771f39728ab64aa1de8fa1241d533"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/FirebasePerformance.xcframework.zip",
      checksum: "7cfa01179a6230f917cba05102657ad386300371a334b66e575fb8941e5b9548"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/FirebaseRemoteConfig.xcframework.zip",
      checksum: "cf6e9803e71e87e0fb2a089d004ad7ee73c3911856a46b44f76105409a69fffb"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfigSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "97854be2b1a4712475ff7de8275a0115c2444655e92d83439e6cb75b73ddca21"
    ),
    .binaryTarget(
      name: "FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/FirebaseSessions.xcframework.zip",
      checksum: "7a98aa6bdf6eed4ff098b18a4d4803764ff37998878f6561182923a987694812"
    ),
    .binaryTarget(
      name: "FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/FirebaseSharedSwift.xcframework.zip",
      checksum: "21c0944b8b7a567889bd53758b03b45c67f5d1dcf92d0322cf40d0b22c6dbee9"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/FirebaseStorage.xcframework.zip",
      checksum: "fa735ce839556f46550c80e11671cd6bf011de1744ca7302125b80ac8465ac1a"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/GTMAppAuth.xcframework.zip",
      checksum: "f72baf9c31ffb13c0cdaa52939b5737a81507517a5dbc0ac4598057c9df2f45a"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/GTMSessionFetcher.xcframework.zip",
      checksum: "cd5bad6dbe2a5e181bc74d3b5a6ee3086c1805795700b8a11bc9181190ca56ae"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/GoogleAppMeasurement.xcframework.zip",
      checksum: "16cd31d203322b3ec4542ea77a8e447fd2f4972977929093495740a89a27c883"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "7bd7dd459f4ef109fc07e02d59ee65821ebd11be25cf41980150e2ad2af8afcc"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "f5b213244c0426cf8ded9e414571215d5c4e7aafd185dcb6da75cf0a2878f2ef"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/GoogleDataTransport.xcframework.zip",
      checksum: "ef142166d61ee2b0cfcbabfe1bc8bd52e888925fdcf5f223f617a3b5325fad9c"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/GoogleMobileAds.xcframework.zip",
      checksum: "9de8617b66fce4ee54237a648406d4e68e285fd3e71850dfe3c5bf4837e4eb02"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/GoogleSignIn.xcframework.zip",
      checksum: "2c084ec707b32a0c1e96f8c6efcb2dc7f5d0193927061535ab38dfa60a3553c7"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/GoogleUtilities.xcframework.zip",
      checksum: "a0f453d6418cd80bf70f8f177a33736214b8f84bb85cf889a9a28ec9ceb17f26"
    ),
    .binaryTarget(
      name: "PromisesSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/PromisesSwift.xcframework.zip",
      checksum: "b2f6ac822e86e54d43731e0177f25c5e8ce5406c364a6c3f76fcaae2b0b4b3e3"
    ),
    .binaryTarget(
      name: "RecaptchaInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/RecaptchaInterop.xcframework.zip",
      checksum: "a7dabe2a76cae48a08b909b1bc711109917567991f7e453bbcaaf9d1ca3648e6"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/SwiftProtobuf.xcframework.zip",
      checksum: "2aed428d28f6b6bbc1d2a02e626cbcaea76c18c89e009fd9932c4fac871a4659"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/UserMessagingPlatform.xcframework.zip",
      checksum: "699c146b697d26554effb4508383f077a0847bbb42e669af509799aaeca25d3a"
    ),
    .binaryTarget(
      name: "abseil",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/abseil.xcframework.zip",
      checksum: "aee9d1eab8ac8b408bfb8baed301e380db49c8a79cfd4999cbdea16de7a4ced0"
    ),
    .binaryTarget(
      name: "gRPC-C++",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/gRPC-C++.xcframework.zip",
      checksum: "ee168f67d52e017e6e282ab7f8a2b191a8324fe0698ef75f7c059b6d021dd7ab"
    ),
    .binaryTarget(
      name: "gRPC-Core",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/gRPC-Core.xcframework.zip",
      checksum: "0351feb4900aec9d53b3d2b0351df2119e31d500fede53330249dbc1d6f52558"
    ),
    .binaryTarget(
      name: "leveldb-library",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/leveldb-library.xcframework.zip",
      checksum: "c8e5c5b882161f8ed076de9261ad85098507333736f907fd9821331ccbae7b8b"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/nanopb.xcframework.zip",
      checksum: "87014f8a0f48f20834e574559bc46366b28570197270336d56737d09ad9fdc6a"
    )
  ]
)
    
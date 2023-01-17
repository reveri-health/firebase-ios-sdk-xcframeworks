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
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/AppAuth.xcframework.zip",
      checksum: "fecf38c2562d53d545186d9054c833b9b8eedf97678454e4aa9618c76b4cf0ca"
    ),
    .binaryTarget(
      name: "BoringSSL-GRPC",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/BoringSSL-GRPC.xcframework.zip",
      checksum: "4bfd4032cfcf73d229dd6fe89052d1c4b5895f85d95e81c232f63511f62b015d"
    ),
    .binaryTarget(
      name: "FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/FBLPromises.xcframework.zip",
      checksum: "812740f07698ed1d069a10dea3fd83d490b0847f34d58dea9b4941d26e045fb2"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/FirebaseABTesting.xcframework.zip",
      checksum: "c53579770f64aba5293547e6432a4816a6cd0bd174436163e02c330b93b85478"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/FirebaseAnalytics.xcframework.zip",
      checksum: "28ab511d38eb46560892d6f975d9cc7717bc4bb034e6d6203828152dc45242ae"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "df53f864e898b0fbecfc0366f820f3b2158bb0c222f0117b6865ea0314eb86a2"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "58bd2aa83e58e7a1fd39c8677fb4ff521bdb8758ef70eaba9949f35ce1ccad1b"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/FirebaseAppCheck.xcframework.zip",
      checksum: "accd125db79d0a38dab5ef0a11dcd980f5e409b102cc361f6ef0a584d318003e"
    ),
    .binaryTarget(
      name: "FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/FirebaseAppCheckInterop.xcframework.zip",
      checksum: "5473801288c47eaa58e581ff230fc2cecb24edc83e3c6680ae4565276ddc4b43"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/FirebaseAppDistribution.xcframework.zip",
      checksum: "d03c7099ad9416532e719900bd77afda9351edc7c35bf4dab21c181c4698fb7a"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/FirebaseAuth.xcframework.zip",
      checksum: "1a27eccab02012a9a64b3d41d7e70215e1b3166827c7afe27b12b372a5be1217"
    ),
    .binaryTarget(
      name: "FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/FirebaseAuthInterop.xcframework.zip",
      checksum: "c2e39227d5ff95233b11f9c5d0616b810ee642d2162880ad45264a6a5a298639"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/FirebaseCore.xcframework.zip",
      checksum: "7bf4723313704e46bb19967ff2468d0b1a0e51b9e88f60db7a822bfa686445e7"
    ),
    .binaryTarget(
      name: "FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/FirebaseCoreExtension.xcframework.zip",
      checksum: "2086b7bd3b73f3b97f531a6944e8e3e8971b39827a99a9a7f91a176d0c59dcb4"
    ),
    .binaryTarget(
      name: "FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/FirebaseCoreInternal.xcframework.zip",
      checksum: "64f9a5e3dc24a23142914d12c7a1eac32482cc0bd4db9ad61ef8c86d8cbd94bf"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/FirebaseCrashlytics.xcframework.zip",
      checksum: "ffe9dfda38bf36944636c96a639331124df72847b794b4ad0468283cce7534c8"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/FirebaseDatabase.xcframework.zip",
      checksum: "71eb2936252f2ff174177a12c7a475599e5d78f3505edcf7d75f0f3419a904f3"
    ),
    .binaryTarget(
      name: "FirebaseDatabaseSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/FirebaseDatabaseSwift.xcframework.zip",
      checksum: "9b472d50bb6ba07550a10e8af77f50382e14c0e66cfe3cda5fd9445aba9c875e"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/FirebaseDynamicLinks.xcframework.zip",
      checksum: "6c693934d179a154bf3e8a09480800fb37dd3d5fa821f5ffefbfbd0eb9ed2e0f"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/FirebaseFirestore.xcframework.zip",
      checksum: "9e43a43440dec09440d80e66d5ae0dd52b21bb1613aaa9743c9a47f48aa9d61b"
    ),
    .binaryTarget(
      name: "FirebaseFirestoreSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/FirebaseFirestoreSwift.xcframework.zip",
      checksum: "29cd602c3a1b66409fa9436a3c7f13436a999b564b0aa7b2200d4fc15b928ed9"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/FirebaseFunctions.xcframework.zip",
      checksum: "d80d2f7c8c31f1d821fc35fdf8b6e879e265da72b03c68f52b0099451548c234"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/FirebaseInAppMessaging.xcframework.zip",
      checksum: "31f16b3f1ea3cf95e8e3827ad8351f7cb61a45724631993ab481e6e43bc0a31b"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessagingSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "d7b404dc615d641d7ea23f9473408c17066cc05d86420d6032802e5374a3ed15"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/FirebaseInstallations.xcframework.zip",
      checksum: "e164a0dda417e0611ff1fceba797fc0342af914ae0ce03efc468eb3a6221c297"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "fb21827bf1f4cfdacc2ce32c8c23f940285f879363a3f12817c01d958cb5b62c"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/FirebaseMessaging.xcframework.zip",
      checksum: "662339630bda36061a06399c42a7fef5fb3e0088630b67f1d783e6672fb278c2"
    ),
    .binaryTarget(
      name: "FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/FirebaseMessagingInterop.xcframework.zip",
      checksum: "0288e145fdd29b0a2f5734c91ec1860f4c01c900380816168dd921f8c3bb92d6"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/FirebasePerformance.xcframework.zip",
      checksum: "2336d0699fce016da79037350ec7fe9cd5950f752bd76e901956acc15213c088"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/FirebaseRemoteConfig.xcframework.zip",
      checksum: "7d21bfdaf4611eea751eb9b3697d152fe20d7d42287fd3c69bf1806d50ba2b97"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfigSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "aa7bc1329b8e4395e52c3bf9864ef516d53409ab865030dee900ae017cf2bdcf"
    ),
    .binaryTarget(
      name: "FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/FirebaseSharedSwift.xcframework.zip",
      checksum: "c5e2b16b26c36836f8880cea919fe5770a1ca95af750057409b0d13c45a6d0fb"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/FirebaseStorage.xcframework.zip",
      checksum: "67bba9c86130b95fbab8d679072f148fe50725a7a1dc55e4057a22328dd4b3bf"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/GTMAppAuth.xcframework.zip",
      checksum: "9c5645ac35313c3c99f6b2da509f0723588407df097a4d20c6eb12889de0bdc5"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/GTMSessionFetcher.xcframework.zip",
      checksum: "b0f120254db4b6aad71c9e74f5b006a81951ea9e369a13bab4c5b78ae2190390"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/GoogleAppMeasurement.xcframework.zip",
      checksum: "41d5f069d79fa70d8c10ab7fa5b030d7ec05d3f5015744962ece2cff6bee9624"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "c5e604d831544ab1f4d6758df072a41c0d524a69c07a4b74e1837233e2ee02a7"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "cbb0cb5df0ced7a5e7772595dd0e6e33e06ed9a342f8bb01549980d7d2d20726"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/GoogleDataTransport.xcframework.zip",
      checksum: "973ff7ffa744c65aeef9a34ac7baba597d681263e7898ca68fc56f72d1d44ee4"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/GoogleMobileAds.xcframework.zip",
      checksum: "7ce14743073bd233706e67d63ebe3c90c5024346d8c7b8bdc0a1cc3a11911b6e"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/GoogleSignIn.xcframework.zip",
      checksum: "12e5ee7bf9512558eae12ea4133fc4df51f9c6b932ed5ca10bfa26223cd4977a"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/GoogleUtilities.xcframework.zip",
      checksum: "f156e046bc8fa8623066c3662470443341d037d7fa27b43e9a3373483249bf6e"
    ),
    .binaryTarget(
      name: "Libuv-gRPC",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/Libuv-gRPC.xcframework.zip",
      checksum: "8ec5b2172fe2557aef022dd6308e66ec5aebcd1202e310edc890df2b01ba9c5a"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/SwiftProtobuf.xcframework.zip",
      checksum: "8a66793e572280588061f29a842fc7d664ab39f16303671822e4b54761f9c06e"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/UserMessagingPlatform.xcframework.zip",
      checksum: "a8e088e4a3a96f0f7222b911d26f2be699ccbf774f8d599d8e695778738b6493"
    ),
    .binaryTarget(
      name: "abseil",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/abseil.xcframework.zip",
      checksum: "fdf728f644a2887b7f44b93f07c31dae41ddb42ec0475bd57166f90c61357b55"
    ),
    .binaryTarget(
      name: "gRPC-C++",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/gRPC-C++.xcframework.zip",
      checksum: "4e2489cf3613538348a20b87f7b55733d66e614376b77e1eb79ba0bcf2db715e"
    ),
    .binaryTarget(
      name: "gRPC-Core",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/gRPC-Core.xcframework.zip",
      checksum: "9bcbc6b4bec04d1539217e3e9bb260e8591e9729f7d9e35cad34f5cd1a7b58ab"
    ),
    .binaryTarget(
      name: "leveldb-library",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/leveldb-library.xcframework.zip",
      checksum: "0f61c9ec292f1f8ec680c2a85f67c7a8817393de11240e36b4f8ee78d299604b"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/nanopb.xcframework.zip",
      checksum: "be9c3d6361e5aa462a4638f7fe3ad3084018dd85d4963bf6d4f38f5f3e0234ed"
    )
  ]
)
    
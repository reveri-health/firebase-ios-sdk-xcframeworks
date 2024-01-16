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
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/AppAuth.xcframework.zip",
      checksum: "b773407c86918260173cc067aff89962238a6043e06343f3064109e00241ef76"
    ),
    .binaryTarget(
      name: "AppCheckCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/AppCheckCore.xcframework.zip",
      checksum: "babc5ead5d4c7a714fe748078601c0b14a7dfc72c56e9880a64b105862ebc01c"
    ),
    .binaryTarget(
      name: "BoringSSL-GRPC",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/BoringSSL-GRPC.xcframework.zip",
      checksum: "aeee8d98e4776fe42ef61337bf20126b615ad493b1befd101ff3ba7220d6acf9"
    ),
    .binaryTarget(
      name: "FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/FBLPromises.xcframework.zip",
      checksum: "83f8a0800d58522ab1b7b571e847d74a748b59ed3581cb1ca68a1dd463ef5a0a"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/FirebaseABTesting.xcframework.zip",
      checksum: "d8712c11ae21fc37b6518e4f0a341ea3212daa637cab700c8180771313b65914"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/FirebaseAnalytics.xcframework.zip",
      checksum: "d8ceec98a39fa726441e8e0411f315c9963238b1c0849078d9481c2597944533"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "a7cc50f5537c65247a57cc239583dee6f6435dd463db3b570174307b854a17e4"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/FirebaseAppCheck.xcframework.zip",
      checksum: "6ae89becc6da3154b59470d17ee13a97b749143ac9c945f4f130804414231784"
    ),
    .binaryTarget(
      name: "FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/FirebaseAppCheckInterop.xcframework.zip",
      checksum: "f5c3ba658a34614a14e8ef7e3b06d1d7a7ebe6e4e90f0e41a9df3b429f31f22a"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/FirebaseAppDistribution.xcframework.zip",
      checksum: "64184bf1d381dda9fb301b8b3c2a03bbcbc0f6027c1b1ae70b4b10220674716e"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/FirebaseAuth.xcframework.zip",
      checksum: "3e6770752e3c2813a05fd2937b5a478af42ab856ea4ba739a902336d2bcd74b0"
    ),
    .binaryTarget(
      name: "FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/FirebaseAuthInterop.xcframework.zip",
      checksum: "c0f7fa844ecedf3619d496a347908d25e52716f2489a1e81d09a7ddbcee343fb"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/FirebaseCore.xcframework.zip",
      checksum: "47cbf148591624b9e6d3aadccf0f5bc0f6d84a3ed7b7817cc864af78f6c1feb8"
    ),
    .binaryTarget(
      name: "FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/FirebaseCoreExtension.xcframework.zip",
      checksum: "e86e4bafffb67248e2da87a17a84b2e032a96e1dd5033cec9c593436af6ca2a7"
    ),
    .binaryTarget(
      name: "FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/FirebaseCoreInternal.xcframework.zip",
      checksum: "211ec9c4a769613288687a102cc29bde67dc587b2924146d51614162f456aa1d"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/FirebaseCrashlytics.xcframework.zip",
      checksum: "4d7441cf4346ea53212a80e293d12ca4fc9ca697bd59153cba800a9c70969c15"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/FirebaseDatabase.xcframework.zip",
      checksum: "94a34a9c895f1ee0d7a477bd726682243c365a0c540c662572bf449070f36938"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/FirebaseDynamicLinks.xcframework.zip",
      checksum: "81c44b5d128734eb858be4fad36f42795e53963291f7ab2944f5c8b439ce4e45"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/FirebaseFirestore.xcframework.zip",
      checksum: "91bf31e9874ca7eae9bbabb44d88921af07e5e7bff48a94ffd100fd9f2e6fc8c"
    ),
    .binaryTarget(
      name: "FirebaseFirestoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/FirebaseFirestoreInternal.xcframework.zip",
      checksum: "f614bbef9e84e4daf939ab664ef838719b2285f7750fd220333e9c3e45df2bc8"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/FirebaseFunctions.xcframework.zip",
      checksum: "3a6c56105cd9d5e30e212f8cf3b381f96735b358f06ae4780c5d07eafed941dd"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/FirebaseInAppMessaging.xcframework.zip",
      checksum: "8243a688c4945b080b0741c49e24908b590cfa3291f600a2a1596deaaa587667"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/FirebaseInstallations.xcframework.zip",
      checksum: "653c936c5b9eabd798203f5e54faf41e54c39cad9c5e63a2fe2585e5e801d2fb"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "812eb2576e84581c659d6213016089aabbd5fa875255b38561e28a4e875169ab"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/FirebaseMessaging.xcframework.zip",
      checksum: "43734cabd467d4e6d2a8ba00fec1b375c55c3d6efc1fca84b173996bc3b17d1f"
    ),
    .binaryTarget(
      name: "FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/FirebaseMessagingInterop.xcframework.zip",
      checksum: "6ca2ecf5dc8fa75b377452dd3782b88a1dbff2bc0ac9acc21d30ba7a9a5a1cbb"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/FirebasePerformance.xcframework.zip",
      checksum: "aa8b3febb83ccb51a7341f46d284b9e7a476e878f0badd6ef7c65448dffd5dbe"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/FirebaseRemoteConfig.xcframework.zip",
      checksum: "ebd81e645e668536f0e8dafe85e70234c2a22279eb8e318064afec18be1b10e7"
    ),
    .binaryTarget(
      name: "FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/FirebaseSessions.xcframework.zip",
      checksum: "7c0547ebad9d0583725b3934e654b682f265f8f8c41843c682fedb690126422c"
    ),
    .binaryTarget(
      name: "FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/FirebaseSharedSwift.xcframework.zip",
      checksum: "5464e137098bcc62c78cf7602abfad18c01b551c74e3764183330caa3e10ef0b"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/FirebaseStorage.xcframework.zip",
      checksum: "e14e3ceddfe61b73edb5cd10c340b0322db6bcf44996b22b6a027bb111356a33"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/GTMAppAuth.xcframework.zip",
      checksum: "7596856fd7258397193166215bc14a25caba69d9c4f408042323188900e56211"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/GTMSessionFetcher.xcframework.zip",
      checksum: "7dd35d889755a5d5cb748fb4a26b1a5675db08010711ad9569d4cf2a7b78d55b"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/GoogleAppMeasurement.xcframework.zip",
      checksum: "7235a6948d1f4a0dad722fdf596ec57b0e6e46c5d5dd527bc95748214ad10aa1"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "067167e1eaf539e78ce892302a543aeb46288fb115e40869b4c5ec473099593e"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "b456ff3a91ed924e516f2fc75e2b13782f0518591c8bf371b66a72dae01c2ca2"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/GoogleDataTransport.xcframework.zip",
      checksum: "c3a3ef4615d83c2e46cb4326d41f9f84a1ff05b57eed9557c992267a766cf526"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/GoogleMobileAds.xcframework.zip",
      checksum: "6ad8aa3d150134b1347c81f861c0cb6e71f26a444f03f827d814f561e8b7e457"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/GoogleSignIn.xcframework.zip",
      checksum: "0071f689b15e5a3c1f7c6c71950d60bd1c28a9200407e5d92abc9c14eb642254"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/GoogleUtilities.xcframework.zip",
      checksum: "e997d58acc02fb36ae062bc21bdf02686846a3f02a38bccc9c26a765c4df2aa9"
    ),
    .binaryTarget(
      name: "PromisesSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/PromisesSwift.xcframework.zip",
      checksum: "067ff0a813225cedd3294c3ae9a8ef15282e6cabdd666891f4ae560b613b4499"
    ),
    .binaryTarget(
      name: "RecaptchaInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/RecaptchaInterop.xcframework.zip",
      checksum: "63a6c68ff566141e84872c5c953c4e14efc073401afdd641cb23e6cc31593655"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/SwiftProtobuf.xcframework.zip",
      checksum: "c045448e118451cbc351d1a17e727825f2e9f9770346dfc424ff3a6a30cbff29"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/UserMessagingPlatform.xcframework.zip",
      checksum: "6e6a15cec401f5896725526aaaa06647790a0aeffd946ba7c256a0c0179a3fb3"
    ),
    .binaryTarget(
      name: "abseil",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/abseil.xcframework.zip",
      checksum: "9f2175717addac4d72e1e54ea78f4cc0dcdd9b88f40d09458f51e1febfd32029"
    ),
    .binaryTarget(
      name: "gRPC-C++",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/gRPC-C++.xcframework.zip",
      checksum: "d53c16124c662a3dd2aac924cf326526fb31e3d0c7f8873c48c3e28fcff41006"
    ),
    .binaryTarget(
      name: "gRPC-Core",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/gRPC-Core.xcframework.zip",
      checksum: "b62ee50d2293f36219071caa6fd2d235e9dc9c36f99042644d58878eeabfc62b"
    ),
    .binaryTarget(
      name: "leveldb-library",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/leveldb-library.xcframework.zip",
      checksum: "cadcd5a70427e1f7aa61a2ec35d7004e3db3cd800b81b0f9223cbf8c1f4dbfba"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/nanopb.xcframework.zip",
      checksum: "1c4b635c03fabdd68b69d6b8ca4dad96dff459465a02f3bd0ede4be36f5ff454"
    )
  ]
)
    
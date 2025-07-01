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
      name: "FirebaseAI",
      targets: ["FirebaseAITarget"]
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
      name: "FirebaseVertexAI",
      targets: ["FirebaseVertexAITarget"]
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
        "_FirebaseABTesting"
      ],
      path: "Sources/FirebaseABTesting"
    ),
    .target(
      name: "FirebaseAITarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAI",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension"
      ],
      path: "Sources/FirebaseAI"
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
      name: "FirebaseAnalyticsOnDeviceConversionTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_FirebaseAnalyticsOnDeviceConversion", condition: .when(platforms: [.iOS])),
        .target(name: "_GoogleAppMeasurementOnDeviceConversion", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAnalyticsOnDeviceConversion"
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
      name: "FirebaseDynamicLinksTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_FirebaseDynamicLinks", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseDynamicLinks"
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
        "_FirebaseMLModelDownloader",
        "_GoogleDataTransport",
        "_SwiftProtobuf"
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
      name: "FirebaseVertexAITarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAI",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        "_FirebaseVertexAI"
      ],
      path: "Sources/FirebaseVertexAI"
    ),
    .target(
      name: "Google-Mobile-Ads-SDKTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_GoogleMobileAds", condition: .when(platforms: [.iOS])),
        .target(name: "_UserMessagingPlatform", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/Google-Mobile-Ads-SDK"
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
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_absl.xcframework.zip",
      checksum: "a58fcff2a1d7177012f83b25d2e10366c17d6cfc1d16932ac7e4530940d05033"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_AppAuth.xcframework.zip",
      checksum: "d46fd1a5f62eba01fc797c8bedc222b0b4ac5be3f9e6d25e874cb6a016a21aa8"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_AppCheckCore.xcframework.zip",
      checksum: "aef45a3584e5d7077d077a7e5a3d35e471024a504a292c2a98008bb7c902cf05"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FBLPromises.xcframework.zip",
      checksum: "5b7f2bc6130c5b9d4200ddd94bfa92401b1bf40e20b69d67d5e001e4580d409c"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseABTesting.xcframework.zip",
      checksum: "77fde16ab53defff4054a6fb3400439fad333470ce0de5380470a7ee7ff55280"
    ),
    .binaryTarget(
      name: "_FirebaseAI",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseAI.xcframework.zip",
      checksum: "30d45cb8ff45176a2b9ed2ff081b0cc0881264ee219985146f50c07c525b2f53"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "0af9deb173d9688da9e58a90191ec1a2e424d597b4ab5e93ad2ec6553a277423"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "71760333f1fca9e53350f567b3470a147dc1f819972f3bca61dadb6d721c2561"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "179f8fcbaf7ede15d3bb8694412e4ac053a1d3609e3bf4ed5c76ea0920a42a45"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "bcc12f15cd2469380d6a40cf55adf0570307dd1b93d58e4e7607e12fc5cd23aa"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "bbe16304288251f2369c8353bc22dd6af4e1c46f0256da44a98db7ce492f255c"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseAuth.xcframework.zip",
      checksum: "f05c4dd20608100759b731c1cc9c2afc6129a7be3a5ce767bd893ddbf2ab938f"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "7bac7e3b5996273f659bc40c75480c3a090b9e1dfffc687dead9773f6a1d2d30"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseCore.xcframework.zip",
      checksum: "78db19b4cf87d9b2b7244abe3d5639dc85bc36e1abaeb99d97aef5ea285acda0"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "7247e9fd1e497e01a4408f127aba1d3bcf7b506c5eb5c5351d9ac1b8fb26b1f3"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "d7d1a2624246bc1439550b91f41d1a7aef7c2feece911f959d52c0cf6328a535"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "05fd9a55dc2df88ed8744640be080f6b62aac9999b7c6cba1e70aad70060e59c"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseDatabase.xcframework.zip",
      checksum: "9388143c2f30d4f4fdac9bad979fae60104ea05c1e942655f01f26348d96b475"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "ba74922ade80bbc777b5d66192bc8e9673b37fcea111c511ba1ce1f9e3ea0d27"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseFirestore.xcframework.zip",
      checksum: "2adc78611bf8f55de74724ddd386d593ce3a3920f68a8dc10df5f36f62362181"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "24f7bfc98def2b00bbc73fadbae9b561fefe232b4425dd9529eb3a286e5cebed"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseFunctions.xcframework.zip",
      checksum: "aaac51075c72e827fbbe3bfa8695d5c48e5f04eb2a9858c8978ed1373cf49e61"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "2907f77efa62b98d7703f752d3d4e8aa8ea59c97b6f2ea37e4e158ec500be0ad"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseInstallations.xcframework.zip",
      checksum: "48d900a5b62fdfa5d3549c0ddb36d4e63f1277b6c59a8a921d0a6cda5143e6b4"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseMessaging.xcframework.zip",
      checksum: "5c08162970930d0e1c027c5e3a85852328afe80147a0edd17a4b069f75362987"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "f888da305fce5939488cc6ada06050d5f18f9085fea38aa65ec8016f6a3c15e2"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "e7443d85ae66400835be6d5773cbd8f1e8542d24bc042d1c693bbf636dc198f4"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebasePerformance.xcframework.zip",
      checksum: "89f550f4b63b6886e81186542c39fb3a898ee6f3e613ca4d19fc2749566ab90d"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "473aade069cc1ff1ddaf43a0c5673ee4500181c1b81737e9b373abe9908e8a43"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "b4d62554445cf1c1e503796818e16cb6fe28de8a14d2cf67289e47a872662878"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseSessions.xcframework.zip",
      checksum: "0840e2a025309a07abb909f5fae942efee65f25d0d3f2610304910d0c3ac0a52"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "c08f011e342babc547417f50ec4042db5cebc059ed83ae80e0ae8722d068334c"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseStorage.xcframework.zip",
      checksum: "2a12ee9bf7c5fa16f9d574734a4e29385c01226dddaaca3b999a8e1090b9bd1b"
    ),
    .binaryTarget(
      name: "_FirebaseVertexAI",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseVertexAI.xcframework.zip",
      checksum: "00350c67910814bebd1d0eb4d359c4afc93de280c6fc7b0750195fefa1019e83"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "2f9e77a251108bc2ed3b4ec765f67221253ca81ec2d9286e863505895cbda1a0"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "103c7d0283f4dc116516b65626d88f6d2004c56305cb38a036b5c464660a1d35"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "a552a5251a8d4497e84f4e1b5f2ac4c763b0d6d1f1551441ee70422d6626f0e0"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "aab836f3bc4f89cc6ed68674b2877aac0336fd183898c77e9044c956fa05b93f"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_GoogleDataTransport.xcframework.zip",
      checksum: "f8d9b40328edad9d9e87ceea910d09820bc194313dc012d126585eca82435574"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_GoogleMobileAds.xcframework.zip",
      checksum: "3edc55542b1893990c5ed4235ebc66b0f223f8a18bf22a6defe5d6bc93cafd4c"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_GoogleSignIn.xcframework.zip",
      checksum: "b13130e0d258784b4d2c001054e7d8bf52509ac3568f93b8722ac29faa5e88cd"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_GoogleUtilities.xcframework.zip",
      checksum: "d2a840dead35c1d335772e8ba54e85c093479a879abab66c9b74ddc729531fa0"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_grpc.xcframework.zip",
      checksum: "3aa210c4c4f4204aa0437e0281c0cb3fb1f0e7e1c582c3473aa7422ab1c64b07"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_grpcpp.xcframework.zip",
      checksum: "8e54e439166187bb65f3681ac2858c1889be170139a46b9155d0d685d798ea41"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_GTMAppAuth.xcframework.zip",
      checksum: "1e02503e4f25ceb0f079dfbcc7d7480fc9b1b53eb232585415c3fa02484b9800"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "0f469a54b2e828e377b9456f91bbb73c603d5b118e00923f921fb8e3d7451195"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_leveldb.xcframework.zip",
      checksum: "0f7341c40fa800895695dea2cbcd827536d610bb7cc86e97dab1ab634f764b99"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_nanopb.xcframework.zip",
      checksum: "4ff32394bf2af162d38f74b8c5324b46c3f7c0632ae0f7d9a35dec055519c28f"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_openssl_grpc.xcframework.zip",
      checksum: "6fa284488d13ec4118b80adb481193eb6b904bd5325ad1233e4492b7a4482017"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_Promises.xcframework.zip",
      checksum: "9755701ee2fcaa64e49db3fad90ab9255da688568727a7b787f2a616e335f22d"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_RecaptchaInterop.xcframework.zip",
      checksum: "3dc3d0b54d2c75d1cf761fe2e178f6c2ab92872faa14271611a988c7ab28f18e"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_SwiftProtobuf.xcframework.zip",
      checksum: "7a0f2f1bb75d942b579aedfc1bb0272e5dfa0743b2745925139d0eb2601a87b8"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "a9d739267e532435eefda881cdaeb7dea5ab00d680728b25c647bce43c0323a5"
    )
  ]
)
    
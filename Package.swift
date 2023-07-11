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
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/AppAuth.xcframework.zip",
      checksum: "bd84a285262a6b55b747e102fa1f84fe63a19e6adf9bb3e82fd43006487453e2"
    ),
    .binaryTarget(
      name: "BoringSSL-GRPC",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/BoringSSL-GRPC.xcframework.zip",
      checksum: "d1046381daf6cb9f41b8bb8a701eac844dbb17843615ba3fe64e43b081ae4fbc"
    ),
    .binaryTarget(
      name: "FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/FBLPromises.xcframework.zip",
      checksum: "588fc3dc9f3e72168033a3b70f08b49d386764964cfeabd3524e8e350f01cfb1"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/FirebaseABTesting.xcframework.zip",
      checksum: "b515c143731aeb77a2cca52100d146f0b12e210ba83f05efd38cc5410d7d3be0"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/FirebaseAnalytics.xcframework.zip",
      checksum: "a12abab5a2d3e6116cfe731e7ecd5740edaec1180242551b62eff4977bbcfc8b"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "a8b92ca7598e0a9eeb1d9700fa9f1a734a8ed1e00caf7674992ad5514fae621f"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "c268a477e8cfcfd1a09fdd175cb0f4760f3423161e0ecd4fd8efc04e6e56a4ef"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/FirebaseAppCheck.xcframework.zip",
      checksum: "2cf9bd50556a8b5b06ad3eb5ac0e8192a521adce34d73c5a40313eddc287e431"
    ),
    .binaryTarget(
      name: "FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/FirebaseAppCheckInterop.xcframework.zip",
      checksum: "a8a3b4dd4bbd6c25e100ccd693e06582009e07aa27e893ed7c3362f36cc73e43"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/FirebaseAppDistribution.xcframework.zip",
      checksum: "4f110114954ce243ec3b3a8e065bbf6bf36f647c57b50e99ddafabed77169d51"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/FirebaseAuth.xcframework.zip",
      checksum: "d98d0ebd03ed33e9183bef4fafdb2dd68f9c2f74b719f562657a3d0037a03169"
    ),
    .binaryTarget(
      name: "FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/FirebaseAuthInterop.xcframework.zip",
      checksum: "b48076d813d84cc53a818c5c9f898a7c019e025ccda16a4bbc4d82264467e05d"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/FirebaseCore.xcframework.zip",
      checksum: "fbeef56491de21ccc4280a14ca64b9e0c2628a642e9382fda9651b820b17acb5"
    ),
    .binaryTarget(
      name: "FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/FirebaseCoreExtension.xcframework.zip",
      checksum: "70d68058ab6d1efa900873f538223d622913c85a241de56238de8c7d9281daff"
    ),
    .binaryTarget(
      name: "FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/FirebaseCoreInternal.xcframework.zip",
      checksum: "63d37fc54728a646e7d09bbbddb856a77237a664cbbd01318def9d256b62fecb"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/FirebaseCrashlytics.xcframework.zip",
      checksum: "65fea0a41da70ec057dc83c715d24105e3f2781842afa792267696b74ddf6fe6"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/FirebaseDatabase.xcframework.zip",
      checksum: "aba836838a01d64319941361879d1f417b7a219c6731da12d2f92ad7169e0219"
    ),
    .binaryTarget(
      name: "FirebaseDatabaseSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/FirebaseDatabaseSwift.xcframework.zip",
      checksum: "1ca6542a0b9fca64a7c3203917c7285f9c68eb6717c59b65754aa7732ffebde4"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/FirebaseDynamicLinks.xcframework.zip",
      checksum: "e53561b6320ebcb868540ad39ce11881f7093367faddbe31c076546623810e93"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/FirebaseFirestore.xcframework.zip",
      checksum: "3a65133432fa2de8da07956ea18244eab96505147ea92533d9cc06796f61c5b0"
    ),
    .binaryTarget(
      name: "FirebaseFirestoreSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/FirebaseFirestoreSwift.xcframework.zip",
      checksum: "35c86d976f7931a73bf4668f3cf2fb8c5ebf9fb56eabce40dccf2ee1ef5a4ab2"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/FirebaseFunctions.xcframework.zip",
      checksum: "5d3128f8f041396951b4988a9fe4f7c9937e5bc365b1d0d7783cbd4d138a1aba"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/FirebaseInAppMessaging.xcframework.zip",
      checksum: "03888a80b7310a595c11fba2bd03fb8f4b65f4d78f970efb2a18bc9ba288608b"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessagingSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "ef9a29dce3b0ee7fea4782dcee960a13fc11e96c9ea3caa95328ff50be825a54"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/FirebaseInstallations.xcframework.zip",
      checksum: "685728625c428f5f4db8adb5053845060236c761dbdeeb4d90d8200cb0955969"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "de700dd9585bf68e2fc9febae4df3c103167461d9f822d3bdd740c427fe7d030"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/FirebaseMessaging.xcframework.zip",
      checksum: "df0d133155a8e43deb7ae136e9bd10747bf9c783cedc0efaa57193fe5fe30707"
    ),
    .binaryTarget(
      name: "FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/FirebaseMessagingInterop.xcframework.zip",
      checksum: "13195218c4cc596797971bf2b00a55d70bcb67ad4f43816661012e49b9f8936d"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/FirebasePerformance.xcframework.zip",
      checksum: "5699019ac04e105e4af765828f39d0688e5258678c729acbfbd0ae0c6f8cf51b"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/FirebaseRemoteConfig.xcframework.zip",
      checksum: "42503bc231e08a41cbb002d5c76e86daf4813e2919e15188df800978c82cf92f"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfigSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "edb4cfafd2eee8c57c25704dcfadf0507166b41f83cd08f3a7e948e622f8bcca"
    ),
    .binaryTarget(
      name: "FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/FirebaseSessions.xcframework.zip",
      checksum: "80b1fa468ef3d8443e96f3b360dd38e3cfbe4d1f84bff2559145bfb0fa1647dd"
    ),
    .binaryTarget(
      name: "FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/FirebaseSharedSwift.xcframework.zip",
      checksum: "ca81a0acafc79ace5b4a780126fe2e552759266b39d7d2e21b0ba9a4e0b7670f"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/FirebaseStorage.xcframework.zip",
      checksum: "6b24a829fd2bee8d6483cffb2fe95e1da567002ea64813c9b62137fda66080e0"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/GTMAppAuth.xcframework.zip",
      checksum: "5ad5a845c4013ddad17f5a7a7bcd2c70e2b37c209de2aac89c3229f9febc7df6"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/GTMSessionFetcher.xcframework.zip",
      checksum: "206b7f9fa54f24eb8201ea85538ab533d910a4a3c071ffc22f68c495a967d0da"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/GoogleAppMeasurement.xcframework.zip",
      checksum: "9794d1827c15557bb667fa2a3d5098b0452c98fa24a2dd882f9403462658ee85"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "e83bed3184b35876cccf06b89797b75b548e7be8a284ca8de916f2ae2075fc8e"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "c5e09228d46a23a6dc86ad5e991ffa43f056869098c7e13b49ec773e287e1721"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/GoogleDataTransport.xcframework.zip",
      checksum: "0bbe73f43d49f2a2e1ae9fdd4c85ca820b8c988a4cae4597753348eb802a628e"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/GoogleMobileAds.xcframework.zip",
      checksum: "569543cbb1a333707d32e1ad21b2c2d7eb5f4f1a659ca8b6035262327ea7b077"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/GoogleSignIn.xcframework.zip",
      checksum: "3acfed794d3b0d100133fa5917f21a300d4760ca9da48578b99cb49b9e31a2b3"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/GoogleUtilities.xcframework.zip",
      checksum: "c28f234639b10664a47707caf02fd10f6de51075b6f115c981f355d96778672f"
    ),
    .binaryTarget(
      name: "PromisesSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/PromisesSwift.xcframework.zip",
      checksum: "09944657e40e31dd6a11b00f701257de1cbe027fa9a2cb4c18b7dfae04170039"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/SwiftProtobuf.xcframework.zip",
      checksum: "fe8c5f56298ea58789c66e9ac1b9f816a8f367b2fb2cc05e12cd1810d937e1fd"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/UserMessagingPlatform.xcframework.zip",
      checksum: "f6a91f62d70e78f8bc0d2bc53ae0c65ecc55f8f58394d9cf8a58694c7133ed3f"
    ),
    .binaryTarget(
      name: "abseil",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/abseil.xcframework.zip",
      checksum: "1342deacc71216f43d58433257753834d3821495818658526cdeaff319bbea1a"
    ),
    .binaryTarget(
      name: "gRPC-C++",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/gRPC-C++.xcframework.zip",
      checksum: "42b863b00ea515920dadfa4c6d46d50c3f518774179a269e71cb153d9393b53c"
    ),
    .binaryTarget(
      name: "gRPC-Core",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/gRPC-Core.xcframework.zip",
      checksum: "d5193b44da3290ad4bede3946aa106343390e4ffa76c4e15f6a383fcd6214073"
    ),
    .binaryTarget(
      name: "leveldb-library",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/leveldb-library.xcframework.zip",
      checksum: "4ddccdac5f28a47917b534cc9eb0aa09930e34f09f80cdeb1c8030ae853b05bd"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/nanopb.xcframework.zip",
      checksum: "a8734cf53e3b63f2015b00706903cabf1188d50efe5e606170ced638cf9c328c"
    )
  ]
)
    
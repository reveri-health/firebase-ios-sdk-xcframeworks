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
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/AppAuth.xcframework.zip",
      checksum: "79d348d0601c6d94ec669ec0d8c811ea925138d00e2dc719c725f8320cdeed05"
    ),
    .binaryTarget(
      name: "BoringSSL-GRPC",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/BoringSSL-GRPC.xcframework.zip",
      checksum: "a4c993a092f5ead8ceed52c85c9ac831397222da81ee34dff8a14d590cd5301b"
    ),
    .binaryTarget(
      name: "FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/FBLPromises.xcframework.zip",
      checksum: "348aa1a54477ae5526fd5cfd5ffab599c2978cfb01305e75fb8ef171008d6746"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/FirebaseABTesting.xcframework.zip",
      checksum: "9fe51a93f2a51c5187b7ff868db9cc6ccfd65304128301615079195933b59e61"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/FirebaseAnalytics.xcframework.zip",
      checksum: "cd2155b02c5020da80184ec84cad2cfb19ad4e1525460afe1e008953a2f0064a"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "7b2f6ba712c8960927864e7b09b37d745ae9a44c750b64336468ecc5d5ee3b7c"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "0e3816cf3cb5f460d36a8838b85f59e52e05babf1b9fc4286cb391bb95e8457e"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/FirebaseAppCheck.xcframework.zip",
      checksum: "c470012cbdcac11528e19c2570a17512993bb52f7b185b2a0bd62a90bc9a8362"
    ),
    .binaryTarget(
      name: "FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/FirebaseAppCheckInterop.xcframework.zip",
      checksum: "f7c86317386e1829456eab289a05224297c2517f481eda966ef81446896c7241"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/FirebaseAppDistribution.xcframework.zip",
      checksum: "eaaeff901c2c18207aa394afe5ed69fb1c16110b866a7e8676d8d14362ee2c54"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/FirebaseAuth.xcframework.zip",
      checksum: "9c0c6ac127aa8d94930f2ecfd1007bba2c036be9950bb104e0022bfae5746d9c"
    ),
    .binaryTarget(
      name: "FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/FirebaseAuthInterop.xcframework.zip",
      checksum: "d9be9e475e581b94b000193d137439bbb589197431d70e2359a7d3e5ab9110d2"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/FirebaseCore.xcframework.zip",
      checksum: "57d0a0bd05e84e61f947996452ac8cb6b577836d61e710f35194b1b94a17e4e6"
    ),
    .binaryTarget(
      name: "FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/FirebaseCoreExtension.xcframework.zip",
      checksum: "e89c1402ecbe516c756860a1dcd574eea6e3988171fd7c8f590caf7fc200f419"
    ),
    .binaryTarget(
      name: "FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/FirebaseCoreInternal.xcframework.zip",
      checksum: "f6f455d3a752ca87ac03193b01e1e4e001ff01be786970e3780f5869b10dffd7"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/FirebaseCrashlytics.xcframework.zip",
      checksum: "72c4879e72130a8f0966df26ea44bbaf806933624c29c6af891bc7039be08751"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/FirebaseDatabase.xcframework.zip",
      checksum: "8d2ce7e07d24b748940c96c54e9fa5e11f1c21742be7425dcb768de776ca83de"
    ),
    .binaryTarget(
      name: "FirebaseDatabaseSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/FirebaseDatabaseSwift.xcframework.zip",
      checksum: "a79bd1deea8d17dceb84d8a2794c2a3f484743da8514010b12c5e31b4b1891b0"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/FirebaseDynamicLinks.xcframework.zip",
      checksum: "9da35d3edfe734632db1c2b7719e7721ba303ae5786f938a7dfb25aa5c31383f"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/FirebaseFirestore.xcframework.zip",
      checksum: "2ba7f19258acc0e85375719ddd5c8dbdca67215827d5f584e4cd7d3c3b81ddd3"
    ),
    .binaryTarget(
      name: "FirebaseFirestoreSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/FirebaseFirestoreSwift.xcframework.zip",
      checksum: "1d7ec7a0a45c0aaed7126bc3afeecfc479b64455f3db54f87d190e59c7ce4d9e"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/FirebaseFunctions.xcframework.zip",
      checksum: "9f74a892624063837c12ef074c186ba0e17dc03e35c739cf6ab63ed2f085f13f"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/FirebaseInAppMessaging.xcframework.zip",
      checksum: "019dddcafabbac320570ebce8e7f62172f3bf5a4d292f86f5e497171bde0152e"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessagingSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "e2bd366e4d98f9442819d0bc6da6e6c660bc2b84aea1904ce7caaa643609bc57"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/FirebaseInstallations.xcframework.zip",
      checksum: "ad04b89c2e95c790a235796fc8a68b97303f238905de7a05e7534c4938ebdf83"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "580bd24d873a3f5601456f01188aa3a0036966cd09fff61b01fe8417432bd1f9"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/FirebaseMessaging.xcframework.zip",
      checksum: "92274f8921ea3f6227747a0b7ac1445270ed680f8e5b221ff61a0d6de731c54f"
    ),
    .binaryTarget(
      name: "FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/FirebaseMessagingInterop.xcframework.zip",
      checksum: "2f2d9f2b04e906be1204d3e6057fb86d4b4809951f725b63a13bd45268ccebd6"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/FirebasePerformance.xcframework.zip",
      checksum: "1596c3dc4db97b6fc83b1ce2f4e77044dfafab5377664f6b6060bd784ff36852"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/FirebaseRemoteConfig.xcframework.zip",
      checksum: "5a5d0f389ead54e14e208d5938d402fb7359d2ae42f86698667a54d184483115"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfigSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "21846c42b4ae722ad7af5ca912320605c47f5670b1a42e0dfb5841233b9e4c7c"
    ),
    .binaryTarget(
      name: "FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/FirebaseSessions.xcframework.zip",
      checksum: "dd07f1aa95da5f4c5b417938a25440c8597de2f92617b18949eea3a329186513"
    ),
    .binaryTarget(
      name: "FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/FirebaseSharedSwift.xcframework.zip",
      checksum: "b694884dd7ad363b63e7c1de3bd1eaf2d80535832920e95255362dc849e89532"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/FirebaseStorage.xcframework.zip",
      checksum: "200f4819399c1e4ade3ee96fcb3ace08844aa87347921f1f38414736d3de4e70"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/GTMAppAuth.xcframework.zip",
      checksum: "fdb3f1facabb26c28e0bcc3ff017b347b441fc12bd6acd213ec7e103d68d1969"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/GTMSessionFetcher.xcframework.zip",
      checksum: "acd59b101043c7ada7d9de2ad6a1b3d83dcf1d28d30b87828648e5056c3e19ed"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/GoogleAppMeasurement.xcframework.zip",
      checksum: "ed0067d83828a529e62b444d9825accae04b46394a73588d8dd987d865d372c6"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "fe213f34fb016f568d9aaceed4d5deadbaa34afd48eab7039785e6a444eddd21"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "75488779e7b20c530b97cf38ca8491f33a71ed7b109d16c80e29bef2a69f609c"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/GoogleDataTransport.xcframework.zip",
      checksum: "9ddfd5a3a2dfe584aea57ec9d618ab06666d6f3ec32a5de697d2f2e67e5b86ad"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/GoogleMobileAds.xcframework.zip",
      checksum: "a9a11289389e3c79c8b95aac4ab83bd46a326377f03b761d9b8e89a684610974"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/GoogleSignIn.xcframework.zip",
      checksum: "206c52e4467691441acd8c43039339056c26ad97ffd7daa157779ee8d80299b4"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/GoogleUtilities.xcframework.zip",
      checksum: "7fb7e9ff3a6c47e3e5842455c36d5d730c0ae78ce6349e4ad7f1dcfc1743f570"
    ),
    .binaryTarget(
      name: "Libuv-gRPC",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/Libuv-gRPC.xcframework.zip",
      checksum: "2b4ca934d3d0c04ce4f91dc7ce668145059bce029b8677b15d13d3e7ad151e43"
    ),
    .binaryTarget(
      name: "PromisesSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/PromisesSwift.xcframework.zip",
      checksum: "6ecc38443df5d9ebe46efc90625df85d7a1923616c3f4e4baa3527b1d2ff1b8e"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/SwiftProtobuf.xcframework.zip",
      checksum: "da7fa8950015fd948c373e376fa2dbda1b96265be027aece25661df5985c12e0"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/UserMessagingPlatform.xcframework.zip",
      checksum: "86be06fc9a9cdd720655112401a166b51a53080409c9aee1404dc2ef057fe571"
    ),
    .binaryTarget(
      name: "abseil",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/abseil.xcframework.zip",
      checksum: "cce8058c9ac7451ed134574ca5b70e6e728e6cf49f25d2277b782a3ca9687ff6"
    ),
    .binaryTarget(
      name: "gRPC-C++",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/gRPC-C++.xcframework.zip",
      checksum: "6cef975460847021d8d21d41f5049536eaa42ce851fff194617a65b787ebe6f8"
    ),
    .binaryTarget(
      name: "gRPC-Core",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/gRPC-Core.xcframework.zip",
      checksum: "9acb8cf96b0c520228b705f3ed7b6882424d93c59f0ae1ee4bc4fa323c02c004"
    ),
    .binaryTarget(
      name: "leveldb-library",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/leveldb-library.xcframework.zip",
      checksum: "135db4ac0408d08d8bee33450c2eeeae3aa6f1bd62efc77d741e4589848ee751"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/nanopb.xcframework.zip",
      checksum: "790dad42047c3eab57aa21e54a1881cff94c3cc34810da4cfc203b7c11d6e2f5"
    )
  ]
)
    
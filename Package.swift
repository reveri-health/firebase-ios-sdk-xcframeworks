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
        "FirebaseRemoteConfigInterop",
        "FirebaseSessions",
        "GoogleDataTransport",
        "Promises"
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
        "leveldb"
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
        "FirebaseAppCheckInterop",
        "FirebaseCoreExtension",
        "FirebaseFirestore",
        "FirebaseFirestoreInternal",
        "FirebaseSharedSwift",
        "absl",
        "grpc",
        "grpcpp",
        "leveldb",
        "openssl_grpc"
      ],
      path: "Sources/FirebaseFirestore"
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
      path: "Sources/FirebaseInAppMessaging"
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
        "FirebaseRemoteConfigInterop",
        "FirebaseSessions",
        "FirebaseSharedSwift",
        "GoogleDataTransport",
        "Promises"
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
        "FirebaseRemoteConfigInterop",
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
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "AppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/AppAuth.xcframework.zip",
      checksum: "99faa54189c601a20be4858725138dc46436a91e73fa542ecce83575c1632207"
    ),
    .binaryTarget(
      name: "AppCheckCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/AppCheckCore.xcframework.zip",
      checksum: "1473d97d61f7a85750f4c5e102485bf930ab1205ca31588ed3bc4bf3b8ba1993"
    ),
    .binaryTarget(
      name: "FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/FBLPromises.xcframework.zip",
      checksum: "58bda732bd46bb6bc1d6304f147308ce1ec22acd44a09bf835d742ce364095a0"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/FirebaseABTesting.xcframework.zip",
      checksum: "18c6210482e4f0b1b5612cb4dc90a4022cc3c76accc55d82896c2ff30feb173f"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/FirebaseAnalytics.xcframework.zip",
      checksum: "4ba5f306917005fd0c7ed7cd0098000161c9b101e8b47e5c63d6fa16aae2383e"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "139229b3db9a79816cae9730f5159874a8a62880b97e5a3ea193006b227cfd43"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/FirebaseAppCheck.xcframework.zip",
      checksum: "b91ea1104d9350b4e827578422178dce1324ef71672af1d2b6aec718b1e723a3"
    ),
    .binaryTarget(
      name: "FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/FirebaseAppCheckInterop.xcframework.zip",
      checksum: "18b3c8a4b35e8f9a8bffb35fbcf5e1969d94c90a058b1dfafde11768f84fc6e2"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/FirebaseAppDistribution.xcframework.zip",
      checksum: "a32bf997c1dd3e778c3dc08aac568f9b56b4567e9778d1c010f2e38084cf09ba"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/FirebaseAuth.xcframework.zip",
      checksum: "5a47b34da94a2f5d4864ea9dec57ead28a1864aae1db577100395a3c083b39cc"
    ),
    .binaryTarget(
      name: "FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/FirebaseAuthInterop.xcframework.zip",
      checksum: "def1479850551bf073b7737b2ccec17d8bee59be7dacad6502e434daf0c572cd"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/FirebaseCore.xcframework.zip",
      checksum: "e6642253c3a95bcb94bf4f4826998d3753282461c4addd9fac0b3f9466654a82"
    ),
    .binaryTarget(
      name: "FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/FirebaseCoreExtension.xcframework.zip",
      checksum: "0d793dd40be538d3623f1463d522cd8c62cff9dc5c2635272012c86056b5a88a"
    ),
    .binaryTarget(
      name: "FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/FirebaseCoreInternal.xcframework.zip",
      checksum: "4d7bea5ad211ba71fcd8022b91a5ee8c051c7f3f988987c8891f1a4f55da9e80"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/FirebaseCrashlytics.xcframework.zip",
      checksum: "269bf6031be3861b21aca867cdc15ccf4ef85bf5bba58643613e487f87330d31"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/FirebaseDatabase.xcframework.zip",
      checksum: "d9deb69f0a1ef5940779fa877a88442a52b13096d67e07279bc8a1c55a055e34"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/FirebaseDynamicLinks.xcframework.zip",
      checksum: "a4b943568501df5faf9a53bc8f2ff7cf2c0144ff63abd8c31854ae04d1225262"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/FirebaseFirestore.xcframework.zip",
      checksum: "31200de175f4641c4d2daa74d44074546ddba0c13a5ad203490390eaf1750c9d"
    ),
    .binaryTarget(
      name: "FirebaseFirestoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/FirebaseFirestoreInternal.xcframework.zip",
      checksum: "803b084642e04ff25cbd326f02de50c266b412effa3be9e084a51445148f7680"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/FirebaseFunctions.xcframework.zip",
      checksum: "866232c0363839a49aafe2551005596de7d5103a10586bec7a181710e85891d8"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/FirebaseInAppMessaging.xcframework.zip",
      checksum: "ccbdbe68434d9ecbdd5f8af5e55d673f9c9286dbca115bdebaae60dd1e7bfff5"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/FirebaseInstallations.xcframework.zip",
      checksum: "a9fcd208aa94f24893c0242d62578c51275f1ab1050fcfb25079a50727c053db"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "3d5b5c04e71a4c40c0381182e202b81b450fbd111d31c546228c9b45f29777c4"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/FirebaseMessaging.xcframework.zip",
      checksum: "670bb14b9ae3538deae4bd7352777406dd6a1344fb08992786d8d92e6fec33f4"
    ),
    .binaryTarget(
      name: "FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/FirebaseMessagingInterop.xcframework.zip",
      checksum: "f74342315258903aaf5c6e80f50b556a29987f2deeda9ad94049aa8bbcebd03b"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/FirebasePerformance.xcframework.zip",
      checksum: "7435886aa83683901cacba2e479deb34111716d409301a39e7ee5b95dcc14897"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/FirebaseRemoteConfig.xcframework.zip",
      checksum: "1184f1df6671684465fefcb32f96a14d50f45e2853a9d9f71a1207e21744efe0"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfigInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "efa2a03d1bf75903f92f8196c6d548dfa10546073380200b9d102b9894e8cbe9"
    ),
    .binaryTarget(
      name: "FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/FirebaseSessions.xcframework.zip",
      checksum: "81a96f6b797c5d1a92bd600dba07fd5938a563406053fd07aebcccf2e0bf0f1a"
    ),
    .binaryTarget(
      name: "FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/FirebaseSharedSwift.xcframework.zip",
      checksum: "8c1b10f5165ead67ab32b667a7e842cc566b2b5db9f9d8293df8a03e0795d594"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/FirebaseStorage.xcframework.zip",
      checksum: "4efbecf5083f4bacf6dab39f97c7a584aa8e61e38d99a9002a8ee9c0c41e6555"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/GTMAppAuth.xcframework.zip",
      checksum: "b19a02a8fc4be4e14f966f0e2f04224dcecf6ef01602f18073bcb0de08b60f6a"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/GTMSessionFetcher.xcframework.zip",
      checksum: "f38f70e3c81d99919bcdb397a2833080cee3c3fbb2aef87cd391a9b7e3ccaa3e"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/GoogleAppMeasurement.xcframework.zip",
      checksum: "1c54a76beef0987730f5d11aab147851374e268966269b72d6f11c308f46246d"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "3e3733c2f5c31e8397883649aef4cf0608cc37c103257e02d6ebe3f9c8fd58f9"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "06c3756504c359167b2e06fa9cdb455f6dbef223f143b33c3c61323139eb005b"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/GoogleDataTransport.xcframework.zip",
      checksum: "ca2d08f5c8c4b1e9797fd25664b0409dbf0b56580a298d27087169d85de298c5"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/GoogleMobileAds.xcframework.zip",
      checksum: "527ba86c38646b4900a1d2adb18373c7679c5875efd24df4870f44c278df1f09"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/GoogleSignIn.xcframework.zip",
      checksum: "30369c10de35c6e3fa4c29aadd76f96c77ab45fe8d637ea8bd3c98c5cc30b2c6"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/GoogleUtilities.xcframework.zip",
      checksum: "95dc417b76a66b40b150beb020e933b8e7324bd47da010874324ef1eb709283c"
    ),
    .binaryTarget(
      name: "Promises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/Promises.xcframework.zip",
      checksum: "c1512b4afb539f3d9a984e9405e4787c50e4fba180ebcb785f6e4a68df3855df"
    ),
    .binaryTarget(
      name: "RecaptchaInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/RecaptchaInterop.xcframework.zip",
      checksum: "d39a2d9831811f5a5b08adee0180632118ca798cb269ffda117fcc59a54b0d38"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/SwiftProtobuf.xcframework.zip",
      checksum: "860497ff5ed73f85baa60a926794c6e90ee63bb6876e5dfae29f8f4639b80d2e"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/UserMessagingPlatform.xcframework.zip",
      checksum: "1b08ff1f533735d54b8e76e124ddcef5580f1dcacffccadf23ee4d3d56dc3ba4"
    ),
    .binaryTarget(
      name: "absl",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/absl.xcframework.zip",
      checksum: "6ab04619c5d4c5311f32eb7210c053eee7ec14906ba8b92d263e24e268d8182f"
    ),
    .binaryTarget(
      name: "grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/grpc.xcframework.zip",
      checksum: "ab1724dfea1fe31a2777061c5cc0520499356e0979a81ed06872e5c91d4d4025"
    ),
    .binaryTarget(
      name: "grpcpp",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/grpcpp.xcframework.zip",
      checksum: "3dd1df5094ebeb26a73945ec7990996fde5bf67634bf5269da3a18955ab64d89"
    ),
    .binaryTarget(
      name: "leveldb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/leveldb.xcframework.zip",
      checksum: "afd0cb6b308d7bdacb46785a77d8c270c2c88d752b18c251d43548bb268ed728"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/nanopb.xcframework.zip",
      checksum: "e118cb0b1e472dbcf498dda73554ad0085b60c0d9e61c50dd0c47c5eb242d094"
    ),
    .binaryTarget(
      name: "openssl_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/openssl_grpc.xcframework.zip",
      checksum: "6afb4d53d4eb8923e4909ede06f62ed39339a5b678f29b8f431fd401c453ff7c"
    )
  ]
)
    
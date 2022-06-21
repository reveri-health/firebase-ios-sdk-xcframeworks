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
        .target(name: "GoogleSignIn", condition: .when(platforms: [.iOS])),
        .target(name: "GoogleSignInSwiftSupport", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn",
      resources: [
        .process("Resources/GoogleSignIn.bundle")
      ]
    ),
    .binaryTarget(
      name: "AppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/AppAuth.xcframework.zip",
      checksum: "462ef675bef821d1e210a242bf9785d465ad19ddbd89e4dcd4d63b9928920811"
    ),
    .binaryTarget(
      name: "BoringSSL-GRPC",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/BoringSSL-GRPC.xcframework.zip",
      checksum: "34c86eec318eeedc6b4a7449bd89e68b3443732e02fd9df02f0e3d08054bd867"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/FirebaseABTesting.xcframework.zip",
      checksum: "81b797fe1b7eb051c6f00bef587cff6840c84085298ed1112eeb43c4873e276d"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/FirebaseAnalytics.xcframework.zip",
      checksum: "273e749f739635fabf9bb5b4d755130c204eb50bcf0d09fc7996fcd4566b57fa"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "e2b7e2ff7ea147ea6ef7c99f7592020b08ba71808032d3a58317bbb36e20e9c1"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "218b4efb42b3e69e94bbea150377cf7c6cd80c5d19e87f310507818559ebce48"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/FirebaseAppCheck.xcframework.zip",
      checksum: "7005a3b8f50aa62a0679ac7250dec05ec160b7ccd3859e88e0299aa6b3ab1a66"
    ),
    .binaryTarget(
      name: "FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/FirebaseAppCheckInterop.xcframework.zip",
      checksum: "c9cd8a0faa1b6cde7947580a9e938e89e8e06cf0eb886c63dec2dbc3a0ac21d0"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/FirebaseAppDistribution.xcframework.zip",
      checksum: "610329ba3147545346109f6e61bfd63be403f53e61b9cb80152a5a4f038d337d"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/FirebaseAuth.xcframework.zip",
      checksum: "7123415df4cf0e139e34def219f299aed1a261b80fa77ddf554d6496efbefff1"
    ),
    .binaryTarget(
      name: "FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/FirebaseAuthInterop.xcframework.zip",
      checksum: "1b754b029109a57f74d6372ca6ff8a3facbb756569314e0c6137cef4f185b6d6"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/FirebaseCore.xcframework.zip",
      checksum: "79524badc752755fda44404ccf695970c35689276fed1a14d12ac492660e9c97"
    ),
    .binaryTarget(
      name: "FirebaseCoreDiagnostics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/FirebaseCoreDiagnostics.xcframework.zip",
      checksum: "558f280e1540b2f9ac7d8e85516d5c4a30e07b6b293c5ec15d26fe5ebb1bf6f7"
    ),
    .binaryTarget(
      name: "FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/FirebaseCoreExtension.xcframework.zip",
      checksum: "43cde351f70e6af58af9c220ec105f06b6ad3a9f58682cb122b69fd06c7ab892"
    ),
    .binaryTarget(
      name: "FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/FirebaseCoreInternal.xcframework.zip",
      checksum: "98c40655b36aa1b2b73202a1508c0ee31ad31efb798e833649537be3fdc91d4f"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/FirebaseCrashlytics.xcframework.zip",
      checksum: "019dc6eb7cf7e01992e8158a872adc129b08338801af387c3a9f12fbd898f250"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/FirebaseDatabase.xcframework.zip",
      checksum: "10785448cf7f6baa023f75cef671d2af758e090f15cd5c7a4564e7c8c1356408"
    ),
    .binaryTarget(
      name: "FirebaseDatabaseSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/FirebaseDatabaseSwift.xcframework.zip",
      checksum: "792c74b3da02f03ba9c178c012f81ad17f8415f89b3654fe49f29a67901329d8"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/FirebaseDynamicLinks.xcframework.zip",
      checksum: "e92906e5b7d0ad8b1cee4fbc6488c75c5845ec71e1bb09a6a3c98286fe6e98b3"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/FirebaseFirestore.xcframework.zip",
      checksum: "40f23ab144247b4cd8f974babcb9f8f3a36d2a822a368136cccd879ac6471cb2"
    ),
    .binaryTarget(
      name: "FirebaseFirestoreSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/FirebaseFirestoreSwift.xcframework.zip",
      checksum: "42877056e6d8dbdd531a01c76864461068b00da91517c44151fb455a79e454de"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/FirebaseFunctions.xcframework.zip",
      checksum: "7661c95d663faae117979cb11febbcb680f7e67490a3e9c9aaf70fd84a4d258e"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/FirebaseInAppMessaging.xcframework.zip",
      checksum: "129155226a3bab99224aad2cbf7932a36ae8029f37025b2a7f12c1de9382e4b8"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessagingSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "71daa78ed48d7365bdbe65545d04feb0043e3fc6a04fd89fff5a79087e245452"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/FirebaseInstallations.xcframework.zip",
      checksum: "dc738642b07a948378cf72f7da16f492626e3fc1ff1cdce9e9ad9eac6c76a0cb"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "972d67c9a0e6c606fdc1657b64284ed0db511a3d915b7b82b05d5c83f8daa9a1"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/FirebaseMessaging.xcframework.zip",
      checksum: "05cb697bb00374a4ff962214fa262c525bcb0e6adb46c2f0fc884fac319ff741"
    ),
    .binaryTarget(
      name: "FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/FirebaseMessagingInterop.xcframework.zip",
      checksum: "d4e111774fe7ba8a47685974ae201f5b72f7496b66e7e944417159ce43dda577"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/FirebasePerformance.xcframework.zip",
      checksum: "962b45105a84ce15e30a0a1db9578d0dcf9e590916cdda5dc7867be512de57d0"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/FirebaseRemoteConfig.xcframework.zip",
      checksum: "5c61d2f84880ddbaacb81d6e8716c1733517877467b28e3603ab40a11ab73882"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfigSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "1cba084b252c8ab192a8b1854a37ada1d9f19f25363851a1cd651eb202255194"
    ),
    .binaryTarget(
      name: "FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/FirebaseSharedSwift.xcframework.zip",
      checksum: "72b0010dc85f94ef17dbf7fb305688a27ffd289e0b3975f473ac2fae0febaffb"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/FirebaseStorage.xcframework.zip",
      checksum: "fad0d54982133a86574245c7c418cdf30aa631073d4cab6f25c0792ef961ae23"
    ),
    .binaryTarget(
      name: "FirebaseStorageInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/FirebaseStorageInternal.xcframework.zip",
      checksum: "7fa82d084f6929c8c094cd5fd41d0e3097e7fa315cfce2ad73da53a17e48a993"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/GTMAppAuth.xcframework.zip",
      checksum: "096b9d05233c58eee5083bce20c2c524d5718e0ff0bdb04005b0c1790060099d"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/GTMSessionFetcher.xcframework.zip",
      checksum: "33cff0151d02e1f5f45ac9bd25703cec8e0c177cc83287e514c55241c87cddb3"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/GoogleAppMeasurement.xcframework.zip",
      checksum: "a6018cbc897ced37a9d0c3c28bee51482d76bad041606aa552785c32cad64fdf"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "56b7092512642f309e82949b097f8d3a71575b8448dc4a1b50b1400a4e1a1a2e"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "897f0607617449e857da60bab651d4ef741c584ffede7ae58f2d97ac0d42743e"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/GoogleDataTransport.xcframework.zip",
      checksum: "a5f6bb57f589c583ec6df0cfff9be7329fb5491ee0647bddb294fb997d3ee0f1"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/GoogleMobileAds.xcframework.zip",
      checksum: "9322b482cedbed0a0dc905dd17144c7d57948f9292a582a85c9bf5e72d5b44eb"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/GoogleSignIn.xcframework.zip",
      checksum: "d316b23627dc33a415ea74aaacb8563ee12ebc3f9a67a5bd8864b7857f6e85dd"
    ),
    .binaryTarget(
      name: "GoogleSignInSwiftSupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/GoogleSignInSwiftSupport.xcframework.zip",
      checksum: "81d19ce8be6960fc610b5ea0486ca126f053b83471ce44592423ba718921ec36"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/GoogleUtilities.xcframework.zip",
      checksum: "449d9e4634f97e70169f85c1615555863aca2718d498f51dbe8337f2e3a90aba"
    ),
    .binaryTarget(
      name: "Libuv-gRPC",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/Libuv-gRPC.xcframework.zip",
      checksum: "c2fa8d9f3a75ff72011b65d66923b899ccf3036a7d0347c765e2d4550d84b621"
    ),
    .binaryTarget(
      name: "PromisesObjC",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/PromisesObjC.xcframework.zip",
      checksum: "33ddb8ff65c101587ff84b4da1a6a91ac99d0648348f2416de383d4799ff98a6"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/SwiftProtobuf.xcframework.zip",
      checksum: "6d3fc805d495941501ea9af3b0cbeed5aacc5fe5f21a05d6fb8bf9633729aea7"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/UserMessagingPlatform.xcframework.zip",
      checksum: "f36c057a37d61ff78816f6cfcd8810e7388ce0ec282da7146b39cab6b53b0ec4"
    ),
    .binaryTarget(
      name: "abseil",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/abseil.xcframework.zip",
      checksum: "c7ce4db3fc00ce58a3ce4a0f30cc32f5d008c890012de0a53295285adca918f3"
    ),
    .binaryTarget(
      name: "gRPC-C++",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/gRPC-C++.xcframework.zip",
      checksum: "670117754d5ed7b3debba0139c26c80b1d7eb4e5b6943665129cfc283bce5e7f"
    ),
    .binaryTarget(
      name: "gRPC-Core",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/gRPC-Core.xcframework.zip",
      checksum: "8d38a7bacf8d6b1a1a1ca9e3958fce741615fa67ddc5d767bf2082287aa0846d"
    ),
    .binaryTarget(
      name: "leveldb-library",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/leveldb-library.xcframework.zip",
      checksum: "d36a74b22ed2f0322438ec37514dc98350e309199566c2dda4ec5273ebb411fa"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/nanopb.xcframework.zip",
      checksum: "e9a503d1f44eea60ca95a5e4397f96ece961f7d48792214e976a988b278a43d3"
    )
  ]
)
    
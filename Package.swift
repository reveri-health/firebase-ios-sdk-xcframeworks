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
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/AppAuth.xcframework.zip",
      checksum: "c60271aa80c3a3d594e549430550339326392e56100b6e253dd59127e07bc533"
    ),
    .binaryTarget(
      name: "BoringSSL-GRPC",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/BoringSSL-GRPC.xcframework.zip",
      checksum: "ff45636fbece8917604db48162f2432b443cbafeedf2788f1fe14b86b179e2b4"
    ),
    .binaryTarget(
      name: "FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/FBLPromises.xcframework.zip",
      checksum: "fe88b4144d70c5c35298267e02a77d96f137711a49ce83662748a9acfbe3b8a6"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/FirebaseABTesting.xcframework.zip",
      checksum: "2b8c2aba9c3d0016fb4bb8338257ab240a9ab069b6bc59779ead63b01c758bab"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/FirebaseAnalytics.xcframework.zip",
      checksum: "b8a64b517341487cf20c5a0aa38d4256ecd8725b20910c467a78ff1ba6b00977"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "773517f01dcff7578414ce8b829e25eda222a17759939b2158936a5abd5277dd"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "dd2d96ca3b62def4e3d035ffc6de75bd9faffd1a0a4b6eee48cec84a6051b494"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/FirebaseAppCheck.xcframework.zip",
      checksum: "4fa8446d493feea1904d2449773c20e34b0759caa1600d0cf149c7fe7a80aa40"
    ),
    .binaryTarget(
      name: "FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/FirebaseAppCheckInterop.xcframework.zip",
      checksum: "bf0b8379cd0d8b918aee631361855da18c12c4ca7e813dec30d707881bfcd73f"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/FirebaseAppDistribution.xcframework.zip",
      checksum: "fd2d79b313788fcd8802ed0248ecff90675c7e758660331122d75823872c5806"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/FirebaseAuth.xcframework.zip",
      checksum: "ab46ae24f816d6d85eeca9dff47cc01a7bfbbac9048d741067a3d031019137e5"
    ),
    .binaryTarget(
      name: "FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/FirebaseAuthInterop.xcframework.zip",
      checksum: "85e3ef5dff89bcbef0257eb3d732404301f883906becdbeb79f42891895ace75"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/FirebaseCore.xcframework.zip",
      checksum: "5e8c75c02dbde8ebe704e20f19aad6a2d293295ec83190cc1310d03d08a4b37e"
    ),
    .binaryTarget(
      name: "FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/FirebaseCoreExtension.xcframework.zip",
      checksum: "6ed451b3072931e94258d01c92081fe0ee6755658829eaee6fc08bf5b08b4316"
    ),
    .binaryTarget(
      name: "FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/FirebaseCoreInternal.xcframework.zip",
      checksum: "440859f2ce99f8482adc4511686b07873736c41a2eaeab59990a77794f96d902"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/FirebaseCrashlytics.xcframework.zip",
      checksum: "16be61d41754f7c53b350eb98b4f55f2cd9b351cec753955705e9018f40e1cc4"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/FirebaseDatabase.xcframework.zip",
      checksum: "d3efec7afef0407705f7aea21c08b6f63a39ea7b218fb51668a932eea87eedf5"
    ),
    .binaryTarget(
      name: "FirebaseDatabaseSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/FirebaseDatabaseSwift.xcframework.zip",
      checksum: "afc08b332841294ecdd28100b0f544cddd924db2f81074233fa91976cd5f48ed"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/FirebaseDynamicLinks.xcframework.zip",
      checksum: "e9251d20269aaae6ba0142beee73ef6250bda744b96fa2a3a2934918e89a7ead"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/FirebaseFirestore.xcframework.zip",
      checksum: "785bfcc01310d1bab9ac0052943af7740df754f7591015d9a175783e41c5f312"
    ),
    .binaryTarget(
      name: "FirebaseFirestoreSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/FirebaseFirestoreSwift.xcframework.zip",
      checksum: "2217e3da39ec2b1ae4ecefe5fa5c9083c8fe673e2e233974ea5f8e3cd03c6bc4"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/FirebaseFunctions.xcframework.zip",
      checksum: "a7103a69fc6083572e9dc9b03c823e54f0e640db5a6fc6868aa238c46e4f05b9"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/FirebaseInAppMessaging.xcframework.zip",
      checksum: "e3eae5ae123173eacb75d16b8c61a5db42c6882cce28670b65740495abc1ba44"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessagingSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "c495a04426696048b7eefcd65985d4a8c2f7dda6202d1af479d5c36fa868091b"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/FirebaseInstallations.xcframework.zip",
      checksum: "cd84618fd41c72b820e39a85199912d280e7bc3589b06dc403b9dca496b8c6f6"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "18cb3f224296931a688106bf11a8bce063f13efc307b2a95950134e6aeeb702c"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/FirebaseMessaging.xcframework.zip",
      checksum: "abe11591a3f135ac71f6768dc6a375e66ebfaf2a0ad3e79b23227fc55d7f5145"
    ),
    .binaryTarget(
      name: "FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/FirebaseMessagingInterop.xcframework.zip",
      checksum: "c8518c8cc3e2f1943a7e01e8445b282624669e68342e15c231b97f60a5f0f5e5"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/FirebasePerformance.xcframework.zip",
      checksum: "495ac1d55b96cb80578c121d209c5371fd79c966b34aa3b3152c5b6e38daf8b6"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/FirebaseRemoteConfig.xcframework.zip",
      checksum: "33f634dd400344ace212cb4bbf084054d9e14a2bf9d453b7a9f3e00880673bac"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfigSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "ecc5647e40eb6544c14e3db7088f8565f289681a2e4926935cf752f94b79f1ae"
    ),
    .binaryTarget(
      name: "FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/FirebaseSessions.xcframework.zip",
      checksum: "73c8b68ee70a336e3e5563482b437cae406d28726f0d20c4a65258a84e907540"
    ),
    .binaryTarget(
      name: "FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/FirebaseSharedSwift.xcframework.zip",
      checksum: "7ca77218792f547fad19be0e3acec7d8608b69589586495ed1a4c78433402469"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/FirebaseStorage.xcframework.zip",
      checksum: "b5ee8727185500678f84ce96680d35001a71ed7aed7783f484153380417d13d1"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/GTMAppAuth.xcframework.zip",
      checksum: "0340a8f018ed6b1947c0399b40d101ab7a3012ddc4c1f8321cdee3011ca4c37c"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/GTMSessionFetcher.xcframework.zip",
      checksum: "f6d4204a35bbbb5d7cdd792e6284ad7351ffc601c0dd9a25a7eecb263991c2ee"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/GoogleAppMeasurement.xcframework.zip",
      checksum: "2e49d616fbaf42bc7ba113acc5fd49388d6ccd5bccc7f632a928e6e91c51ffac"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "840b8cda361c0421aa682128f1edc400192fc0bff978e691a8a94bb5ab806398"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "355908d41d0e866dc930d9be8cc49b9a08ec52eb74ebd7cd9bb307d95f1981f7"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/GoogleDataTransport.xcframework.zip",
      checksum: "325eb249e40b244d5a933daaa869f366e9b6f1c4430b540e189ddc66a7358329"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/GoogleMobileAds.xcframework.zip",
      checksum: "edd033e1a38e49316fddffb8183608c03281dbbf2ac0b80852e9141cd2b5a65d"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/GoogleSignIn.xcframework.zip",
      checksum: "3fe4f6c4550ed6a595d85f6035c9e336cf579d51ed6e48cf555163b841ffd2d1"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/GoogleUtilities.xcframework.zip",
      checksum: "e81323923d15bd3f8008920bf24e824a9593ca2098b871630886bc7cd6f70885"
    ),
    .binaryTarget(
      name: "Libuv-gRPC",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/Libuv-gRPC.xcframework.zip",
      checksum: "16bb3b6ec856d87dab22900875a1ccf4b4f05cbc8044778abca7425abb5c3915"
    ),
    .binaryTarget(
      name: "PromisesSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/PromisesSwift.xcframework.zip",
      checksum: "949c7fe92ddf9f311b225bfcc7a0846ac640aafe89ecf34a3585ee9d2c7e1bed"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/SwiftProtobuf.xcframework.zip",
      checksum: "2c526811ac25a3a34e70de8d3dddb912619853f559fa8c62f7053a9d22231f58"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/UserMessagingPlatform.xcframework.zip",
      checksum: "6d06e03d7142ebe7b6d0d98b972c8fb2c4722440e58b2b29056df8b3c988e4cc"
    ),
    .binaryTarget(
      name: "abseil",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/abseil.xcframework.zip",
      checksum: "30b42d3a3f70df084c8d57ef57089dd9c475dc165c3ff3f266b279eca8daefa9"
    ),
    .binaryTarget(
      name: "gRPC-C++",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/gRPC-C++.xcframework.zip",
      checksum: "69c3a22177879b38918ff099c1cb15ab30f9f7ed781bfb4f6b5d12fa442ea7fa"
    ),
    .binaryTarget(
      name: "gRPC-Core",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/gRPC-Core.xcframework.zip",
      checksum: "ef8d4f24c09c34f6317666fbf438b152115a3da1bcf9e8a7122598915ab8bb93"
    ),
    .binaryTarget(
      name: "leveldb-library",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/leveldb-library.xcframework.zip",
      checksum: "3f7ff35236fd5f30fd4580a85a9fabae7389ac0057be0cdcfaccaf5da74ab593"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/nanopb.xcframework.zip",
      checksum: "edfab0354f3b61f04417c66985873d57d32a254411a88bdad65fa7b881863f87"
    )
  ]
)
    
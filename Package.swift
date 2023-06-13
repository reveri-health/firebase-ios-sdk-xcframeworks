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
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/AppAuth.xcframework.zip",
      checksum: "3ebd429b68b494f5b5e838be60bd76966f71609f1b49cc27fd82b53292ec9acb"
    ),
    .binaryTarget(
      name: "BoringSSL-GRPC",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/BoringSSL-GRPC.xcframework.zip",
      checksum: "9ec90d1e842ef15383caebd6a50b6e415e9124da05b1f8467148b6c8c4a7adb7"
    ),
    .binaryTarget(
      name: "FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/FBLPromises.xcframework.zip",
      checksum: "1e16c3b170d651c3aaac2ae937da4a1fc02f151686ab0e4af2d4bbf58d347a1a"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/FirebaseABTesting.xcframework.zip",
      checksum: "ae66f90476b6ec6234128745e7aa3a1938fd2ad2cbc397c461ca130f968d5069"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/FirebaseAnalytics.xcframework.zip",
      checksum: "02359e95747f698e2a855b30d74509740d3df7bdef7eed9ef682b7f75f43e3b8"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "62d9c968737137553d3698fd60378b4f8bb5baf1a28f841293a914f20022fb56"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "e60dec6c22e54864a656d262b35fffc0edd787802283acf75466336e4912b3a0"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/FirebaseAppCheck.xcframework.zip",
      checksum: "255014e5c9dd0c99aa52622eec5d49fac6448c78029eb280820a05579b5c47ac"
    ),
    .binaryTarget(
      name: "FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/FirebaseAppCheckInterop.xcframework.zip",
      checksum: "1a7420f5d975b60a90bf4882f256e017e784f608398d50c2ab7ee277f603ceda"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/FirebaseAppDistribution.xcframework.zip",
      checksum: "9f1f5a0bd0cc8e534b8f77cdb62e9b61648b87956c6b0153bbdcb0de5420f023"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/FirebaseAuth.xcframework.zip",
      checksum: "644e93b7ab6f8d9376a477a808178fc783c00029f80b8d318388e8d2a496ed9f"
    ),
    .binaryTarget(
      name: "FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/FirebaseAuthInterop.xcframework.zip",
      checksum: "19f5e8a3caab0973efc38e2091ee45d4d23926df00f1915bd09f0267a2718e90"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/FirebaseCore.xcframework.zip",
      checksum: "b63c17ecbdeb85d9986304a9dd2d57e47f940725ef8ce3d8fdfee708ae6cf82e"
    ),
    .binaryTarget(
      name: "FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/FirebaseCoreExtension.xcframework.zip",
      checksum: "bc46b5747592cb648195dc7c30cfc9f6aaf03e3b61b0b844a844c6b790664fe1"
    ),
    .binaryTarget(
      name: "FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/FirebaseCoreInternal.xcframework.zip",
      checksum: "300bc8049de34dea21356693dd1e1fab91bca35d52b0ac4fdc091acd7e62b953"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/FirebaseCrashlytics.xcframework.zip",
      checksum: "b7f1529959b7908edc97c83d661428e1fb1a457daa1b05aca43088767237fc22"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/FirebaseDatabase.xcframework.zip",
      checksum: "4adff6c3e709135afb34d31bd7dbe7f01defc25f1db0b25675c650947b588d17"
    ),
    .binaryTarget(
      name: "FirebaseDatabaseSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/FirebaseDatabaseSwift.xcframework.zip",
      checksum: "40a4ce3b82b87f82537b2f0966d0045614666ecdec37473adace0b3d0d732d2d"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/FirebaseDynamicLinks.xcframework.zip",
      checksum: "b2b80e96be3ef07bd62ceb0a7eb71bc80a1bb4b06dfb30f22dde081f0e39b3e1"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/FirebaseFirestore.xcframework.zip",
      checksum: "552aac0c6abf4e7ccc7566f359627953c6d0e51fb2f5b84dd7bd1ac2f250f9be"
    ),
    .binaryTarget(
      name: "FirebaseFirestoreSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/FirebaseFirestoreSwift.xcframework.zip",
      checksum: "8ec9542284924e78e8cac6be80220eed12d3e964a957f3e9503d5c9cb44308a4"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/FirebaseFunctions.xcframework.zip",
      checksum: "98228e5eb3ae7e0bbe4ce9b82ba916c86944774bcbec88d00e700f373f929eec"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/FirebaseInAppMessaging.xcframework.zip",
      checksum: "9da97ccc407000abc170bcd1f9fb518a75293f2fef39b534ce7e44afee45f845"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessagingSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "b6e3a55673cd8646f8aeb4696c4e6aa6e655abae0db4d18b922de5416b05ec6e"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/FirebaseInstallations.xcframework.zip",
      checksum: "a77bd14b6a9117dee7624904f0a6277c481cc0c132cf5fcd12177925f5ee796d"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "6eff0ecd8187d92e565f6f3f5df0d71480a3fbd2c48aa0875701a0dd685247c3"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/FirebaseMessaging.xcframework.zip",
      checksum: "1ef3272768888a47f612d3632ebd0cf04ee07901721b29cab07e0b096292f898"
    ),
    .binaryTarget(
      name: "FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/FirebaseMessagingInterop.xcframework.zip",
      checksum: "269e9c3bd41b7e77cefe3c8140356072944ffde171b840752c2ddb43aaacb797"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/FirebasePerformance.xcframework.zip",
      checksum: "d8725f0defecfb941ad13d215a8ff1162e1e04113177a185987bab9cbf1c1d25"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/FirebaseRemoteConfig.xcframework.zip",
      checksum: "f27e45ef9383aadc78ab227f9ad0d68934838b38b4cc3bf50341e25a026a7d46"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfigSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "990368d0b5da7bb9ad134852faacf954141bfc752e477273a75523f88976fc2f"
    ),
    .binaryTarget(
      name: "FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/FirebaseSessions.xcframework.zip",
      checksum: "4bb675d1d3e1edde4cd979888334ee2c5dbf819f88756bd6d2aa1310ee08352a"
    ),
    .binaryTarget(
      name: "FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/FirebaseSharedSwift.xcframework.zip",
      checksum: "479842e0a0a9090f4b5c9609fe49e62df433daa0914b6178446b17d9391dcaba"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/FirebaseStorage.xcframework.zip",
      checksum: "8c6324bb4e18307ac8113b794a098f204e89aaac0b141d7f7678d0694dc6782d"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/GTMAppAuth.xcframework.zip",
      checksum: "b5f5b75e3bfb6913d87c5edf8d9ecf2f25ffc20bfe65a49f3b743d5202dd9746"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/GTMSessionFetcher.xcframework.zip",
      checksum: "53c5a75dc515eacde349ae23e41e237612a60c0423d0c758257f8dd10d826230"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/GoogleAppMeasurement.xcframework.zip",
      checksum: "10d4f031ca03e024b17651a9e9b4b97a1cdd62dffe3832a1bde5d9abdab712c6"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "8457d3c0f3ce95203c8dd5fbb29a7f1c82dc5ace24207e4206a01d8019006426"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "8f54b88b9f32ed7a8aa835a5dd7c382cc55f7b52df7d8707a4be0ba6d1519663"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/GoogleDataTransport.xcframework.zip",
      checksum: "1b2bc2ce710830a1f958eaaba735d9bf9aeb815c319bd439253ea69587713335"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/GoogleMobileAds.xcframework.zip",
      checksum: "aec8ba497399d2934c4b926d60af7f9e83f26b981b893bd274b89acc3c6af9c4"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/GoogleSignIn.xcframework.zip",
      checksum: "e429c5b54fdc3ca05d272fec6be5a474b8d2b2a9fb22e8a0f12cb75cf3f87885"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/GoogleUtilities.xcframework.zip",
      checksum: "d1eb3a24ff09c5d96304689c8e42f89a4d40db03ba37c38aa215f1c3351b056e"
    ),
    .binaryTarget(
      name: "PromisesSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/PromisesSwift.xcframework.zip",
      checksum: "2f7278fe577d5605cc6d788c4178bdde94d8f6050432ab494d3ed7fc08230369"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/SwiftProtobuf.xcframework.zip",
      checksum: "e82d64d3b63c93f9eeb913d5b55469c78beed0b115e315a0a70187924897a648"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/UserMessagingPlatform.xcframework.zip",
      checksum: "9855a633629744b5e9f2168dec3b34dccbd9ff6d2f6ee0111e5cee862a126b4f"
    ),
    .binaryTarget(
      name: "abseil",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/abseil.xcframework.zip",
      checksum: "c2a0316082526b77944a95c81d25f57b85a36abfc8ec7b1718e24c6127677977"
    ),
    .binaryTarget(
      name: "gRPC-C++",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/gRPC-C++.xcframework.zip",
      checksum: "3d7236df7004a5cea4b9b27b054d49a7b0799bcb0c09a4a5390775cbb9468795"
    ),
    .binaryTarget(
      name: "gRPC-Core",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/gRPC-Core.xcframework.zip",
      checksum: "34f96f7df3e2a33d8959a58063dec506395bc495ef2c3841b4d4c7873f2cc853"
    ),
    .binaryTarget(
      name: "leveldb-library",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/leveldb-library.xcframework.zip",
      checksum: "1a7fb1fcdb62c0c9792e5ad21ef27be8da5374ec167cb9b6c7d4baed289efbef"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/nanopb.xcframework.zip",
      checksum: "4d738c37348b86bbc13cde481f8ed254a52d80793b242f63c5d9855586f55dea"
    )
  ]
)
    
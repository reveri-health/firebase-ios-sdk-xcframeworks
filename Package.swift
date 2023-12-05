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
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/AppAuth.xcframework.zip",
      checksum: "68021d36993bc5448703977eb82861fc5ff4c8985945be7d60c9d2704c51e625"
    ),
    .binaryTarget(
      name: "AppCheckCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/AppCheckCore.xcframework.zip",
      checksum: "ef25d6eb477b25e6f8325f8f0f2e54cb90cb65a7c1288c8f538b63a92a18b531"
    ),
    .binaryTarget(
      name: "BoringSSL-GRPC",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/BoringSSL-GRPC.xcframework.zip",
      checksum: "23aa1521a1f7ace0f50ab6a173de1f375e4c54c59a3763967483180d531178ab"
    ),
    .binaryTarget(
      name: "FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/FBLPromises.xcframework.zip",
      checksum: "0e19381436d7a6015419314990dc78ce1988166bcd131241a9189ae8b7b6e53b"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/FirebaseABTesting.xcframework.zip",
      checksum: "931459d65b8f11fc58eea79ba1b5204050cec097ab3190eca69412a9b318fb0b"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/FirebaseAnalytics.xcframework.zip",
      checksum: "51c94a22e59c548d5a62caf8511e354a3b01a8450fc701cff0ae55e1ecb1b55b"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "7d3fc8b7decb6ea6d2fff9f1f49dd19cbfb4d3a57a8b17f70554e7e1d0fb73cc"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/FirebaseAppCheck.xcframework.zip",
      checksum: "400febc38e340d36d78af312725001d399f8e9d751d9f09c966eb83c1b34b74e"
    ),
    .binaryTarget(
      name: "FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/FirebaseAppCheckInterop.xcframework.zip",
      checksum: "0561c1b47e0bf567dc57c8eeb8a2042d968a4642d263bccc49ee7b39051f2e92"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/FirebaseAppDistribution.xcframework.zip",
      checksum: "317789db41bf4d18d5a261151317ef9b3e0d7ec532abdd83b1e43853e20b1b2a"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/FirebaseAuth.xcframework.zip",
      checksum: "1b7c0a05b70711a08c6ae78068604cce0d7085f64b0e07b42bb703d86173be0d"
    ),
    .binaryTarget(
      name: "FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/FirebaseAuthInterop.xcframework.zip",
      checksum: "3a8bcf2b48a8044d69b5578358bc385adfb232cf1c49c2fd166f4724fcd9816d"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/FirebaseCore.xcframework.zip",
      checksum: "5148cc0a571289e1995cc699c89a5a34c9222c88ab882792e57fd1695904ced8"
    ),
    .binaryTarget(
      name: "FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/FirebaseCoreExtension.xcframework.zip",
      checksum: "1d1fe00d8de2a380b0693aa8340bb71b5c38cbd907eaaf194e7a058e2573d363"
    ),
    .binaryTarget(
      name: "FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/FirebaseCoreInternal.xcframework.zip",
      checksum: "9774c5c81f43fe10c002e8e070a041896eb96e90cf0ed8720326199fb42b934c"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/FirebaseCrashlytics.xcframework.zip",
      checksum: "27130f9b04c0b7f90897c0d7b8d19f5b1362f384ed624f90038b23aafe1d0646"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/FirebaseDatabase.xcframework.zip",
      checksum: "8b57c63b1af3cc29a5cbddac321bff4c0891bdad4d59606edd49703839b84147"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/FirebaseDynamicLinks.xcframework.zip",
      checksum: "aa897699cbc6b7a6617030dea0871864d282f93db4404c3032f1acd34b46570c"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/FirebaseFirestore.xcframework.zip",
      checksum: "4bdacedaf87be4889c3947ad285799a95f076667ad34ef483d541bb98cae6531"
    ),
    .binaryTarget(
      name: "FirebaseFirestoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/FirebaseFirestoreInternal.xcframework.zip",
      checksum: "b9187c11258f892807097b0cbe3253ece613d73e8110dca18dbf5126400505ff"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/FirebaseFunctions.xcframework.zip",
      checksum: "83dcfb8da958b9972e7785d0d3c2cb6e683d4b812ceddcb53e1042264dcfa67e"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/FirebaseInAppMessaging.xcframework.zip",
      checksum: "559d7c5f903ebbb7101463afb7b7202bf24d2936e1a8fc1635a33aa23acb1845"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/FirebaseInstallations.xcframework.zip",
      checksum: "6bd41c787e22fe7b1cfcf3020d49c985a14f11fa0b6c219413442ca29472b2d0"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "e22789524746781c966c7ee7d7e4d6b8d935ed18ddb238ea90f79f539c5c61e3"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/FirebaseMessaging.xcframework.zip",
      checksum: "a0406bb80fb5e99325165c0141515e745e44728e5a6c5be893dd5a5104f29d15"
    ),
    .binaryTarget(
      name: "FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/FirebaseMessagingInterop.xcframework.zip",
      checksum: "13e3e5b651163b838fdbf7512f2cb08245e8322b7b535391e5a8fb23f4ef155f"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/FirebasePerformance.xcframework.zip",
      checksum: "93d2c40d9bc389f36bfe6016d10fb2fce87e3c5082662f038d07ce27c75e96a9"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/FirebaseRemoteConfig.xcframework.zip",
      checksum: "26331b129ef320fe82410031daf6df3a753790c25ef8aa6b5eddba2e67f1d400"
    ),
    .binaryTarget(
      name: "FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/FirebaseSessions.xcframework.zip",
      checksum: "90350009a2defc18f37719ed8bdb08033ff1ad6b345a219f999605e4bedf5118"
    ),
    .binaryTarget(
      name: "FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/FirebaseSharedSwift.xcframework.zip",
      checksum: "5f0fd5a6bbbbb6a2911327bbbbb77f350419d70669364e2b236758d4a87e07e3"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/FirebaseStorage.xcframework.zip",
      checksum: "91eb5576c6be242a0f34c665cd17a1bb9335db32801f6a2ec1eeb550d1dc78a3"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/GTMAppAuth.xcframework.zip",
      checksum: "6aa6b6f6408fe271ab7670027a74382bbf208568cf1f646057c750aa6e7d7af6"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/GTMSessionFetcher.xcframework.zip",
      checksum: "63416db0bde9cbd7780dc5c84c15501a403b3fd7a579c928e8dbbd497f6dbea2"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/GoogleAppMeasurement.xcframework.zip",
      checksum: "e4d152eb77f6a14bf96bb13a4b51637d72c6f524f3dd96f25c3b2a15d7bcf3e9"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "33d401edc7e7848b2260406fb802cb0db57867d22123e46cdd25ddc51d00f974"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "e803ce05dd47d37e8b3819769d6abf89b5c710c64e56b1de832f2e20bdc74491"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/GoogleDataTransport.xcframework.zip",
      checksum: "f07cdc56a45ad34cd295b7d1a1255a9dcdf85b9d8cc021473e07c37eecfda59e"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/GoogleMobileAds.xcframework.zip",
      checksum: "cf30de3d681c94f135b184f086d04840ded8997c49b0876ac0e0e7b3512ffa1a"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/GoogleSignIn.xcframework.zip",
      checksum: "18f93e4d999892f91cd5eaec44066ee54d159979fd9a619e7ca68f823067154a"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/GoogleUtilities.xcframework.zip",
      checksum: "f31d3fc74013fe218c63bf029158d728c918ba9cbb5f11851c8eec4dd9fee935"
    ),
    .binaryTarget(
      name: "PromisesSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/PromisesSwift.xcframework.zip",
      checksum: "68971ba462bcdec59970cde31af803bfc7a451ff3a974f90d7225e518297b99d"
    ),
    .binaryTarget(
      name: "RecaptchaInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/RecaptchaInterop.xcframework.zip",
      checksum: "9bfce4e9b1caa64fa7bff1c18f0c6a85a87da13a630dab38da265413579fd11c"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/SwiftProtobuf.xcframework.zip",
      checksum: "fadc96b5248de141fdada26b19675fa33e709e339813cf17e136a8ae0289b3c7"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/UserMessagingPlatform.xcframework.zip",
      checksum: "3b819e44460e77aba870ca525b469901661be0fdf26ea138157b25e2badc4787"
    ),
    .binaryTarget(
      name: "abseil",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/abseil.xcframework.zip",
      checksum: "ba46ea116771347d732dc6e0693b93c7be22109c9e80abec538c8987909c8e8b"
    ),
    .binaryTarget(
      name: "gRPC-C++",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/gRPC-C++.xcframework.zip",
      checksum: "54035fe3ad834fbb42ad4f52893540cee4d7efbe6da17965767de16c5ba5cbba"
    ),
    .binaryTarget(
      name: "gRPC-Core",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/gRPC-Core.xcframework.zip",
      checksum: "e2ff26872e3cce84103e4eff861cca944c28cbbc95d34c39c6f0d56bc89fdf1a"
    ),
    .binaryTarget(
      name: "leveldb-library",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/leveldb-library.xcframework.zip",
      checksum: "2faa9982df779c55f6b9820a3342d9976cbbf374184f861bc12109439a2b400d"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/nanopb.xcframework.zip",
      checksum: "e9948ad8246448e1d57e5c12e311798d51f2c2949655cd99fd354cda4d6da3d4"
    )
  ]
)
    
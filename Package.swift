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
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/AppAuth.xcframework.zip",
      checksum: "09b85cec7efc9bbbaf169266b9c6ad7962510c0db542b35cac05a6a86c59404c"
    ),
    .binaryTarget(
      name: "BoringSSL-GRPC",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/BoringSSL-GRPC.xcframework.zip",
      checksum: "a1454067150792d6c893d969dd21362b26e5979834a22587fc89bcf031ea86ed"
    ),
    .binaryTarget(
      name: "FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/FBLPromises.xcframework.zip",
      checksum: "a29db6af55bcb2a9a83addcf5c8448f78e9e28153816dd92f1afd95fbbfcd733"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/FirebaseABTesting.xcframework.zip",
      checksum: "b0eed2878896337be4342f09bab94662079cbbb83927f51afccd81407e2c29da"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/FirebaseAnalytics.xcframework.zip",
      checksum: "df9cb3a26ba288126c13659669233af224615c7bbd32de6b814df288bc3aebab"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "ce03c92fe009e7efc33da3b779a526a7d5374cd6060ce38fa461d17a23682aac"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "5982f82292834f47e6a2c806561edf2f26237a4704fd1a9d19eea651fbf321c3"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/FirebaseAppCheck.xcframework.zip",
      checksum: "59951fbec7a731e1112e9d9643ca0b41fa16302e3c91c7882326cbeb8ed9c7a2"
    ),
    .binaryTarget(
      name: "FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/FirebaseAppCheckInterop.xcframework.zip",
      checksum: "2243bb86321410f139999846b57db20e87abff818be859785fc128350707731f"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/FirebaseAppDistribution.xcframework.zip",
      checksum: "30669e533ec7badfa53ed6e97bf43ffc5f851105fafe06e8e2222312041426d9"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/FirebaseAuth.xcframework.zip",
      checksum: "2ff5354250f23312589493f4b1f560ce947c22d910613ca9b5ec43689e8b6fd1"
    ),
    .binaryTarget(
      name: "FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/FirebaseAuthInterop.xcframework.zip",
      checksum: "0b0c54e0d66ec8718e0c14f0e230b2132bca86c7f93b84945e2b2ac9670f3a3c"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/FirebaseCore.xcframework.zip",
      checksum: "badb594b2cffa8a58ae51acfbedc13f361546b61860380a2f9e82617c93b86e5"
    ),
    .binaryTarget(
      name: "FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/FirebaseCoreExtension.xcframework.zip",
      checksum: "a9a8c0553aa26a0824456ce85098e65be9c090eba928fe4bcbcd4a2bd0607950"
    ),
    .binaryTarget(
      name: "FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/FirebaseCoreInternal.xcframework.zip",
      checksum: "cb05fff2648e0f328e3a4f4c7c75c1ecff888bfecf704faeff0d65e00d258ce8"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/FirebaseCrashlytics.xcframework.zip",
      checksum: "17862763257ba71fae3c1de6392fa9c399d95a803e68415a11d2a4021b77599f"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/FirebaseDatabase.xcframework.zip",
      checksum: "7f18131d378bb05223c7072a5691d0d20ccb894697e33374e1e25b721743ec3e"
    ),
    .binaryTarget(
      name: "FirebaseDatabaseSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/FirebaseDatabaseSwift.xcframework.zip",
      checksum: "9f7251d8730c2a4e4391520cc8ccf34896df4d1aac5ee46981b0127c6aff51fc"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/FirebaseDynamicLinks.xcframework.zip",
      checksum: "8e21caba857eec2d082b8105c8cb1305d5bbf3ff6cef4a2996bc498db860eec2"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/FirebaseFirestore.xcframework.zip",
      checksum: "24213ae089039a87fc1b6bb6000c3048584bb4880bf5efb01349c65485ecf06c"
    ),
    .binaryTarget(
      name: "FirebaseFirestoreSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/FirebaseFirestoreSwift.xcframework.zip",
      checksum: "3774a69e0cbbec3cf3b8738b5c6271453b3164bacb9905fe062e8e75cabaee66"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/FirebaseFunctions.xcframework.zip",
      checksum: "08af3c761c36ba46292dcff24b77555794d4e9fc6cb54d1ccbbea86ff6f9b54c"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/FirebaseInAppMessaging.xcframework.zip",
      checksum: "7a012c141502b4c801ac03b9ef77d9f91a188c0ed01e9b41cc06be8c489e88fa"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessagingSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "c6767245613f8f16cb8a06e28c654800f00c2fbe9bfbfe4883a4cb496990f3d6"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/FirebaseInstallations.xcframework.zip",
      checksum: "c5104ee7d95c6e6522308099ee6bdc0c7aab63b95130bcd06e50fc51c1bc94e1"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "c15f9fa627feb9b3612aed3d7bb5a826514d3e5e12c7b5c1ac74cf452df55f5d"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/FirebaseMessaging.xcframework.zip",
      checksum: "1fce0fb3933a7968e7b5000e5f719ae4346e7991668c75e713d2e1baf1c56454"
    ),
    .binaryTarget(
      name: "FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/FirebaseMessagingInterop.xcframework.zip",
      checksum: "5222078cfa44668c65f9fc85d6c7ffa580605367969dd025165f97ad57d53ada"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/FirebasePerformance.xcframework.zip",
      checksum: "876557a33fa5d115ab0330cc0cce57acc376c4c75ebba8bee8b0b0a7020796fa"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/FirebaseRemoteConfig.xcframework.zip",
      checksum: "2544a306339b793ab62d54c4b24694d331ec5a0c0aa1159f1e6cce81e709c084"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfigSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "5fe0c88a7f4fd96e2aaff2b1a5877dc6c1e31dda71132f3f57fd562518996e82"
    ),
    .binaryTarget(
      name: "FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/FirebaseSessions.xcframework.zip",
      checksum: "8021bc547217c884e0c0da9527589b76b6f160d9eaa2b22cba13fa6072550605"
    ),
    .binaryTarget(
      name: "FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/FirebaseSharedSwift.xcframework.zip",
      checksum: "e64b9686825b583170d1bb1c7b83e2063a1ca2a703c9b5effd79b492dc087a27"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/FirebaseStorage.xcframework.zip",
      checksum: "293473dbf05989bf2e0f228bdc14de94524c9ed792d0356f88005f03a60ebc7e"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/GTMAppAuth.xcframework.zip",
      checksum: "8fb64eec48a6a4e0daf263d81693dda5047f1281b38f54c8dfd6aa90eb44ff4f"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/GTMSessionFetcher.xcframework.zip",
      checksum: "d70bb62739609f4298090ceca9e1849d043de802999bca882eeb9f932992284d"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/GoogleAppMeasurement.xcframework.zip",
      checksum: "04d6f3dc57d4e7979abf39f429b1fc5c7490787c1df37384d9a8120961ba96d2"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "6714a1bc8eb445da23eb8434e6e61e4ccb250960ac49d7ab75cd0d05788b432f"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "87674a5006d8f8e3c6270687f416938b368fc852b72c64a162fde06a2b70844f"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/GoogleDataTransport.xcframework.zip",
      checksum: "0bcdd94f2d23ed812cd32f2ad2ce5c6fd6ed4b28ae10d52dc5b591a21a02c8b7"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/GoogleMobileAds.xcframework.zip",
      checksum: "425df9957d4c5269c0dc1b9075029d4a92299ad76cbe06e75da3b9f9adc41437"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/GoogleSignIn.xcframework.zip",
      checksum: "8c077cab2a2a068051297c7843996295ee4d1a924aefd75dd51d72fc57bffe2d"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/GoogleUtilities.xcframework.zip",
      checksum: "c8239174c9abcbaf3d6ea592e25f13d683f008ec9d9d3fe7e6e6195012a3d47e"
    ),
    .binaryTarget(
      name: "PromisesSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/PromisesSwift.xcframework.zip",
      checksum: "d2d1229127b2b0ef022c3b816b9a6a23a8736cea49e62599f2732648583dbb21"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/SwiftProtobuf.xcframework.zip",
      checksum: "e1b11bb70318e99ff8dce8ac8d7da8a579fbc1e5db3e9ac9ed7259893b309991"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/UserMessagingPlatform.xcframework.zip",
      checksum: "f65d124091bba5a9a9c1c2ad5fe57c4294a487bc197adac646aa3dd12ba7493f"
    ),
    .binaryTarget(
      name: "abseil",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/abseil.xcframework.zip",
      checksum: "4a6413fff3e58156bdf0dd270abfa4164323af9960050b78576de3e1ba632c71"
    ),
    .binaryTarget(
      name: "gRPC-C++",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/gRPC-C++.xcframework.zip",
      checksum: "2590581e8f7297821445d5c6f71bc33fb956d0af03e12ba00645640908e5750d"
    ),
    .binaryTarget(
      name: "gRPC-Core",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/gRPC-Core.xcframework.zip",
      checksum: "760389ffa6e043b8fa4b178a514c03e39964a19c82857f34ea46774fa758fdf3"
    ),
    .binaryTarget(
      name: "leveldb-library",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/leveldb-library.xcframework.zip",
      checksum: "7cc839f97f72ad56717622c7a8a9b3ac53a7269615c235bdbf7543a5d1670156"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/nanopb.xcframework.zip",
      checksum: "8711165f73c4bc372194a516c2b9620c77b2156313362096ff465db1dd1e21e5"
    )
  ]
)
    
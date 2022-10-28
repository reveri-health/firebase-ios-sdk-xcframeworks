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
        .target(name: "FirebaseAppDistribution", condition: .when(platforms: [.iOS])),
        "GoogleDataTransport"
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
        "FirebaseCrashlytics",
        "GoogleDataTransport"
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
        .target(name: "FirebasePerformance", condition: .when(platforms: [.iOS, .tvOS])),
        "FirebaseRemoteConfig",
        "GoogleDataTransport"
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
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/AppAuth.xcframework.zip",
      checksum: "36eed05bc72842d5aca2d100410dfd55b0b4ae60ff9dec7e4ccb6e2f23d97db1"
    ),
    .binaryTarget(
      name: "BoringSSL-GRPC",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/BoringSSL-GRPC.xcframework.zip",
      checksum: "9b9cc4dc198e3e744f29fcae9d4b787f6c2623b2d36174c9c9135c2c390359b7"
    ),
    .binaryTarget(
      name: "FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/FBLPromises.xcframework.zip",
      checksum: "b8c2e314a92a7945854c5c946bef67357266d035fd29fcc2c6011ff70703ebeb"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/FirebaseABTesting.xcframework.zip",
      checksum: "7e9f21d1f15ef366e1a4ecf2870a612d5463fa4a50b5398fe4390e071bd4725c"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/FirebaseAnalytics.xcframework.zip",
      checksum: "7a755df8341193d31099c0243ff178d7c70c13c959392422666be7905991f24a"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "d8aa5276160e7f11d1d94164e47daa07d7c25399cce8f893d641011b60483a93"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "d9f9a9d7af289543f5031a6ec06f2ebdebf68d2d9f94bae47d5cdf3dba20f965"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/FirebaseAppCheck.xcframework.zip",
      checksum: "be77f753da5c8412d9588b083d0d89f093e66c1dcc93903816d2623e11d9ee28"
    ),
    .binaryTarget(
      name: "FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/FirebaseAppCheckInterop.xcframework.zip",
      checksum: "f89f32d984c4a8249e3d898a99a14844140c8889f15a242998fbc502ede5c38d"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/FirebaseAppDistribution.xcframework.zip",
      checksum: "3e9123b8e61dce199d9055bf75be7f49958a3f098940afbd1ee971f64849fa20"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/FirebaseAuth.xcframework.zip",
      checksum: "7287660d13378e2b97afc6e61a834c9ac74236ae4e18b329a4bf14886fe6837d"
    ),
    .binaryTarget(
      name: "FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/FirebaseAuthInterop.xcframework.zip",
      checksum: "e79e09efaaa5fe4a04f0041d7f333e422d1c8b6c860a14853871d5d3bc480d11"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/FirebaseCore.xcframework.zip",
      checksum: "ebbb1811dff9158d6e8f539ede4b77fd9d2813191a2ba1c47b1d2c6020ed7e99"
    ),
    .binaryTarget(
      name: "FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/FirebaseCoreExtension.xcframework.zip",
      checksum: "e9e7649a31f69aad1ae1c0d33675aae808bfed1b62f9d2917d40e9fbc4830dac"
    ),
    .binaryTarget(
      name: "FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/FirebaseCoreInternal.xcframework.zip",
      checksum: "af64c5727e2f7da9f2369a473b92f3e6e8afe9b0d4cd31609ed7c44c6d1d5e89"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/FirebaseCrashlytics.xcframework.zip",
      checksum: "855e90a6dd809c928e8cd43f3b4cdcb5f4021177c43c95f6cfed34ed2ccdc268"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/FirebaseDatabase.xcframework.zip",
      checksum: "864bff92273ed37fed680e76d619c99d114874722d8b6507ff6ca1e9f3d7a4a2"
    ),
    .binaryTarget(
      name: "FirebaseDatabaseSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/FirebaseDatabaseSwift.xcframework.zip",
      checksum: "0f9fd80e1dd36f5d7ca0851d923bbbd8927aeb39fcfefe9563089b755d67fdab"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/FirebaseDynamicLinks.xcframework.zip",
      checksum: "e472e3882bf5c024d0e9b1ef1592dd5c926a9176de9a0f68ad4981de8f6e42db"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/FirebaseFirestore.xcframework.zip",
      checksum: "46875ad23c26ea423ca2da639a069c69247cc52e5d9d2fa334f15441c2705873"
    ),
    .binaryTarget(
      name: "FirebaseFirestoreSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/FirebaseFirestoreSwift.xcframework.zip",
      checksum: "92dd7e5735efbc13d4d6309383968bdc6c1abc3ac8107cb2d4884328b6263082"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/FirebaseFunctions.xcframework.zip",
      checksum: "a5b75ce0f4da66fa420d89408e1acd361c6fbbb7021026381cdbb7330141b7c5"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/FirebaseInAppMessaging.xcframework.zip",
      checksum: "317f1d32b5c4d83e3d928b480a86ed4c285d34989cc580fead969cb5ce0e52ff"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessagingSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "3c6e2b6325491d06e662be1231b539f5826890e3fbf36ec6fa7620d03261fe92"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/FirebaseInstallations.xcframework.zip",
      checksum: "8534db38f950d6f02114bb72cf46d4cfce6696365f158fc20d9442463884f0eb"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "30f121daea2fc71db9bb050d5baf672a7e567106ef7268ebaa246e5077e9013a"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/FirebaseMessaging.xcframework.zip",
      checksum: "8eef1d272dad74f05428ec95cb9630598c94c2219df695e31290f1f0995800bb"
    ),
    .binaryTarget(
      name: "FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/FirebaseMessagingInterop.xcframework.zip",
      checksum: "e68a44cf8794f6311dab67b55a25f58ee81de52e5f8b9e7df859e74d1171c931"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/FirebasePerformance.xcframework.zip",
      checksum: "125f7370a6912989dc8907292be7db3ccd9432f17d8324ba361f1fa0808965ce"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/FirebaseRemoteConfig.xcframework.zip",
      checksum: "aac6c876fadd8ae7c5a3bbf74a37207faadddb89b2c15ddaa7ac0f3bdc2a5668"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfigSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "1016458c05fff619c6ae62f7daab886fa04c20765069bfbd061186c8a0f866bb"
    ),
    .binaryTarget(
      name: "FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/FirebaseSharedSwift.xcframework.zip",
      checksum: "2528cbcbe7bd6c5c457e00e0f8fa10afe9acea427f63cd62286f3168d3e181b2"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/FirebaseStorage.xcframework.zip",
      checksum: "dba4cfb13819459051f1d20937c8acb74210b8250771e434e5e15f78e13b1db1"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/GTMAppAuth.xcframework.zip",
      checksum: "c35d5ae07ab124e28089105adf23c9f0971aeb94723089477139d813f84614b5"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/GTMSessionFetcher.xcframework.zip",
      checksum: "538cf481b3e2d86dd7e4772ff1b3969d34ff8e34519212b3091a402182971f04"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/GoogleAppMeasurement.xcframework.zip",
      checksum: "fe7107cc30472a8beed07530faf95ad5b52252d0f8792061dfe8781a1a924a5a"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "70af5ee1eb11fa44c97a74ca4de02675c02baf0e5050f87396b65dec61b646f6"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "c5f03465e98f7be45fb773e5541540c53dada8e1a0060f3c9601e7aecffff48c"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/GoogleDataTransport.xcframework.zip",
      checksum: "5dcbd82fbf2670b5c50620a42dbf7f3f0364b61b48314cfb00522391aad2d2f9"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/GoogleMobileAds.xcframework.zip",
      checksum: "9860c5ea539a7fdd8af45fd4a1446b56e31d1db727f0e398bfc89aed69dfdd6d"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/GoogleSignIn.xcframework.zip",
      checksum: "4177ecdaa5feb0c68ce5fbf992819443d6a873cc4c560e3e677bf13524a7a8f8"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/GoogleUtilities.xcframework.zip",
      checksum: "6c082f3579c25ed1bbae2a30bc36a4f6957d659b61e2c53d5539df4bb1af5d16"
    ),
    .binaryTarget(
      name: "Libuv-gRPC",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/Libuv-gRPC.xcframework.zip",
      checksum: "825d47789cf733914ae3c3f859ffe63787afb5ad788fb84ec2f60dd2263e867e"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/SwiftProtobuf.xcframework.zip",
      checksum: "5934e6d8cd4655cf9d7f44dc406265d1dbc70577eabfe83c31581a8ee40773b9"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/UserMessagingPlatform.xcframework.zip",
      checksum: "7cbee2d11485f3e27e7e4c787c0e17e96c18b9ad9cb1953b1b4b9809194956df"
    ),
    .binaryTarget(
      name: "abseil",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/abseil.xcframework.zip",
      checksum: "00453e33aaaadbcfcb990502640ca5b61acb492d7ffda7b6bd6debda9ac54b54"
    ),
    .binaryTarget(
      name: "gRPC-C++",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/gRPC-C++.xcframework.zip",
      checksum: "e56ca17b34ecd266cc48f62ec5b389e60ae4ae18690abad527a87208304f8e90"
    ),
    .binaryTarget(
      name: "gRPC-Core",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/gRPC-Core.xcframework.zip",
      checksum: "7ed8dcdbfd67f7229b8f8d6e6fe4f3291f4f772ad653d88dfeccd3ed2c6c86a4"
    ),
    .binaryTarget(
      name: "leveldb-library",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/leveldb-library.xcframework.zip",
      checksum: "f3d9ea73f54384685941fa21593bf3da1f1aa7d89fc16c03079111df67a8e375"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/nanopb.xcframework.zip",
      checksum: "d94cdec53774c180d16c03aecec9dcb31f48977efcdf361067372abe53f9b00b"
    )
  ]
)
    
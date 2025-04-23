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
      name: "FirebaseAnalyticsTarget",
      dependencies: [
        "Firebase",
        "_FBLPromises",
        "_FirebaseAnalytics",
        "_FirebaseCore",
        "_FirebaseCoreInternal",
        "_FirebaseInstallations",
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
        "_FirebaseAppCheckInterop",
        "_FirebaseCoreExtension",
        "_FirebaseFirestore",
        "_FirebaseFirestoreInternal",
        "_FirebaseSharedSwift",
        "_absl",
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
        .target(name: "_GTMAppAuth", condition: .when(platforms: [.iOS])),
        "_GTMSessionFetcher",
        .target(name: "_GoogleSignIn", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_AppAuth.xcframework.zip",
      checksum: "16286b7a6370f9ba07e185053a7c4c0246fb77130b5c859339d0fceed369123b"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_AppCheckCore.xcframework.zip",
      checksum: "a1579d12535b1ad4089922526a10da19234525e2560d7c701cde9e922bcd1cc0"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FBLPromises.xcframework.zip",
      checksum: "e135434b581fcbef90491027af22b34ac1ecd7266e0c3a0d79e49372df6aa44a"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseABTesting.xcframework.zip",
      checksum: "03e09aab9af68ea7e935bcd59effad34b8c8cdd7e4f284a523d753c67a9bbaa3"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "0c68a60324fb7500727339778ac583075b816bfd7e429a83dbeae5d0dc01f741"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "5d2a6ad1b5647f5de62182923bfd6c283eeac6548a74c0865bd2e900d45f6b86"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "754f776ee7bcda57e9a19f2518b4722fc5761bca14c17bd264c8942d839e2d24"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "0ccf2cdb956dcbb0e1ceb2f3cc0318d9327cb990d4550e22b0ce9cc7922b339a"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "c5a3c511a11014e44371296a0cf2056c5ae194610a206fb25cfc0cba2a5b7648"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseAuth.xcframework.zip",
      checksum: "58e698d7f8de2d42db22a1b1e85ead52f5c7a00fc2f6c52de95eaa99cfc3a661"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "f9559b4a58388eecd40bc6ce4a32c985e009cd8ca7bdb666ce296b17c36a32f7"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseCore.xcframework.zip",
      checksum: "c18b10226a61e6f1a68404e9196e0e300f28a7e4a50d8e36dd471646a10ca9e3"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "641ef735eb09e7457ea7b9120e774e5a7b0eebf5aec78d3d3976e15c59d4e6dc"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "aafacaee46d0bdbf9f18ce88031e2387b66a0166d8c5f0abd3f064098a24a00c"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "ae2b03e582e592ad94ffb706170370d244f60745dba5ff09c6b9d824602aab13"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseDatabase.xcframework.zip",
      checksum: "970a776a9eebc782669e9c162ba51e20644a9b8966b352dd3389b724b97b8c75"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "48d2c4387ada1783b8418d8d3b0746ae1d1743e6262418b40e6a7e2441d4532a"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseFirestore.xcframework.zip",
      checksum: "55bc666513dd91c3d94ba407c0edd238d03dc708776ab224521887116799d8e8"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "064ea3850a432df9652935f2b67f35ee800e1d86bbae50dc4c4ff5b4c6d4c181"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseFunctions.xcframework.zip",
      checksum: "e6f26be9ca050622f2c415b13fbd6a119b8af9ee75dac0e3091a6687435a564d"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "2b3612704fcb5341f172d6ad25f44163b3deed87fc5818bc24814480e76e6932"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseInstallations.xcframework.zip",
      checksum: "3d2dc4b3cfddcffff659896aa329f61d0e5cdb1d83a5083faf1cf05b8ab5c1a4"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "5d7b821e478e5e4e49a3bf8563b14f06f8816d46e1bc7530945b0f339c52604d"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseMessaging.xcframework.zip",
      checksum: "0f19865b1c94ab9116f61fe76eb9b729bf05db7119d4c4e675ef20d111be9082"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "13bf4554a24109ba250ca497c95eb384b68da586a55ad694b614e9f64034d648"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebasePerformance.xcframework.zip",
      checksum: "68f344c027c9bfa0cb903ea3055d03e4c357f73fd90f578c7345379d6c848f6c"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "1cb8b3cec51c35c98a2e67252cb1a2f3c81f343678254c23602d273e6a574b5b"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "8e1e49d2c2a09b5746accfe5800c0fceb0cc88bcd197c38995114524b1e7b55d"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseSessions.xcframework.zip",
      checksum: "e5cbd3828f852ec3977f154b269af7f09419cbb9476ec047aa56b60be0cb0dc3"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "23595443621c11f8789e5226b6e1a8500287ba111e13deb2b10d7b2f74895e60"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseStorage.xcframework.zip",
      checksum: "1e10f36ee1eb06fb0f756eade147852af7261d236bc4d6373afbbdbb71a72437"
    ),
    .binaryTarget(
      name: "_FirebaseVertexAI",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseVertexAI.xcframework.zip",
      checksum: "f91b76ca516ed44cb54354dc51c995c1032b5b0c5ef37abbd60ce70c2b85800a"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_GTMAppAuth.xcframework.zip",
      checksum: "57640b499545ca0e73df2c7e3bcfb75df62ca828be56d8e66b459f8b6d2d8382"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "2f7b68469d26f34d017fa0f6a71363ca6713ed61fb91367a85c053cc938e480c"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "09944e0bedf3e8c3cf2ccfe62ab5aab8ec33f9c0aef4e3564a633317953edd41"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "7b54fa8d6405fe93e54af1adce6990b9be638d354c2c0a6bb9c94f8f6174c18c"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "46012621b51fc75deb2961ea06e7dbcf6e89875f9c2512cd11a5e2774386ba35"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_GoogleDataTransport.xcframework.zip",
      checksum: "b4ae7a83db38d927056b3a12614d7e2ae80d96ef6f59943ac4ffe4488d0073bc"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_GoogleMobileAds.xcframework.zip",
      checksum: "4784bda9de54a06e9fba6163f6b636757d6fbe83b292262249f585208daa58b1"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_GoogleSignIn.xcframework.zip",
      checksum: "d983446c5b0278a188025eafd34e48bf27186515e0b46cfe61cdbdf3f1c96e3e"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_GoogleUtilities.xcframework.zip",
      checksum: "eb4de56202b2faac18f6b8c75239c20f260bbdc6afaa269712ab90f7a0a18c51"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_Promises.xcframework.zip",
      checksum: "562edb7299baf490fc9b31542eeb3f88f8335afdcea9cd048113ceaaa8717fe2"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_RecaptchaInterop.xcframework.zip",
      checksum: "365ca33cd2b67e660450d83b1d95934f5722190d4d5b3fcfd66a70743d3918f1"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_SwiftProtobuf.xcframework.zip",
      checksum: "c2142989cfb2b44c7f44cbed7573c52f21c13977e8be59ed248380121792cf2c"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "3b5a19b73f829339ae6d69a66a952f16a047d126ebabcd4a62b65ee89fc876ee"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_absl.xcframework.zip",
      checksum: "171ded75e74f89819d9b065ba4a5e4fdb813f0c751b530694fa4c9ade2e4586c"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_grpc.xcframework.zip",
      checksum: "234eb68c026884ac7f17f9d2ab2e19135d451f3e9c933950484dd82a06126845"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_grpcpp.xcframework.zip",
      checksum: "1f9c311f4a109913c98fab17408feaccf5b4372aad1080353db0b130347f11b5"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_leveldb.xcframework.zip",
      checksum: "f980a29ddee61047faabef36df4377a3b901781be13e51ff07265ea455d3300b"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_nanopb.xcframework.zip",
      checksum: "86774f7579ac6043c2f7274a0dc86d61d832504fb62be544d5c55c9e77b917d3"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_openssl_grpc.xcframework.zip",
      checksum: "3dc59fbfc824d4fe34c55d073989b185fc41954102fac75083a729a3276e5912"
    )
  ]
)
    
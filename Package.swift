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
      name: "FirebaseAILogic",
      targets: ["FirebaseAILogicTarget"]
    ),
    .library(
      name: "FirebaseAnalytics",
      targets: ["FirebaseAnalyticsTarget"]
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
      name: "FirebaseMessaging",
      targets: ["FirebaseMessagingTarget"]
    ),
    .library(
      name: "FirebaseMLModelDownloader",
      targets: ["FirebaseMLModelDownloaderTarget"]
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
      name: "FirebaseAILogicTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAILogic",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension"
      ],
      path: "Sources/FirebaseAILogic"
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
        .target(name: "_GoogleAdsOnDeviceConversion", condition: .when(platforms: [.iOS])),
        "_GoogleAppMeasurement",
        "_GoogleAppMeasurementIdentitySupport",
        "_GoogleUtilities",
        "_nanopb"
      ],
      path: "Sources/FirebaseAnalytics"
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
      name: "FirebaseFirestoreTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_absl",
        "_FirebaseAppCheckInterop",
        "_FirebaseCoreExtension",
        "_FirebaseFirestore",
        "_FirebaseFirestoreInternal",
        "_FirebaseSharedSwift",
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
      name: "FirebaseMLModelDownloaderTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseCoreExtension",
        "_FirebaseMLModelDownloader"
      ],
      path: "Sources/FirebaseMLModelDownloader"
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
      name: "GoogleSignInTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_AppAuth", condition: .when(platforms: [.iOS])),
        "_AppCheckCore",
        .target(name: "_GoogleSignIn", condition: .when(platforms: [.iOS])),
        .target(name: "_GTMAppAuth", condition: .when(platforms: [.iOS])),
        "_GTMSessionFetcher"
      ],
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_absl.xcframework.zip",
      checksum: "a771ed53f871553f4d68fcfbb154d351d7e7173f3cd4bc64909d1e46e8ed73b9"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_AppAuth.xcframework.zip",
      checksum: "6395b344adce2fba03d07362a7a226583198cf655c28117bafdcc5d6b17a9a44"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_AppCheckCore.xcframework.zip",
      checksum: "03630616e82bf6c103959afe91bb1128ab41ca428458d44555f9fd4949cb199e"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FBLPromises.xcframework.zip",
      checksum: "bd426bafcb539a3c0087a83b62443f230936ef2968b34c8721489169f5c383ec"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseABTesting.xcframework.zip",
      checksum: "9a67fc8b4ea2ec077dfa2baf3a895b3b2cb3936a10a9891a71dc61c4bc6f0e5f"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseAILogic.xcframework.zip",
      checksum: "5e0d392b6472faec137502b023c4158339262f261f53aa40f25859dab43d651c"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "1ed2f52837fd82fd0af441a676d027e54bc42b2040789fbcc07ac577192b58e5"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "dcbb26b122001cb173cbe014221ec318cdaff6d3249127e4f6f6b1d2bba92b63"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "2b9b7d9eb3d9ffc55209e801603e8ea6530b09135e263a754a14a42741b9c4cf"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "b825c9b13c6cf28d051899abc19e49a0b28120d6c110e8a5e70e0a8ae82f6a50"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseAuth.xcframework.zip",
      checksum: "6e5a69fc523eee6917793a398565cab7689300cb25fd3207a747e0bb3245f105"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "74b5b4d00cf186430e6480a219f311f2a0e3275594f11e225b86ac91f3802b56"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseCore.xcframework.zip",
      checksum: "be854cf7e7ac2d1da907d07bd9bc250d2f4858286feeccd9468f2dd4040678b2"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "292f9a555c18f0552337cc4ae67d8f91cf72ea2a69c8320f5aca232613df0fe5"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "c5e5621d3985b9f48fd917dc517f04882819530dbbe94999519f58acfb9d3b1d"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "870cf877a46233b28556a0b0bbed9bb0535a040988b2d3129d843984d8990ee9"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseDatabase.xcframework.zip",
      checksum: "4776deb75547c54b5e2021b3c7069260662e78b4a772888558afec04ec93e766"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseFirestore.xcframework.zip",
      checksum: "cd7c1348087f3f61b4de01e5070ac77293acd7c3240f5f948651ace178b7f3a0"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "7f48cdab16e7535237279d56a277b257dd154361b1771a0a5402d83817109d23"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseFunctions.xcframework.zip",
      checksum: "09cf7edd3306a3a0aa80b7f31cd831b916cbf71dedec773f59fd1b7c9a8c2ed6"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "8aad14fe51fcb322719668a7e186e849357bb4f698afd66dfc328f44c30843b6"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseInstallations.xcframework.zip",
      checksum: "a36897a2d10af695e3497037584a9264e550c594573f520cd3666d2833eaf1bc"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseMessaging.xcframework.zip",
      checksum: "8082d1b4d43cd0310f6b3c9510708736aa4b7dc8b7cf3798c52d0a5b09157cbb"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "4f395071d560870473b7af41c83ca3d3b092cb2e25fc523d93a3cc7a3b60d92f"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "3951a5ab1e7147149c72b400c9d5f343c3388961d6283bfbd40be5c482142165"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebasePerformance.xcframework.zip",
      checksum: "539086c31fdf4e18b9e8b705a87a9d91fd7053aa0270e5bfce8cb3be826283ec"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "8d1c8208e6868f0192d4e5e46f881923bc13e4d648ffba8eecd52c13ef09c304"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "cc1735595460251c78791b0b25bf9046442f19a3cacfdc8454f6d31504e2d36c"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseSessions.xcframework.zip",
      checksum: "fcb109a532a08ff1950df1f6770663ceb77068f314b8af5b2bba0f5d9b3a59ee"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "d8f0239a163f62592f0f9b0bf41b9d27e7cdc96f13f83ec7c83b9caf491dbf67"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseStorage.xcframework.zip",
      checksum: "44400f195a3956e8603b7499afb584b63644658f2459837fd150da5e0d4eb6da"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "44531c07bee6093d93280534d804f78792ee1b597ece9449fd26fbb9a6557be8"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "f743ea01dca0cf4b1e1ccda32022acd8bc07f9a14bdffd79060a269dcf21bcd2"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "8e2e1802edb1fd35a151e2c80ca58cb4f5ef3d2df89c8ab66f4ef722d9508fca"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_GoogleDataTransport.xcframework.zip",
      checksum: "4995bbde05112758c7e863ac369251d0c8c9e79fb6ef2019f7c96fd571a444ab"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_GoogleSignIn.xcframework.zip",
      checksum: "5e6528b66d2942f4c54e338818d4ec302573c7f27c058c89f3dfadd99194a74f"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_GoogleUtilities.xcframework.zip",
      checksum: "98714fab0c8037d577a07b1a4dda81a5ebfe83f7382e80b020a6c9058a2a8155"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_grpc.xcframework.zip",
      checksum: "9c191159d1cef8c9dd0542a6445f00e006f41544410183c4d83a5cdaccd20e5e"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_grpcpp.xcframework.zip",
      checksum: "d4e846b5fa4268752fcf6aadfa00af247957d471c991cb799404dd1fc0ee83bf"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_GTMAppAuth.xcframework.zip",
      checksum: "4c9fcc74c7eadbbbd930ad84c1b245dffeafedcfa535a4bf737ec04d2ac71e2d"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "68d9e4d857cb7f8e99acbf050bcc9f6f2b4f2dc8d95ab13b247ad3f48ae6353c"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_leveldb.xcframework.zip",
      checksum: "642fd9e91b49646959172682d63cb358159c9f45e5cdfdb693e1f73b25adc4e1"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_nanopb.xcframework.zip",
      checksum: "4f7fe9dbb16daa180d33e15182e58b5f624449d5ff465f6d6ca71fefae965524"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_openssl_grpc.xcframework.zip",
      checksum: "25bca49bcb97050674e6be034fff6ea7d12bc5449f71e0e5e54cccd61cff8030"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_Promises.xcframework.zip",
      checksum: "7d778c17857fe57267ebf29ee81eaa3719447c74430fc88c74f63e90ed749173"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_RecaptchaInterop.xcframework.zip",
      checksum: "82dea1c04d1b60cd1e63b80f9f75176b5f5f6bf4c3834a3ef918f60b192d7257"
    )
  ]
)
    
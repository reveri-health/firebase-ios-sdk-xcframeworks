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
        "_AppCheckCore",
        "_FirebaseAILogic",
        "_FirebaseAppCheck",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        "_Promises",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
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
        "_FirebaseAppCheckInterop",
        "_Promises",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
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
        "_GTMSessionFetcher",
        "_Promises",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_absl.xcframework.zip",
      checksum: "01d943c0bb4349d2657313ebde3480b5d99612693c7760dd19bf228566e0f478"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_AppAuth.xcframework.zip",
      checksum: "4e928effb3a61dfcc7baa6fd320d7006d73ffee24466bb6ffe723708478024ad"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_AppCheckCore.xcframework.zip",
      checksum: "47db35cf05cfd18171eb7e56dd317b608ee7cc37704358a1ad62e2b4101b3844"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FBLPromises.xcframework.zip",
      checksum: "058d4d91495264ad780062d01328462f529196da4e5a05040b797418d4da17f2"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseABTesting.xcframework.zip",
      checksum: "087266885ad58a95bc11409db938e5ef4f2779658eb1e6a7f2ca336204244ffe"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseAILogic.xcframework.zip",
      checksum: "2ada42bd10a2e687a826e0e1fc9d10bc0cfa2875f7ddc591b6a17cee907d2fe4"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "9aa93b099a9e092a4998eb289beb33c57114c8f2e47f4f35777edaf6cc088aef"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "fe46a37d3fc93596a4416447c1d285b3efd86a732295e32487cfc37391157058"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "28a3bd7b8f647a92ec2db8cc2d8d6f540cb8aa0db24fa7dece178f49956c4e8c"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "c5d661b209f4910572f0a9e9e3eaeed5153baf3023388a65765eb45880a43524"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseAuth.xcframework.zip",
      checksum: "b6a2ca3d2e88c5caa6c2ca58ab74f2925810d5230024f8e677a30056139e385e"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "6b57a03613a04d8fd269638df0d7ddbddeb8210a4e6492e4d57671014154bb37"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseCore.xcframework.zip",
      checksum: "75ac620ce0bce1dada9b96a9973a4b9fa055f3c3891ef244a021142f56fbe821"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "5413abbc2cf262f01f722a4c710a3166f7d235fa330a58c97bd7b7f4b8d2bf1a"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "67c3c9132a4091f6c5b4195ca6907d02a79fbca026eeee563bf9bc3d4d219c01"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "3c4cf42261565969198792fb2f4b62579168959f8d5fe13e671c82f5b6773b85"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseDatabase.xcframework.zip",
      checksum: "a557f9b19e99b180714898f7b470c24f4ca16e291cf9700d40ba62c96c2d4a52"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseFirestore.xcframework.zip",
      checksum: "6f91bbda5fecd1d51230f3e42e684b92c77a6f48c0322d014138f7dd8dbb63c5"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "7b2f2e1f1dcf5885f084139273fa5c16570ffce194ea49c6ac2b4618fb2db377"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseFunctions.xcframework.zip",
      checksum: "239743c800e14f46428eb4a5b0d5c28480373a6de0807da565d14f0e5f245bca"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "3f0b6ed32bc6da97b51a7454ffb80768626d14f85a69ed819a8adad755a796a8"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseInstallations.xcframework.zip",
      checksum: "476df497a47c084d372b85714f658b62deb03540d385c735ee2fa966d3d925b0"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseMessaging.xcframework.zip",
      checksum: "eb54830255e24c3440eca432bcc842ff892ac6023cac08653885b177b8b23b13"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "f0bb4a5205cfdcd9368aea8de90248c16ecaa261837be44875f08943f7b6f10e"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "b5b43c2da41d1809a1da339b9ee5bc949a8e02ce14c9dd1f351a0e837bf13ca6"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebasePerformance.xcframework.zip",
      checksum: "b0dc48ec784d9170b33388240fa41b1e3771db8c403866b91ee5724fa8e33994"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "5bf745cdbbf6753df58012e17eb68e4502d908f4c1be1cfc57b35983e3d41332"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "2dcc29029b9e1e6b504dabd4174111f8e6a18d30c2af3c0ed5507d27a57602d4"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseSessions.xcframework.zip",
      checksum: "2f3d739c6fd00180bba26159db20412c49ef1ea8d774b3ee156df17edc22613c"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "d3b52d058026571373afcf6dbe2275b89d09641e6051a0338b649619a8949679"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseStorage.xcframework.zip",
      checksum: "eba4d3ecfbe5e251d5f2afb7514c51958d2b1aea4e7cf2122c7d995c73dd0b34"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "f32b2f063de63e50cc4ed360a56c223d75bdd64b38309450c77b254d74370315"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "01a5f1779335c41a3d5eeca830da9fa2de6fdc2df94b7b4b50e6916ebaca1215"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "f252821d45185add8e6fa4cefa150ffe1cedf53760668bb7f5aaa52b01ae8087"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_GoogleDataTransport.xcframework.zip",
      checksum: "5eb369bb63903a15b1cc09440cceceb84c59159e75d50be2299264bc0c6efc78"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_GoogleSignIn.xcframework.zip",
      checksum: "f481d306f77de9780a969e4f51aa0b9fd048c407a66649f3a5ac40332e4fe164"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_GoogleUtilities.xcframework.zip",
      checksum: "a4fc754c4b6e35e65304110a33baaf1c8a2e34496537b440b03e0622b31b2318"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_grpc.xcframework.zip",
      checksum: "2b0ec395f82df623992800443eacc1721999a93b76188c9942400da7cdaf6727"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_grpcpp.xcframework.zip",
      checksum: "bf53b2ac39a96511c3d8489101751768846a83252aaaf2ae9372732762ef33fc"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_GTMAppAuth.xcframework.zip",
      checksum: "875913bcae27b36be0c5945868b10baf963b2f7562c308f098db6048d5301084"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "470fda1448a133167019a3915a9920dd6f548b902964e40b9aa2f4f82e2d6c09"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_leveldb.xcframework.zip",
      checksum: "4ae18a20e7ceb17a41833aa98ef0bfa7508d64eef95b174acf2592b13444a4c7"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_nanopb.xcframework.zip",
      checksum: "dcb08b701ffa10806f26160821160c13b9ddd31b18c2563d789aaa55accdd6da"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_openssl_grpc.xcframework.zip",
      checksum: "35f093ecee281a6f08aa8f7787aa0bc7f3fce7316836dace21cccbef809078a1"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_Promises.xcframework.zip",
      checksum: "32cff8bd49d11485e5f45dba1893fffa6899f95f3b99bef2c7e4792a1536ded4"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_RecaptchaInterop.xcframework.zip",
      checksum: "4646d081b844193fc28a5030df52d2ec9504070ee28b88076cdcdfb4351072cc"
    )
  ]
)
    
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
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_absl.xcframework.zip",
      checksum: "a9b4f04220642c88eb721adc1ed298933866b8690b09fb4503f53b1630615cad"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_AppAuth.xcframework.zip",
      checksum: "e9b757b221b3def2ff6c960f2ab52f3f55bcc1c3736c18f0d7b4cf3fd5a15045"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_AppCheckCore.xcframework.zip",
      checksum: "3ab574b2c826673fea85f1ce6ad14313ce7f6bc788a3d66bf6519e2d9776054a"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FBLPromises.xcframework.zip",
      checksum: "d24b7f22a85e1d9e0493d7ea29f95546c92beaa24cc5f0af1747cdcd98f3b7d8"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseABTesting.xcframework.zip",
      checksum: "afafafb01311dc323f5a6519f7f9257959eada75cd9a34bbe59da68256b52522"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseAILogic.xcframework.zip",
      checksum: "5428c5c095b3c555667eacb00d201966ce02a1f6cfffdb2dfdaacd7f2bb45d9d"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "f0b07a04eec926e15e2a064946d8daf5938692e0669cf86c515fdcb1421732cf"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "86754312262acdda7c10a303dcf68cf58e976b50c414cbd7b7a72f7d4ee807fc"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "a1ba779f90cbee9e0da9c0bde6a51f23b17c41d2a0b921c70c3553c7c6ebe78b"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "5bf085590d5e402a34f17583cd26eb53db8882068cdf7f9da264d6b5ad00338f"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseAuth.xcframework.zip",
      checksum: "5f20cbcda66e850577ff96dcec7e596ddc49c80c9b071292a38aade3fb0dd3bd"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "3197cfb0060a47d026deefc17e7a85b4b6fa910751cc447b8697724f284b7780"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseCore.xcframework.zip",
      checksum: "b6c3d73619b28abb10dac9f9d4a82cf8e724fa3b5aa7347bd6e22126c810077e"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "34342256089774c154ba6a757ad9badb80a503868b43bb7741f3b82df2bea703"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "7e54761ebf8d7af124eda44fdcabf29115f8bbf58094c89887ae97903b70b06a"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "bd511a788ed53074aa5560e944832b16cc9a5de8c4f12901fd342bd982a23331"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseDatabase.xcframework.zip",
      checksum: "380c6ccf1cba298412d2b447172c89e7ead2d922bd58d6a757b63113f893b335"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseFirestore.xcframework.zip",
      checksum: "817a6004566216294a60bcea58e88f90ec0097db31cadb2c596169c77a6f0c8b"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "41aac904d7ac0787377078fc9ea51b13cba4d0621982ddf6d260316ac0e9f6b3"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseFunctions.xcframework.zip",
      checksum: "af83d9d8dc1923d4845d52512cbc3a182255029dc41296fb4e51dc46f9700bf2"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "72855cf643b02b4d5a71e5f720e24b85ba4bf8b477d16d016441f0cfcc003d9b"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseInstallations.xcframework.zip",
      checksum: "06e6ce277e4d19179e0b5a9b9e4e827c6130f9d6901d4c4f1521de9edf238c89"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseMessaging.xcframework.zip",
      checksum: "be17bce12628b624a5085b00aa56c5ecd4bfe16d5bbfba215c3641782c832bc4"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "1ced4847783a95ec03e65ce3e01d062fdd9b2f7d0a6366a5273629b726f5729c"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "fad2b785734273cabf9173e44a210c555b3e85f31337bbec5838effd5290eee7"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebasePerformance.xcframework.zip",
      checksum: "cfb8762bf88576f668d6cc7e679263da3146d6973bb5ecb3b3851927d40d9e3d"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "62e7d4eca9d912155bbaf5364792652642fbb938eb095c1dd5b595275bc5561f"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "f67c25decbf69a4cd3994f27584a20aa05e6205582e7972bf174b43d62cd4507"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseSessions.xcframework.zip",
      checksum: "b9269fb4c05d956b1159423613cd64088d89200db5b960cf8cb4d87e37173a84"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "d7053cf0fa625b071688c83fca3e96e7b89327a8ada39122f61427a5b8a3e98d"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseStorage.xcframework.zip",
      checksum: "356ccc27c3b0bfddffb2896ba5e85ccfb628c5db909b7ba012d5c49fdbb3174b"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "619f8db9178d0acc59dab0cb8966d74291a1306360b2840370f98caca2609997"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "70b1e551009c43e7681194379f5b56cefc22cbfdd2b506ac71936b0609cddb8e"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "f224db59232b0e3e4c076ea17dfa855ea0f4cfa2a2ea92646abd1c3996982993"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_GoogleDataTransport.xcframework.zip",
      checksum: "9691e5d8daaf4d319afda979cc6e9c238ccd5339605d0c329db0d3db799a95ba"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_GoogleSignIn.xcframework.zip",
      checksum: "384bbb175fbe78d75d6c3d931c809d1695e3fcab3811d966e8c390809afb4df1"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_GoogleUtilities.xcframework.zip",
      checksum: "0864459cb8e995902b0fc0609f35e16a9cd28c6024da122fabbb262739521d06"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_grpc.xcframework.zip",
      checksum: "aebae4871b94463c0fd3f4fbd907b7e3d9c788ece53fd4333dfcd53cecc97c15"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_grpcpp.xcframework.zip",
      checksum: "d8e63b95bd3f8c5220655ef86924d24526067f7c26f4985532343d368bb14f04"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_GTMAppAuth.xcframework.zip",
      checksum: "de92861c5910bc8b42188d60b41b3d583abdd37f5ca48f41f489ee2ec1826750"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "a2062d9e2e07d8773fbf9df4ca8a1a63f0544cd58c60f08f98f4006901b676bf"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_leveldb.xcframework.zip",
      checksum: "7eb3ac5aba8d82e31248bc24dabdb9170dbca08896428e362a5f5d170ae5d2ff"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_nanopb.xcframework.zip",
      checksum: "b9c54b31d80d013d870fac5c10303b5944b8e08dbe7bb9ecf03239c01492c34f"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_openssl_grpc.xcframework.zip",
      checksum: "26dac3815be1eca5651f400094d33dacf7bf9ce0384ae283e6e723025b82d424"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_Promises.xcframework.zip",
      checksum: "7ccf8896e0bb5475c66935c1c70ecd3c355dd952e4c15ba02a90b07582fcaec5"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_RecaptchaInterop.xcframework.zip",
      checksum: "8d258a3a89984b053d921916d7d4629f0b86a6fc9385283ba886e40981600587"
    )
  ]
)
    
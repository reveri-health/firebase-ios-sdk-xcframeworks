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
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_absl.xcframework.zip",
      checksum: "18cc6a65695f14b41192623bf56614c564477b6f800663bf44052ae2a85b4c61"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_AppAuth.xcframework.zip",
      checksum: "91e8b1b34479a28788452bbc84644199151cc13870e602905ac76693fb8ba979"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_AppCheckCore.xcframework.zip",
      checksum: "37b8e7871e89ce020968c985816a29d599615b7149f96eb3675f6e510f9ac8c9"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FBLPromises.xcframework.zip",
      checksum: "b6ace76c90cab978c2c867a74aac097d3b6451ebf4ad25b1e0d759c6efd821d1"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseABTesting.xcframework.zip",
      checksum: "61bd3a8d4bd8f784e846830ced74e94c4b6c86de036616e2d946f78ee63232e3"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseAILogic.xcframework.zip",
      checksum: "d70526cf2e425eb70d30529a5b65107eeb79f7153ab91733d0bcb50b8bbc9bb1"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "23375145b9934c70cb8da27a0b50beeddeba94a7114768570c1c4a12fc8fe558"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "8e54dfad8107b318310fc51ff8aaee44e543c0ac504726a439d915911d9ab064"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "9beed9ddd7e91f42bff17d03ff3efaab73f68bb5c923c9ec660d01f5063ff012"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "d33d3d59159430d223e17753a08e4c6a0a63ea12c67f9feecb8569baa2577ecf"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseAuth.xcframework.zip",
      checksum: "7182300832e3b16196ad66cb1eea948c5df6befdeadd4b7c0c288a45e606660f"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "11ef618c54587eaacb7ca12bcc57bebbb2747cbaa5bde84aff28dc77b932c7c4"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseCore.xcframework.zip",
      checksum: "593a4f131eeb98db54b5de88d1a02239ee3c918e28f35f1c0a8cc74f26706467"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "c03187a70de047735f65cc29c699247131e3daac139220ca98cec98f760004d2"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "faf4ff7e2e3bf0425d564dc28645e0ed5842559b5f5b234b028bb999b353dd53"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "ab21b6bbeff4a3f120889711041d91dc8e7b6c85f6dce9b7605cee8c24c8feac"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseDatabase.xcframework.zip",
      checksum: "5a6aae1861c41f4cb7f75db3006b7d24b28819e43dc922e73570b194a14c9541"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseFirestore.xcframework.zip",
      checksum: "31cb1892dfcfc17cf997b7c0ee58a466e11cf10a6f2091feb76be92b31c36382"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "937353c954659eb01bae6136eb6164e644deae1e9647463dca90fd7b3d932d2c"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseFunctions.xcframework.zip",
      checksum: "358ec4cad3f58bf74f8053b1c235bd8ad8b03628800431542c8ea89cd2dd75b8"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "a69ef88522ab356e30b40fa44d0a2de234e9184545368b3220a94ed88b29d00f"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseInstallations.xcframework.zip",
      checksum: "6035d333798da289452d096b0e09680875a0ac2ac0720dd68256d3e07a58d00a"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseMessaging.xcframework.zip",
      checksum: "f91d133edd50df517a58a27b49c72a6a84b42ba9e66a75b4659ea0cd29bf63de"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "0b2a4f7fb9f41347cd4d198108193ff778162005ec9baee7cd2114ce6f129ece"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "48fa8de66d7f45c37af3f3fa25e744067c28c2f8154003a29a4f35656b3f4f6d"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebasePerformance.xcframework.zip",
      checksum: "00f8026d646db05707c5295a940cefb46846fcf4f4eea43ba91fefc121b95a12"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "de20d782f30eb9f5a8505d1464f880e4ce4273d4ff818f1711f625660d7d1ce5"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "6dced8fe23877c53c63ff72feb7065d49ee46c47ea76856fe3c47159be2af3e2"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseSessions.xcframework.zip",
      checksum: "960ade149ee1cad9ed41672e11de37bf34d72cca23110432963934de6a2b2658"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "578afcaf9569e09cd5d0c3720e64dc4d3f889afa3e6808044aca502550ea7bd2"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseStorage.xcframework.zip",
      checksum: "b5d0ff865417812a03154f46ffc60247a8de95adadf9bb05bb7d0209c7fde2a0"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "7517b650021b8527228746a55f7c41c5dfaa8df50db5e1a3bd9aec09246239e2"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "635c4b2e7099d2902511a83fc1b551cb17bfe3c1598509e8de857204951a88a6"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "f6416a0f9e1d645563078612060d21638d167415038e48d25aef94f459480c16"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_GoogleDataTransport.xcframework.zip",
      checksum: "8e9fb38ab357b77068707baf4122f4ea41ea5236074b9edd62069613d87f0860"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_GoogleSignIn.xcframework.zip",
      checksum: "13262eccd7708b53bd6cf4765d7793e4fa3eca1312ba7e0595341c98e1efa149"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_GoogleUtilities.xcframework.zip",
      checksum: "01ccdb903dbc997e146ef87276867cf77a7dfbacdd10aafe070e07a19b788cfb"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_grpc.xcframework.zip",
      checksum: "0d0c244dbe145c509bdb573e018905bb4ee8a07a839074b34933b4cfc32f9f20"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_grpcpp.xcframework.zip",
      checksum: "b66bbb0efda9f877320304b8152a5c00e0ac6da307a13e891b9ffdf75a9e4341"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_GTMAppAuth.xcframework.zip",
      checksum: "a5696f4986109252d9c1b8c73a28c96a43586adbcb9db90e43ea14ea0032f4d3"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "e3adbbc14fa876291b377872f2cd01baf45c6c8a1a8469456e1344ff1e32f85a"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_leveldb.xcframework.zip",
      checksum: "78deb81de231d483b305199e3a9189ef1bcc451db2f400a6fe9825cc55583982"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_nanopb.xcframework.zip",
      checksum: "9d267c9deee9ecd3cc28638fec4b42f2667c732869a409793847a1f0bb99d952"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_openssl_grpc.xcframework.zip",
      checksum: "28e0d4d099083ba671e4a8a746590b885b44605851aff421f3a5973408193c73"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_Promises.xcframework.zip",
      checksum: "dd5a46fcf3e63204692ae5bf805fb4a944c54fd959d552e8daa33b5e2932392a"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_RecaptchaInterop.xcframework.zip",
      checksum: "230ad97f85efe29b8687557f6b8d30b8dc596ae7c7a69eb05bce0ff0eb94deb7"
    )
  ]
)
    
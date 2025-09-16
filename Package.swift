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
      name: "FirebaseAI",
      targets: ["FirebaseAITarget"]
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
      name: "FirebaseAITarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAI",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension"
      ],
      path: "Sources/FirebaseAI"
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
        "_FirebaseMLModelDownloader",
        "_GoogleDataTransport",
        "_SwiftProtobuf"
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
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_absl.xcframework.zip",
      checksum: "3cbe1b61018aa1e016d499a9939d2361e893f6ecd12442bd9e310a9776991c13"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_AppAuth.xcframework.zip",
      checksum: "b941ef5b610fbc14e4b55ab7256e337314d906460af78ac6bbc656e05fe099d7"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_AppCheckCore.xcframework.zip",
      checksum: "e78307e0f3c2b5b7bc264b27d77887e63d6b7aead81d9bf1ef067d3164aae8c9"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FBLPromises.xcframework.zip",
      checksum: "397b2f2f40bbe186f07b622fd4eac89795af66452304caaa4561abb85393c5a8"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseABTesting.xcframework.zip",
      checksum: "e21cd33870a66cf3abffc7ff2cb3418b393c9168223d76c254e22c7240e8627c"
    ),
    .binaryTarget(
      name: "_FirebaseAI",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseAI.xcframework.zip",
      checksum: "5d0a2fc3547cca815f7a2106e321fd74cd2060b9c1980d3387216727bdbe7bbc"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "a0bb8cc03c66ed6ac99a5d682e1cf6061ea9df0d5cd64e62e4ce08b169df22ce"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "28ffc15cca4c3b0eb0be20bbff56cd97a29d2455930a1fdd10cbb2058a823de4"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "72bcdb4fbd7d918e3b24be5955a43009de2b2c06d4e76405d71869daad1c0c57"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "5dbf2ece1410b17e9feeba6f54e23ae554bc7690ff7b659263fff9ac10f658ce"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseAuth.xcframework.zip",
      checksum: "72ae7bca529c8f7345d7bd1e6887f04cab5b14ed7fc7c9034ee394be8b196bb8"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "dceb075547906c9f654901fd27b32b32e20118ced648850e7289931debe35984"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseCore.xcframework.zip",
      checksum: "d3969765da6a549af54c939354e02a2a86f1ee95f78c4994099f584d017091fa"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "a2f4c389cc7e82ea380a39e7d6de2a17e9c726759774697b7d2c35d10adfecb1"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "0b3a63773611e33c89267ae75b94ac61df7a6d4c06f4fe9dfe1fee4d9244c841"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "4b5bcb857d4846ae510db42d347cb683e4ba6826d653f263221fe01badd06d03"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseDatabase.xcframework.zip",
      checksum: "89f96f476e86f028ba933d3b05fbd806104f28827d746cd1183e5a7d77938f93"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseFirestore.xcframework.zip",
      checksum: "926b7dd591bcfd717f0b49c80a1a1764c6067f5e77689825cd7a792fdb85f55a"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "794bd3e392950c544cc39eb56fdeeb1924b540a9a4c4d5605edb816ca0775e2a"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseFunctions.xcframework.zip",
      checksum: "a8983dd295487a64d8980eff0638140082a37eecb4bf2485cbe6c4776cf8f0ff"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "578a61e520cc24e735b73206636b0fab3d114aee093a2c3d8efc714c2ea937ba"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseInstallations.xcframework.zip",
      checksum: "610bb05675a3a4f98a606de48b06f2da444484f3af28334c9ac51951b98e3e2a"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseMessaging.xcframework.zip",
      checksum: "166f040de8c903437a5ef6e1753d978e0710cde615b8971987155de953a22f34"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "bafae9a4819646de4feaba55e304fb75ade4632717dd299ccc88471877ed086c"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "0e5dd12094d5d39ddf9b65de415b701b7ae8908615299a6451cfa34a969d5915"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebasePerformance.xcframework.zip",
      checksum: "068f12e94ca3e21afad470e0020510311e800d2717ddc1bf8bf7559abebb671e"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "452308a727ee912a5a0c2f2756ae25f0050b68b860a0608e6917a7f69306fc54"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "fb687bbfd8585ee1781ef8e2cd79a8acd304d082e8630c572b6116acaab4e74c"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseSessions.xcframework.zip",
      checksum: "50dc3eb7715e8ffa641b928329bc9cfda78c8833978be1ab5efc83263f490575"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "9f2ee101af7c413087d5fb013fe21c8c344d6eb76e7de2f51bfb815e51941393"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseStorage.xcframework.zip",
      checksum: "881b6ab56235053130daed620fece518e52ca7cbba0672e1636ee0eeee0de72f"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "3a3d35a48703b429c7f3f99b582c3224ca57c09c551e22372d798106cf27ba9d"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "0ff73a1c9acc241499b93c6e2341293eb4be985c34456501f72d1c242557360a"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "9ddac7e5be5f081954c891dd92daae7592704d6098d6094861c066bbe82591f9"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_GoogleDataTransport.xcframework.zip",
      checksum: "4845ee65f25038c3e032e17394e5eb158f1ea6fd923f7cf69a162e6012821209"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_GoogleSignIn.xcframework.zip",
      checksum: "b6cbf0176b4e6b70b851bd57fb93940ff77dd42b25c651b4aa84f5e8ebe39e1b"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_GoogleUtilities.xcframework.zip",
      checksum: "23c4342b87ff7ea6d2e211728c3b2b9fef9b8d17c17adf578d82d0f985135f5a"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_grpc.xcframework.zip",
      checksum: "8f209b3d2cf651b7c486281b6ea7801aed098de7c08c45017abe30cded5a7740"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_grpcpp.xcframework.zip",
      checksum: "7b1e9bc35300f500b82b992282209534cc42329a0d78642177d5079bd4fd06ad"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_GTMAppAuth.xcframework.zip",
      checksum: "527fe425cc48bae505028ff19ebced419963e32b149b43cfad9d3dbc5f2a5567"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "f456cbf8d2880cc6b1f60f24ad679bd4af87674e553a9278859cc1a1dcdfc383"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_leveldb.xcframework.zip",
      checksum: "3ef9a9f84c8f885f43c1f0203251de0d3da1b3c41a8119252dfb148b0cf1a89b"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_nanopb.xcframework.zip",
      checksum: "cd4d991012b36cf1400867735e3f66ecb970070302c37b7fd0e1109ec3536a92"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_openssl_grpc.xcframework.zip",
      checksum: "f6ba4832c907915b7cc915a92a84478ba0ec9050d02bea0a5e3f4b4d2030dd0e"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_Promises.xcframework.zip",
      checksum: "e793cdf3733a290e01de2b12ad24b1cc26e181773d015d0a4f2ef673ebaa1e7f"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_RecaptchaInterop.xcframework.zip",
      checksum: "53e73bbb2a2ffa9349c036d4b39b2b8c612a011540d6ad3ac206bb9504bd7380"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_SwiftProtobuf.xcframework.zip",
      checksum: "360b76778222b2f54dea79226534e8f6935852c51c468aa0dbe66ff8d441c435"
    )
  ]
)
    
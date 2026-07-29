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
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_absl.xcframework.zip",
      checksum: "249c806c8c761447835f31e692028349f083f01a52713ee2c8a9c9f7e2c95d78"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_AppAuth.xcframework.zip",
      checksum: "db04f3d4d691f017c65923d086c8269d1f754c25248c246af44f4cf98955d01f"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_AppCheckCore.xcframework.zip",
      checksum: "812006aaf86529661332e66cf10d43a74aebf29191956008c13508ba9c366772"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FBLPromises.xcframework.zip",
      checksum: "222fc56d17866d15fdd2236b254b7a115f6b61bbcbaed5815ca96eebb7082c52"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseABTesting.xcframework.zip",
      checksum: "4fee13cea97f67fc913593fff01a4f76d6dd572899c183564c1ca79b31c912dd"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseAILogic.xcframework.zip",
      checksum: "9df8bd1909a5da567c5d2a73693e6f389396054c98df4eb1b600e073823a705f"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "4342a06cb091b25e6b207846be9d0817a54fd516dc8816635e67252288b75bfe"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "5f36189d0919bb3aa38381de1d1c732555f2be8e672cf756a52509f0007a7cd2"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "9ac77444dd0ba82fde22b5e2124a96971080fdf7afb435d0da27ed6b708f0aa2"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "9e7c310b1f47be2504eb21ac30e6bbd1161d52094c03eac80a8bd7066ee416bf"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseAuth.xcframework.zip",
      checksum: "cd52131c0bb1e01fb279282ed564d8e4b1b7ca926e0ef8e754672396de7969c9"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "64e1417f6a584a2ac1ebc30709d1544ba31523daec6b71fd80c75a156f5fa0ad"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseCore.xcframework.zip",
      checksum: "bedc4fe4cd081e0721c2e1ed34f9747ccf52ffef069e69155ab31b9b3bc5fb3f"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "b7eb6672417c73a32949323f8263a6c7ffc2958661dd0cb1252be7ebb14ad2e1"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "5463c7ab96d857c0f39e6b7dce353d42c840b0c626a6c33bbe983076773ee238"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "d41fce91ad796a1492939c4d2047634e9d33b1103cf803f7e133cf65190ae91c"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseDatabase.xcframework.zip",
      checksum: "30bedd6c9b6507d348ef79fdd400e3514deeec0417d282d9120d7b4da66c8546"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseFirestore.xcframework.zip",
      checksum: "807a092f09b5e866e21271b84a3f89a5ed21615670a718064a0b14686424391d"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "ef0d219dc3fa80f9b6ba84937fe120ffae294bf04fc0edf1b0784cd513f362e6"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseFunctions.xcframework.zip",
      checksum: "f9cecb6d15ed337ba97bd9f57cf1be977cedcb9925f2b1ae90932fef5e279b66"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "01072bdab3623fa0e3e2502a9b65e4d0487332e02e7b464b1a89d36641a62ae3"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseInstallations.xcframework.zip",
      checksum: "e1f3147aa307610274629657f833bd6d8ff7a7513bea2e7be53c7dab45872a3c"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseMessaging.xcframework.zip",
      checksum: "873dbafae69d4b3d0b20177635ff217308377b76177df59b8df9f7b6d485644e"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "0a4ff421129103f58daf7dc1848d064fb24ae518f3b5f49dbcd95dd6b7dc547a"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "16b13e9db6646adbd7208f1a9b14e4a1a63ad7af85c56880088890d5622986c8"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebasePerformance.xcframework.zip",
      checksum: "9e94bf4ceae3fff7bb0510e95e623376452054cba2e9465791883f70717e099f"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "78745d921e94675c0a495192f8600c7a5ec9def27f4771e8ea025a801922847e"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "8e9c8a78f7702995024723d0189955ccc9c5dbbc33d11382fe98d8f376d39dd1"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseSessions.xcframework.zip",
      checksum: "afea0cf13db91512c4e04ee2d69dd3da56f2f4e650c67f88af7a2efc55f65f4c"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "e2c8a4aa4707821c98746e61d833b03047ccd7cb0a8987244db9557968a5ef3a"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseStorage.xcframework.zip",
      checksum: "d5afadec88157a0db23f68a341995e7465ae4a91ae9253c896d8454051ee802d"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "0f088b8a085e62a38b016e33f04d000511deb0e6a0b15ada507cd73512593582"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "b21fa1664b3c741ca875c02856f1004ca361982093c0c711952f51676df3625c"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "94bcd3b0b011d6785ea1cefee1118cda9b49288678de3697342ad61294752e7a"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_GoogleDataTransport.xcframework.zip",
      checksum: "985c4d6252ebd85de1f87b5707e6c1f200975b4d10f64a811bfb1ed3f766bcf3"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_GoogleSignIn.xcframework.zip",
      checksum: "9ac3cd2eb6e46233438fe9ba77fae6b7740ac14c49ebbb524ecdb71998a7e2a2"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_GoogleUtilities.xcframework.zip",
      checksum: "4beb53e5a019680140068bf90ee336d6d7a8694d4a066379f3ca5229778aae36"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_grpc.xcframework.zip",
      checksum: "eea98b176ce1babb08fbbb0b160d76d0e84406f260ef6ccda529723aa4f7cb92"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_grpcpp.xcframework.zip",
      checksum: "8e9aed97d9b0d8117ddecdc61c6ebd37083dbb5c13cdaceafe041717cf17cd7e"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_GTMAppAuth.xcframework.zip",
      checksum: "13245d0875644012597d752be5e33c71ee3658526957a1b540390ffac6b35540"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "1781087084dcb74f47b2be14851d3ab4165158ce92e6522912fcbf37b4c371ac"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_leveldb.xcframework.zip",
      checksum: "ff3ddae7ad4f6d3134eb6aaed41b2259076da581c0659b172f154c9a10f5422c"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_nanopb.xcframework.zip",
      checksum: "447ede9b555a254264b2637a05dbc1c55eab41245cf69ca46cef28cf3dc479eb"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_openssl_grpc.xcframework.zip",
      checksum: "b44cdd773bfed67ddc1acee3a890c6791c3ec5eaf58546ee6ae3b15a6cba9ba5"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_Promises.xcframework.zip",
      checksum: "9767032b675a0514b86bddc8284176279a6406e309894aa34be41882b5bd16d7"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_RecaptchaInterop.xcframework.zip",
      checksum: "e10850ed08a44db78b25654ea8998ce771924db785fdfe6a02fad2d848e1deb8"
    )
  ]
)
    
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
        "_FirebaseAI",
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
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_AppAuth.xcframework.zip",
      checksum: "aff0da215e8d0a3ba357e3b9f4dd532449a38514be4f314674c4052cfe0a5787"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_AppCheckCore.xcframework.zip",
      checksum: "489c4f9ef06bf94c44f635574a7a46c315143783aeff8de1f8f5b63b7c1d8211"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FBLPromises.xcframework.zip",
      checksum: "102a0405d9f88c604f8595e58569ae65a2cb9aa42464eaddc5732db1d249a6f7"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseABTesting.xcframework.zip",
      checksum: "183284520a7178ce1e1f0bffe9b9cc69ceb0f6f36532df2cc9a0ad8cd96d2383"
    ),
    .binaryTarget(
      name: "_FirebaseAI",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseAI.xcframework.zip",
      checksum: "cbd8999169f9f1340abd433b84058742f7f38cd197e5b4e4347557edc4dcc584"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "96c5663e8eaabd4a7aac85e2acd8f9a995a025e5302d6cd48829f76cb9dda940"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "28722db32aa7fb16195b5f6fb070c6057aa637d35d8f2bcc3f1d16a4e1f7f0d8"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "0d299ce8c11533cd7a3eda2b2e5c8c6d69288a87c381481e106d86aa8f539212"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "87540864e7be4613ac2099b53b3de68a8431c2048c90056c5ebcfecddfe9d578"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "d5b91e771e315fd14d9ac3e5430c547384db1c51fd1dcfe24dfdae2a00fcd327"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseAuth.xcframework.zip",
      checksum: "f44d7d843dc0cdea46f44e38c1b8149e18c035046837803f97bbdd1ef5863763"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "b8f872ce3e78ea4637a0b86697356e31e8e2455ba8d74975062179a359458975"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseCore.xcframework.zip",
      checksum: "42dfb23617f20acf25e91de6fec941c49e59318ba9be1e1baa55d3ab65525e96"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "5320c96c0908cda0d1f843b5ca19424422849d35a8d13c76fe52882128aca35c"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "f9fa07cb0110fa7bc12ef0a6c6ae3e20bb75a269d42e1d2d50ea40ddd69b9a2f"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "680a5d26fbc93b5af6e0cbf7f82242745b180744c4830ae0cd2ed20914ae0d34"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseDatabase.xcframework.zip",
      checksum: "59ebe50135565f0007397eb9a303d5f6d1dbe48af2992e45cb323186f9e44c85"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "38ba4135562cffa13feedd521f33b9f84d43c4ae4fc180aa192ab4f9d71c6100"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseFirestore.xcframework.zip",
      checksum: "a5af567f0fc8701a97c966ac142affd66adb7553795ae7d256d3056956b60ace"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "58f9e1f9fae1fa714683d25500f4586c396817252210f9c3d222cd8aea3ce494"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseFunctions.xcframework.zip",
      checksum: "9e99551f7d9128cad5c7faaaba73b5bfe67be6a84e884534a768c6252548c5b4"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "c112c6330153d355b4851539a048e67327fa66099df94d1e4b0125b91b32bf42"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseInstallations.xcframework.zip",
      checksum: "4fada267fe5f0511eb0515f0abd1f7791af8f3272e09ac9b95fe139a5c204450"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "d85f2574c06d431103451dad489698712b19cb508f8ed63809874c8620392520"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseMessaging.xcframework.zip",
      checksum: "b0a81172eacd1fc991f2665310be6621dc9e7065c72e86be1d5d1bb8aaa689df"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "ab81f3bfa9b3a8bfdd458cfe00d051faae4184780f2a19f649fab3802104f2bd"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebasePerformance.xcframework.zip",
      checksum: "d2e059f2a879996b146c17c6bd60a444599ddf2f711ed6efc9b17e1c457c51a7"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "29481633fab9ebc9cb4cda1c781b9d5159aa84d6d9bc2811107b820434481a52"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "305cf29be9c4dd2510beacd12f80d0fc06108f5521f18e33110bf0740fb25381"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseSessions.xcframework.zip",
      checksum: "576a1d5fee16addce1cba4dcca644ecceb58e5f9b99e17c09eb8b826614e56bb"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "3490857c3f4c73d1c24390ceb5ba8fc6955269d2c003ce63e69614ce4eac47dc"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseStorage.xcframework.zip",
      checksum: "3f92416f5da3d3c4c2275364d0b7fa9ef149b9de3b2c60aaeac0c7faea2830bd"
    ),
    .binaryTarget(
      name: "_FirebaseVertexAI",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseVertexAI.xcframework.zip",
      checksum: "d913ee9d7264e493f8a460e24d91666de31be2f5c8483f017c4f4537235d82a0"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_GTMAppAuth.xcframework.zip",
      checksum: "60868fc0bc78d2cfffcee4b0fd2977fdde4ad37a1fb96dfe09b7d129b68381b2"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "b7ca087e50bdb51742cb38496a127652cf53449e7f0fc2aa244bde912d22461c"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "9c50485e20d28cddd835c56cae3586e7450b96707e047fdd67d0d0335fa1ecc5"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "20da09674c7fcf7e44ceeef24925d5e786a6fcdf6daac49f26205307a9f7eddf"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "6b2cec255ce26147d08f92ec36b6da6c01536faebc7599e0bed5c19f333dcfce"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_GoogleDataTransport.xcframework.zip",
      checksum: "868eb7b19746191f6d9a310cf7098d341f7c716918dfbcf4cd3b91aca7b889ec"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_GoogleMobileAds.xcframework.zip",
      checksum: "f65f0f02232264a456f389caaccddd088a6bcf23b3c908049b9da8d285bc062a"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_GoogleSignIn.xcframework.zip",
      checksum: "92b07b76326be1aa610cfa1cb54edec9e4733aa7d6c064722f3656211e4e8635"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_GoogleUtilities.xcframework.zip",
      checksum: "cd3cfa7b24b8777542321e20cabe6290115735e3790891beca9fafbe220f33f4"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_Promises.xcframework.zip",
      checksum: "d8a1e7749f288af257169e9c60e612f7298e2a8d9aaad7c1a302e24179f39943"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_RecaptchaInterop.xcframework.zip",
      checksum: "d2d45c7832d4fc2ab185a3de061c760de8de443b15faed26ee39e74d68769e53"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_SwiftProtobuf.xcframework.zip",
      checksum: "75d5ee8fb78725f7e2f020a67c2743185abd64009890f72198bf3d48f43486a5"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "cbc475c3bb75aa7c1fe5eb1d5dc73b01fd929721461078f45c4ee64ae1d84e52"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_absl.xcframework.zip",
      checksum: "32a03d787b667b95346f3ee668c499dd2ee0e544f9cc4e0e3901b7389f41bff8"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_grpc.xcframework.zip",
      checksum: "0e4d14d96cef13374205e3439f7b229c5732d39ba97f0a1a8ec2fd70eda11883"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_grpcpp.xcframework.zip",
      checksum: "19cd0f38e1e39765cbdfc96e170b17abce4579eae2fb8309278f17bb21c7fb59"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_leveldb.xcframework.zip",
      checksum: "e5265a8e6eec65f9bb59cfa45f852cfb5f56d6e9bf0be8c9ef25199edfea9ba9"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_nanopb.xcframework.zip",
      checksum: "55c1c0eca4452c3010b6ed993b3f364ba44966f0d03840b257cd5c9e9057f498"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_openssl_grpc.xcframework.zip",
      checksum: "35ba2e4fec4f19f3e66c4bcb6e3bcbbfe27118d4a763a42587c1fdcf11a1418b"
    )
  ]
)
    
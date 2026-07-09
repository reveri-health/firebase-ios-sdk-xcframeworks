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
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_absl.xcframework.zip",
      checksum: "66630d5835263b351f1f762eb4c3ab9ff911cbabae3d47b8f3fc83cc1e161972"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_AppAuth.xcframework.zip",
      checksum: "d51a4b52c875e0a83739a88dc3e9ed6c4049060853ed0bc22a8d4e6d50f5e773"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_AppCheckCore.xcframework.zip",
      checksum: "d353e12bb3be773122beb93d4cedc6c6f6c4e7512cfd7a5dfaeef2fd48812a80"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FBLPromises.xcframework.zip",
      checksum: "c1dece3ae7e888193f5fcac34297459619114a9ca3fdafa946ab8dd7f8c1c7d0"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseABTesting.xcframework.zip",
      checksum: "8fa8f20934c908f2ede50846d9cc4229a60c28664b53b4c5d357831d120c21a6"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseAILogic.xcframework.zip",
      checksum: "62b8c17256bd3d6d222de75b070e8e97b0037fad188a2fb8b0c22b4b9e704093"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "f1c27f297e43bc7b3886d735ae5d29af1ecba892dc48c0358c15b43f9731405a"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "456ebc4f27a00a3905fc43271327ea603ad43157df628b2cbae03ce116b4ccd5"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "5fd144930a718b868c62c526f16e9dd0e7f0efe53a06d82135edce7c05a2fc75"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "feb63dd6a11f07665a82f79377c554cfd50b705f408c93bb37996b7ae8405fa7"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseAuth.xcframework.zip",
      checksum: "5d3baf391a80211438dc5df7b722de881a535e1065095c24a5bdb3fcab8b3de5"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "b6d7e3de04169affb8abd63ceecdec44100a56f5e827f4696fa44d641d0e9241"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseCore.xcframework.zip",
      checksum: "1d18b373e39126d520d748e39124008e16eac1ce04c460bdfd7ba3f0bed22177"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "b5acfd3c38830a9e85ad8ea23484ab5a6b8b5d3019cc5316a321ed3531226a8f"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "5a6cd24683b76fa4e9c67a49782651166575b334e31875a85f8876e927e3cd69"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "88b833873b4bfcd1580cfb3dbfd201bb7f1a6d294dcac405bad84b5f6d82f49a"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseDatabase.xcframework.zip",
      checksum: "53812df2e3d46ff53276b95edbacca7ddcd9087d72de8756c8235098b2b13041"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseFirestore.xcframework.zip",
      checksum: "056aa3c6e18bd43759478220178cd15d3908b3af7540ccda83159410fbe786a6"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "8205020bc4db5a530a76d2e5302a80dea396d46828aa839076e3520f293be996"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseFunctions.xcframework.zip",
      checksum: "ace1b24ce51c8001c6e3bb348d582c51348a3055a61d26e4e82b5bb85e24f37b"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "0abeacfb7a56d77f05eaec2da106f9e568732ef6c82d32fcf3daa88f2b272ca8"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseInstallations.xcframework.zip",
      checksum: "86527c6ca0e411edb7542fb29e13488bd137cfdfd7667d807cc6c0f818cb2f46"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseMessaging.xcframework.zip",
      checksum: "c7970c429021bf766873217ad03d3b85240195ad5f9575c6f890f29a17923784"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "21672742d6fe287d74a2a8974a85dfb69b1d271db3df7d8a585c3463a88ca08c"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "6bc51a64e26fbe138093c33d328baf342ed247ed790feafddab2d668ab82b8a2"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebasePerformance.xcframework.zip",
      checksum: "dff36937202897f9528088c0da745f7afec95c0e2106a752a9d69141d6335cad"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "b50022a8be56055a79fa02bf5151384769779b8435e7d96da2f4fabc0256e6fe"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "6a7c511d448cf82c1222052b4682ccd0ff81975b9e481432a13ab895f38fc342"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseSessions.xcframework.zip",
      checksum: "72b132d46a336c54d380dd81c0eca04219a6b02bd88448753245c661a131927a"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "b85cb98a679d97c35ddf517655597805fff858a5d69c8cef91ce3225006c7f16"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseStorage.xcframework.zip",
      checksum: "5727b868c4fad9d07a91dd0c685ab934095c4deb409d2d3eb221b0541777c835"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "31a5a1f5204f4844a480d3889b6ebe2e69473ef32b868935c51812c0483cb08b"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "f80c117f1e9581f24e4814f9585109aa372d06073c3b8ae87120334bae6193e2"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "443138b3a2216751ece87c2f7d5c7383eff33c78debe49930d4814865d607f18"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_GoogleDataTransport.xcframework.zip",
      checksum: "7c732032d1c0ff722b0337a3c2a3a1e8f69da79458f5971f23e8eb37bf6d70bd"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_GoogleSignIn.xcframework.zip",
      checksum: "110e964d3d82796e5bd9042fd8c2b47da0d2c4ff74b888c0fbdfcf0567d1923a"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_GoogleUtilities.xcframework.zip",
      checksum: "a1f44ce51571fd0b593ec1c393d10b3fae15a0561769c6c6d453fe09fe8efbe9"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_grpc.xcframework.zip",
      checksum: "e534da1efa8b40e8f0f9bef3a2d63e92451fc4faf0b3cf52e3d070bd586863c0"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_grpcpp.xcframework.zip",
      checksum: "c7b6daeb6530fedc2c99e8261d02b7a1918bccb51a011374851587b5e027fb62"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_GTMAppAuth.xcframework.zip",
      checksum: "b0f9b4e67c4963756ff9984a2af63f839cf0f96fc3a40a5e73eb64173003b232"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "7e0a037087dd51996ad92a95dc57542d7611b1e0cb21dcdc1b752566152318e7"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_leveldb.xcframework.zip",
      checksum: "3ec027ae2b00fd34decd6d511c7816792ac3f85a06a99c5af861642be01402bd"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_nanopb.xcframework.zip",
      checksum: "67f2aa4cd34318dd3b37f8f6e5659e446bcdf0f954b5471793363a230a51067d"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_openssl_grpc.xcframework.zip",
      checksum: "1c0ce94564e5f8aaf409dd65d319e60dd9c4b858905d46f4b2c92da27177437c"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_Promises.xcframework.zip",
      checksum: "c10b87fa2b06a0bbac6c573ef9162852195729c2c9d537ac32691d1037aaa6e1"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_RecaptchaInterop.xcframework.zip",
      checksum: "ca8848d50984c856ac06549ac72c01de09cd29e186206dd04a5cdddf86cf38ac"
    )
  ]
)
    
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
        "FirebaseAppCheck",
        "FirebaseAppCheckInterop"
      ],
      path: "Sources/FirebaseAppCheck"
    ),
    .target(
      name: "FirebaseAppDistributionTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "FirebaseAppDistribution", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAppDistribution"
    ),
    .target(
      name: "FirebaseAuthTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseAppCheckInterop",
        "FirebaseAuth",
        "GTMSessionFetcher",
        .target(name: "RecaptchaInterop", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAuth"
    ),
    .target(
      name: "FirebaseCrashlyticsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseCoreExtension",
        "FirebaseCrashlytics",
        "FirebaseSessions",
        "GoogleDataTransport",
        "PromisesSwift"
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
        "FirebaseAppCheckInterop",
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
        "FirebaseAppCheckInterop",
        "FirebaseCoreExtension",
        "FirebaseFirestore",
        "FirebaseFirestoreInternal",
        "FirebaseFirestoreSwift",
        "FirebaseSharedSwift",
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
        "FirebaseCoreExtension",
        .target(name: "FirebasePerformance", condition: .when(platforms: [.iOS, .tvOS])),
        "FirebaseRemoteConfig",
        "FirebaseSessions",
        "FirebaseSharedSwift",
        "GoogleDataTransport",
        "PromisesSwift"
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
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/AppAuth.xcframework.zip",
      checksum: "b6c2f0a0122ad7a393decf1bdea22c26522b767126fa22871ae1dbb6a66c4124"
    ),
    .binaryTarget(
      name: "BoringSSL-GRPC",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/BoringSSL-GRPC.xcframework.zip",
      checksum: "18f4556bd14d23e4f962cd37979e92baab242418f8fc4e03d16ec0c972cf5d27"
    ),
    .binaryTarget(
      name: "FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/FBLPromises.xcframework.zip",
      checksum: "bb1966eb5ad33ff15814f66398adf93af9183004ea01c89fef07b04b66594cee"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/FirebaseABTesting.xcframework.zip",
      checksum: "3e5962addf2f6ae0b9c5d1a7e5a15412565cc19dae75eaa9fd058cc153a6ca1d"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/FirebaseAnalytics.xcframework.zip",
      checksum: "df9962123b9b40fc2372361bb8c2046e47d6a41229b77f90f8f505c6a1c57a0d"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "756bc2210f8f30d4837e798f257dce5148a7a543e44eb924b7ec10be2dd08b86"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "efd53ebad5acb182297691a2812164f13ee8700fa9be2b8c61b8346ab10f75ac"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/FirebaseAppCheck.xcframework.zip",
      checksum: "aa7569a221535183ba981f544cc1c25acab32ec760f1c33de96df5f32057e0fa"
    ),
    .binaryTarget(
      name: "FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/FirebaseAppCheckInterop.xcframework.zip",
      checksum: "fbdac96625242a786b149ffd5af005fe1f89459a3011e58f4a8ded12422f23e4"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/FirebaseAppDistribution.xcframework.zip",
      checksum: "17111c80cac04fb75989055b80f2976dbaccc5272ec745aa59b0b98591aad562"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/FirebaseAuth.xcframework.zip",
      checksum: "7c1e3f1d031d77f963640d99fbf10014352d41cec6f694301ddc7f3740b6869e"
    ),
    .binaryTarget(
      name: "FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/FirebaseAuthInterop.xcframework.zip",
      checksum: "1b8586ea903c1770e43bf14699ee044a5ca7244c25e963f9a14252dabe608b24"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/FirebaseCore.xcframework.zip",
      checksum: "1686959866d103944ed8afed7259e727eeaa48a20ed12c98b0b8965275be9a15"
    ),
    .binaryTarget(
      name: "FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/FirebaseCoreExtension.xcframework.zip",
      checksum: "f8cbdbb2a8712f616fe6b4ec13fae900323dfcf4143736c2d1964da1162c8e66"
    ),
    .binaryTarget(
      name: "FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/FirebaseCoreInternal.xcframework.zip",
      checksum: "b73501c715b4089176fbd188807690c3563f72b2fff413928348f9a617a415a7"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/FirebaseCrashlytics.xcframework.zip",
      checksum: "df88ae6f7c170541611d0b642f69f26b98d9a883e53716c95595acce26a93e46"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/FirebaseDatabase.xcframework.zip",
      checksum: "05fb1b5340276f3b64e2d81f871ce219613ac64444138a637a1ca773c2664f29"
    ),
    .binaryTarget(
      name: "FirebaseDatabaseSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/FirebaseDatabaseSwift.xcframework.zip",
      checksum: "310c82cd218eb24b81c7f66410835d6a765539f54230e3ba0a39e517b3d4adb9"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/FirebaseDynamicLinks.xcframework.zip",
      checksum: "bdbb0344cd9383e2c29fda3a9d23343a4f263de27d8e2e2396dd0b95c14b030c"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/FirebaseFirestore.xcframework.zip",
      checksum: "788b7c2aae066ecd40969a96a06d511e98a8e162d8351b4bf2d9ad1114682ac8"
    ),
    .binaryTarget(
      name: "FirebaseFirestoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/FirebaseFirestoreInternal.xcframework.zip",
      checksum: "eb123551b3928cde07038c05b0ce9097e43d5b931d3cb37d732bd40dff4c3dd6"
    ),
    .binaryTarget(
      name: "FirebaseFirestoreSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/FirebaseFirestoreSwift.xcframework.zip",
      checksum: "025926400bec4f94a568aaf3a7d7ce859635adb21ae5c6acdb9d97f7a8375ff0"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/FirebaseFunctions.xcframework.zip",
      checksum: "7b869821d8032b7823931e5129c1700e393dc0169ad253d71387ecdff51b444c"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/FirebaseInAppMessaging.xcframework.zip",
      checksum: "664066bea35fecf5ad93f8586a94b0b9b03f2000bbeabc1213ff6f53f1eba642"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessagingSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "68de0201ac6785d0fe42e9e32f522a2efc57e050f0f5a58a0dd80ff6f516b46a"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/FirebaseInstallations.xcframework.zip",
      checksum: "6549fa59087ec46b099daae8cfd90f296e881f805de3459d57bcbd5e6c034c84"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "002d74adf52100dbc5ce7ff58acebf6319055f663d9acfef811c9591c1ed8c0a"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/FirebaseMessaging.xcframework.zip",
      checksum: "e469fbe8d1c4a0dc0a967d4e6a7d065624a9c4dcc889ba8a24a5ff38818a6b0e"
    ),
    .binaryTarget(
      name: "FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/FirebaseMessagingInterop.xcframework.zip",
      checksum: "9e4fefab84d9c8785e6aa621416c4c341ce46ba688e41f4241f424cf18c1b5a5"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/FirebasePerformance.xcframework.zip",
      checksum: "8c05ae5321a4f22c2f299d8b9f63a0684fd529e81b25ef4b803b68bd3b1b21c9"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/FirebaseRemoteConfig.xcframework.zip",
      checksum: "6737d633856daa2396f5237a0b1579bd054906d08d5c5a923f1b6390b40bebe1"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfigSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "99771cd62b850870de4d52d4b41c10b4c4edaa47687a77b3f0ecf230d395c319"
    ),
    .binaryTarget(
      name: "FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/FirebaseSessions.xcframework.zip",
      checksum: "f3f538804a8c6c3755ca95e079f7fa50a867288360c74bd83efa514ce9593574"
    ),
    .binaryTarget(
      name: "FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/FirebaseSharedSwift.xcframework.zip",
      checksum: "f8e929cc7ed3f19220cf2fc4a0a27a746fe0333b9d1fd3ed2a71632e9fedba07"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/FirebaseStorage.xcframework.zip",
      checksum: "8de2dd82c3ba2ec639e725d2c2ac50ce39b98e6890fb01f7761bdc0be4586395"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/GTMAppAuth.xcframework.zip",
      checksum: "af4188fbf464320fce068704d367a7b978934be54a687e449b14e8bdfb8bdbaa"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/GTMSessionFetcher.xcframework.zip",
      checksum: "15191379f4761d7aa7e341d9feb9328eacfe0266c8460772cefabdfc3a31818d"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/GoogleAppMeasurement.xcframework.zip",
      checksum: "f73009fee29ada58998c025b1c5365e929129312e405e4c5ad114ae8f6962fdb"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "5e98aa16d60634a4bd7d154a9308f76a21f6823a7a3518658c73ab5691d0197f"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "3f63c7403a0fda89d69871027dd75b5156db23d4893e42dbba4d4382ad7b8636"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/GoogleDataTransport.xcframework.zip",
      checksum: "44bd196d74f97afb8b019214037bc552c773bf9d152f27eb3d3a8beb82c1f92b"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/GoogleMobileAds.xcframework.zip",
      checksum: "b93e62300a2fe57b9d50c2b76ebe7e3f564ad87901e84208f3fcb56e31fcbcf9"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/GoogleSignIn.xcframework.zip",
      checksum: "524f7b5e8c91ccedc93ac9e4582db66bbfead87bdaf14e157103fd20606ae94a"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/GoogleUtilities.xcframework.zip",
      checksum: "5f230f37c0c2abe03de583039b833af5fa14b9e43bd8ed2b01d24937d3cc8da0"
    ),
    .binaryTarget(
      name: "PromisesSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/PromisesSwift.xcframework.zip",
      checksum: "41fb4d7ca17ec844fed1702f663a9783892e99a8044d223d5a148f7c9a927d6e"
    ),
    .binaryTarget(
      name: "RecaptchaInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/RecaptchaInterop.xcframework.zip",
      checksum: "4cc83ed4ae5daa5b462c215524b92e4b8ebb2f720d4eec84e505bab7ca42ca16"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/SwiftProtobuf.xcframework.zip",
      checksum: "928be2127dc35bb5ab1fc3f09816b145d702fbdd06e1a5e07e5131b8712f8639"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/UserMessagingPlatform.xcframework.zip",
      checksum: "a5c9a3860ceda50604830449c2d51fd9f3f3c5069ea859f32cb98fe3cd87f6af"
    ),
    .binaryTarget(
      name: "abseil",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/abseil.xcframework.zip",
      checksum: "9f70ab13f7e39650e46ce9ec01531079bc424e172538e3d2ac2cb832ea5599ff"
    ),
    .binaryTarget(
      name: "gRPC-C++",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/gRPC-C++.xcframework.zip",
      checksum: "3a0434bb3ea627c5d2ec2e6c3115b6c57d28d3843a6989886468cfb20e8b2682"
    ),
    .binaryTarget(
      name: "gRPC-Core",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/gRPC-Core.xcframework.zip",
      checksum: "b6e7cac9a1399b778d368044b70e21fc99f31c700591320b87de327cadc1e4f8"
    ),
    .binaryTarget(
      name: "leveldb-library",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/leveldb-library.xcframework.zip",
      checksum: "6cb739a0a86a6deb546758386a0195d8c6ccdcd256f80b3c6bc44e1097f590a5"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/nanopb.xcframework.zip",
      checksum: "6d4c374ec8b869cefed0f6c1f0f3b8d50fb6b14771cd38e38374cd18131dcdd7"
    )
  ]
)
    
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
        "FirebaseAppCheck"
      ],
      path: "Sources/FirebaseAppCheck"
    ),
    .target(
      name: "FirebaseAppDistributionTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "FirebaseAppDistribution", condition: .when(platforms: [.iOS])),
        "GoogleDataTransport"
      ],
      path: "Sources/FirebaseAppDistribution"
    ),
    .target(
      name: "FirebaseAuthTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseAuth",
        "GTMSessionFetcher"
      ],
      path: "Sources/FirebaseAuth"
    ),
    .target(
      name: "FirebaseCrashlyticsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseCrashlytics",
        "GoogleDataTransport"
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
        "FirebaseCoreExtension",
        "FirebaseFirestore",
        "FirebaseFirestoreSwift",
        "FirebaseSharedSwift",
        "Libuv-gRPC",
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
        .target(name: "FirebasePerformance", condition: .when(platforms: [.iOS, .tvOS])),
        "FirebaseRemoteConfig",
        "GoogleDataTransport"
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
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/AppAuth.xcframework.zip",
      checksum: "5f9d7f1cb3222113b62f3e8fe793e43529f951a1bf27861a58986239de0c0332"
    ),
    .binaryTarget(
      name: "BoringSSL-GRPC",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/BoringSSL-GRPC.xcframework.zip",
      checksum: "4eaeb6c6ca7c61564df3c884dade97d9180980114cfadeca5ae037cd28198c7b"
    ),
    .binaryTarget(
      name: "FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/FBLPromises.xcframework.zip",
      checksum: "ffc91e1bd1766466218e3717c51130b71dc1aa41bf69fbc79093ad4c09b6dd24"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/FirebaseABTesting.xcframework.zip",
      checksum: "2683652821488351bc5a2807b7ab8ac7e875310d816e7a1bccb1039594e51bd5"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/FirebaseAnalytics.xcframework.zip",
      checksum: "7f21615cc5a20ff0f44f61c90dc268b37b8112484465ccea3187b82f2e23e492"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "edd57c1e97756ee0f963a5c0b77189d348d7d3029fda6132326563fcdc2924d1"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "bb015a0f332722768fc93ed78eb6557d20de986419db278b2127790e94fb84ee"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/FirebaseAppCheck.xcframework.zip",
      checksum: "5ff12636c72faff64a1458e1578da074f647b72beebe119111d0dd961bf2c095"
    ),
    .binaryTarget(
      name: "FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/FirebaseAppCheckInterop.xcframework.zip",
      checksum: "251b298195fcea89469b0c678201f132ac112a2ac2d340fa121d3613c8b7b9ff"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/FirebaseAppDistribution.xcframework.zip",
      checksum: "e8890a039626b87a39332d19ffdcd68c736c4235d5b2b14657f8f3551ac60436"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/FirebaseAuth.xcframework.zip",
      checksum: "1f541f0a2d1ef4700aaca99e91a0a7aa58b3b8415a6ea9fe7636f5e6583944fb"
    ),
    .binaryTarget(
      name: "FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/FirebaseAuthInterop.xcframework.zip",
      checksum: "48c0c7278174c958de86fcc88d6043dfbc1e4e5e68a7c7db94e9e29569c751f0"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/FirebaseCore.xcframework.zip",
      checksum: "da7c36e1fabba5dd7464afeefc1e52dc2e683571a482da0c0e194d71e5669891"
    ),
    .binaryTarget(
      name: "FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/FirebaseCoreExtension.xcframework.zip",
      checksum: "63ff943a0f00efe8746902ef7d95fbdd012874c488f213e3da8f52e616277872"
    ),
    .binaryTarget(
      name: "FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/FirebaseCoreInternal.xcframework.zip",
      checksum: "8faaaed4ac7a560585788fb727029cc764b5696c2ad677e67a686646e7954dc1"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/FirebaseCrashlytics.xcframework.zip",
      checksum: "aca5a5f65b1605e2c4172ed561e0647d821bb7be35ded9b9099c5eca020de21c"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/FirebaseDatabase.xcframework.zip",
      checksum: "b445b0493a1e7127fa85685e1a6a23dad60bfa5046af0a7f40b296203a079915"
    ),
    .binaryTarget(
      name: "FirebaseDatabaseSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/FirebaseDatabaseSwift.xcframework.zip",
      checksum: "0c66af2ea695b295adcd801d33d481ea37f2044eb46a78ae24e1e720bc638fec"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/FirebaseDynamicLinks.xcframework.zip",
      checksum: "6fbabd5c2e5956dd50bb3bb32001e31f8ab1e04e041631d8a96437ff1027b757"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/FirebaseFirestore.xcframework.zip",
      checksum: "cc15effe12727489d0ece8fbbb75e15f208a61cb8cea91fab90c99dcab9f9c0c"
    ),
    .binaryTarget(
      name: "FirebaseFirestoreSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/FirebaseFirestoreSwift.xcframework.zip",
      checksum: "e80b112c37304de6a1e087e1f96b1c7e95c670c2e48636e5b79b0a4dcc371995"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/FirebaseFunctions.xcframework.zip",
      checksum: "0cbb881866d1d814eb09d9db5c6d9c040a19ffaba4820425a336c592ec1b7ee7"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/FirebaseInAppMessaging.xcframework.zip",
      checksum: "677ed8dbb52924b296df33a6340bb058f871111d1997bcebd953c5e70fd47154"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessagingSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "0e7b673b4a5234f145660dc7f289b0291d3a97d654945672b3b7913f8331f754"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/FirebaseInstallations.xcframework.zip",
      checksum: "90a41b641301d65e001f432cfd833d33b9f0a241842a0ed68bf9ab4cf45b42bc"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "d09d500bc8ca3fc200b632ababc555730b18e7bf848229cf0fb4f07bac36a085"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/FirebaseMessaging.xcframework.zip",
      checksum: "00bcb40ca36cd36776d4fa2971a4c278e2749012fea4d6053cec9bbeb8b1ae92"
    ),
    .binaryTarget(
      name: "FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/FirebaseMessagingInterop.xcframework.zip",
      checksum: "389c251d65af5ad4f8128b6d9e2f6b774c21886fa8d48e224a4c6aa70a1396cd"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/FirebasePerformance.xcframework.zip",
      checksum: "acfecdd3ef704e0df7092bec7f4df7d00f11e8b640eb2c386a7667d445e1e35c"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/FirebaseRemoteConfig.xcframework.zip",
      checksum: "a37cb7cdcbca39366b54806d3ec0002c574226ca7e2bb0a3be7a49b7b4507c68"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfigSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "9c9b7c7b4fd68ff58a7f35d89c5f64fc853ee25ed486ecd544cb5c9b9695f45d"
    ),
    .binaryTarget(
      name: "FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/FirebaseSharedSwift.xcframework.zip",
      checksum: "92faa9278e5df566bcd752f27d84744c2c7b6caec7a8c61299a9ef8dd4559ecd"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/FirebaseStorage.xcframework.zip",
      checksum: "048731409cc67d75b9c7e8216e54ed0e842bb45157191a57b82dd0e1c9649b3b"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/GTMAppAuth.xcframework.zip",
      checksum: "c0253093798c1e0c2ed07e1d891d0e3a786a6f87640a69a878ea122a65f989e5"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/GTMSessionFetcher.xcframework.zip",
      checksum: "f9799a6e3b85af4bcb49f8caed75d20bbed5a295db8aa0b7f1274293276ebbe7"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/GoogleAppMeasurement.xcframework.zip",
      checksum: "19d62deded025e57005f5774ab8432f6364fa50fe705211948a0b2c0dc32defe"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "b35c24ec1d5a771b262a38481ec4a1ae523428ec5aeeb22678e37a57e30962da"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "0a61f6d8fca7c52dac4fb252f3088237e4835538ee4f6c4a7eeb83b75337772a"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/GoogleDataTransport.xcframework.zip",
      checksum: "ac116ca9e0f5bb5191bcd8d0cfb10b56864e9d5ad3e376c3ea4d728b75bd1431"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/GoogleMobileAds.xcframework.zip",
      checksum: "e47d4c8b1683dafe8ed0b607f3bf819da2db9b46531db17ea1303e47f40ea8c5"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/GoogleSignIn.xcframework.zip",
      checksum: "e76127d696401167a184c588c2a87342d017ddb6780edea92e3f3e48337e857a"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/GoogleUtilities.xcframework.zip",
      checksum: "eb6c269d8e9737b81ff49e8535eda2a6517630fcb65932c239e63eb358ec6506"
    ),
    .binaryTarget(
      name: "Libuv-gRPC",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/Libuv-gRPC.xcframework.zip",
      checksum: "e70bc5533a87370067a7ee1060d028aadfb1208e6f583859efb4cbde1622c1a2"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/SwiftProtobuf.xcframework.zip",
      checksum: "e17e30bfdcbcba9eee57a77c5431b6af168a89fec1038542aab52092f46277c7"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/UserMessagingPlatform.xcframework.zip",
      checksum: "b90fc806e6431ddafbc7129a2f49d3b07c68a3fdb046775a12ed38beee3a8c31"
    ),
    .binaryTarget(
      name: "abseil",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/abseil.xcframework.zip",
      checksum: "b5372f7cf48c8e2e2ee89bf04150bae5547b4b39f61e6ab39b0ea0e6143fe529"
    ),
    .binaryTarget(
      name: "gRPC-C++",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/gRPC-C++.xcframework.zip",
      checksum: "032170455300447a064115c3de3b2a0e3d0cb0728fc0bac8a7d1fcf264af9103"
    ),
    .binaryTarget(
      name: "gRPC-Core",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/gRPC-Core.xcframework.zip",
      checksum: "0eb74bd03b12d541f1242f27eee71141081a8a34aeaa72c3989dbf0c50cb3732"
    ),
    .binaryTarget(
      name: "leveldb-library",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/leveldb-library.xcframework.zip",
      checksum: "7e9b10e1055226b1067b8e9e8cf84f733742d085ba17c5cdc4b2beecc6518b77"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/nanopb.xcframework.zip",
      checksum: "fc09ba976aec99eba94b6ed42a36524209c5440503c06c034244ad2f9cebb695"
    )
  ]
)
    
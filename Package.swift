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
        "FirebaseCoreExtension",
        "FirebaseFirestore",
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
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/AppAuth.xcframework.zip",
      checksum: "72b1d1087cf07a8fa55dacf0b69c64c59f2da3ce795e6bb89a29b12fe8a1c97d"
    ),
    .binaryTarget(
      name: "BoringSSL-GRPC",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/BoringSSL-GRPC.xcframework.zip",
      checksum: "f845f39f95ba73a19810234d4ec404375c78431db27b6e86d87b5151f8fae876"
    ),
    .binaryTarget(
      name: "FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/FBLPromises.xcframework.zip",
      checksum: "7c0fd3f4da3736364440f81812abff6b325dac58e68000f290848e4c626aa4bd"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/FirebaseABTesting.xcframework.zip",
      checksum: "c5669a5859fe6706b171572aa1cd1f216432f9f4680415176709016eed4da538"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/FirebaseAnalytics.xcframework.zip",
      checksum: "9612be6ec9f78bc797b292f33190998102784089cde98652c3cba8781e1b90ae"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "af480aa4995773c94c6531b42284e276a565dbda39789bea3aa70421e18dea34"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "77d3582cb8bb77d18d1022ebe1292381211e4a0cd65c5a9428fa9bfa8244be99"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/FirebaseAppCheck.xcframework.zip",
      checksum: "ea38874d29c152718824b4f384bcb010bd35340f4bc6621ee1c8ea1c3d422276"
    ),
    .binaryTarget(
      name: "FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/FirebaseAppCheckInterop.xcframework.zip",
      checksum: "9e8d496bb28279ad8490905a95a50b4592ff0fbec45f654a933deea84c9e3858"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/FirebaseAppDistribution.xcframework.zip",
      checksum: "64124587240d08aa69231b9c137a6b8bb98fc26fce5b0a845e6e174bb8952440"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/FirebaseAuth.xcframework.zip",
      checksum: "87b5fef43a7b8937957bc4841a92591595e6dd40b2dc9c660d9c819d76a8a975"
    ),
    .binaryTarget(
      name: "FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/FirebaseAuthInterop.xcframework.zip",
      checksum: "9980a7739b82920a7607fe0ab4847aeb9c45a725ec55bbfe42e92e52add73952"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/FirebaseCore.xcframework.zip",
      checksum: "9c2cc098a611e759a9a9c6efd2a27a508ca55e86a9c4bd751544742485e5160e"
    ),
    .binaryTarget(
      name: "FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/FirebaseCoreExtension.xcframework.zip",
      checksum: "2060320e44ebd870e60f64a030875aa21a73e51435be5dd2f36db7321b3271cf"
    ),
    .binaryTarget(
      name: "FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/FirebaseCoreInternal.xcframework.zip",
      checksum: "961bac8d77b32f1f083d9275b2e8131185cec7c36644e32767045516de353744"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/FirebaseCrashlytics.xcframework.zip",
      checksum: "d5ef9cff0d21078b1fce154fa5c19f19edf8585c51f18e25f3eaa5253401fcfd"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/FirebaseDatabase.xcframework.zip",
      checksum: "dace00dd8b53de94355b4ffc2b1aa068c22a1709161d087df0d70b128fc379c2"
    ),
    .binaryTarget(
      name: "FirebaseDatabaseSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/FirebaseDatabaseSwift.xcframework.zip",
      checksum: "6b64a0f8faab1e76d22fd6040f49b4aad771b991e410abd587e94158ebaf5fb7"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/FirebaseDynamicLinks.xcframework.zip",
      checksum: "0a4edfb56d4cdac224289ae5d225986d3c86373e42ba5010bbaac48949572c0f"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/FirebaseFirestore.xcframework.zip",
      checksum: "e32bd08ef099f034a10ad8dfa3e6a7ba511e72e8b21a24f80c8ee8a2e484c345"
    ),
    .binaryTarget(
      name: "FirebaseFirestoreSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/FirebaseFirestoreSwift.xcframework.zip",
      checksum: "2a8a4b86284fe162d042cb18b558100b857d5f50c14db8dca9482939fbff2187"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/FirebaseFunctions.xcframework.zip",
      checksum: "72f16f374b6f4c65ef43efd3644e5d212e71cf931fbe1f331fc072784470eb67"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/FirebaseInAppMessaging.xcframework.zip",
      checksum: "816dc7160413c6c05b2b6d07e8360aafec647607201e34dbcc15f6aea5d5957a"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessagingSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "85804297957a581519254f365819597c4f5ecbddfa211eea3bf42f6310883818"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/FirebaseInstallations.xcframework.zip",
      checksum: "0fae5208a1e0785a927a5ca6979b8e5edcfb6d0c27ffe777592795e20d35cda1"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "93db8b08cafab32280b7db919f2bf482e1756e2bf0801abe4b960194d72d7915"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/FirebaseMessaging.xcframework.zip",
      checksum: "cf4d6702983fb186ae21aea48db48de3355612df8b2bc65556eeffc09559d3e5"
    ),
    .binaryTarget(
      name: "FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/FirebaseMessagingInterop.xcframework.zip",
      checksum: "802e97a8be8ae8b97ec0270e2276ea7a8165d90c80d5d958448f8b7a3c0046aa"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/FirebasePerformance.xcframework.zip",
      checksum: "1a67b84c0234222d646485966213c5f03ec8821a2cb1de94c822ac2d69de0feb"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/FirebaseRemoteConfig.xcframework.zip",
      checksum: "ee81d2d51872240e012c6dcb77fa8fa25b17adaf52e37453240989dd4f002443"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfigSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "7f1167b7eb1646573dd32ca2cbfad131c0aa1be4adf8d9b1d651d6b9149bf590"
    ),
    .binaryTarget(
      name: "FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/FirebaseSessions.xcframework.zip",
      checksum: "36401ede6cab648b12ac5dbb4d0244f3838f582d838817b0495fd423cce62cc3"
    ),
    .binaryTarget(
      name: "FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/FirebaseSharedSwift.xcframework.zip",
      checksum: "d2e70816781d7ccfb72086c66b49f6017bd99501db5a9feca9f6f21fcd5a94e8"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/FirebaseStorage.xcframework.zip",
      checksum: "92e116ae7d4f3a1a6fc3162bba7d3e7a609cbb4227ec803f7c2ead38c295e9e8"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/GTMAppAuth.xcframework.zip",
      checksum: "1474cd74956d679b59cadd5cdcc16854bec70fedb34facaf8fd115d2658c6052"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/GTMSessionFetcher.xcframework.zip",
      checksum: "88bfe412cf0f0b21fff0bd131d9522fff13ddacd5b6589fb1b160a8539bbad21"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/GoogleAppMeasurement.xcframework.zip",
      checksum: "6541a87e0ed2f0ff622ddcce7a54518b016faebc1fdf4a47402b0cf7a52a7ae5"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "6737300c85d6464d58aebf100701f9fa68f6c60315d528828b1be20381413971"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "40041cac09137c73a590aa695a2fdf5dc8b8b5b7585ca42051bfeee3cee17e11"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/GoogleDataTransport.xcframework.zip",
      checksum: "32111579a4ce6621c418e9cecf373dd70ff40caf848e210bc7bd63280a59678c"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/GoogleMobileAds.xcframework.zip",
      checksum: "50601bafb5bbfa298cbc0834722df6e020e7971eabefadaf8a9825723c348b05"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/GoogleSignIn.xcframework.zip",
      checksum: "237aeafeed782f74bdce81c276107159a5320676f2312d5fd54d00960dc0f88e"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/GoogleUtilities.xcframework.zip",
      checksum: "e9b85641d04ca8dacbbc1c203108010f217c20d5a853ea53af165bd49073face"
    ),
    .binaryTarget(
      name: "PromisesSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/PromisesSwift.xcframework.zip",
      checksum: "6f3df7ca579ead972187157798ace3a36e31ac4266eec29982b7abcf0769ea7e"
    ),
    .binaryTarget(
      name: "RecaptchaInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/RecaptchaInterop.xcframework.zip",
      checksum: "d82f4101bac4e2ef792cd4117e6dd7171e77f3e3a18fd5af2f2ff21f93691e1d"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/SwiftProtobuf.xcframework.zip",
      checksum: "05dcae563c6c17ff4ec25b024e99fb1e4423c193cfc3509826560b52b4a05d25"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/UserMessagingPlatform.xcframework.zip",
      checksum: "1d480d19f3f0f1e4c2b031bf43474e7bbabedaffbe840650c0777b40dff428c1"
    ),
    .binaryTarget(
      name: "abseil",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/abseil.xcframework.zip",
      checksum: "3a8ceaa7b2b563b60990d7c45aea86dff21d1839a77f4dfdbf581370dab97f4b"
    ),
    .binaryTarget(
      name: "gRPC-C++",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/gRPC-C++.xcframework.zip",
      checksum: "cec7c001043e73ee5e709db56bfc23aafb186de132cd12e98c10549427fa8cdd"
    ),
    .binaryTarget(
      name: "gRPC-Core",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/gRPC-Core.xcframework.zip",
      checksum: "79c1437c3ce8f43e233a69ce6f8da0ae19b28f0507530c1a93b0e57b70f3fd43"
    ),
    .binaryTarget(
      name: "leveldb-library",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/leveldb-library.xcframework.zip",
      checksum: "0bc0a2ff810438eb00112e9f0d664c881a01674f129d4143827c087cd9b4bb19"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/nanopb.xcframework.zip",
      checksum: "ad8e79c93b95186d61e9f86d97d585b7cad66a7ed9836c1172d124b6d7436a83"
    )
  ]
)
    
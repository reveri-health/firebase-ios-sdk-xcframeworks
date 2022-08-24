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
        "FBLPromises",
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
        "FirebaseCoreDiagnostics",
        "FirebaseCoreInternal",
        "FirebaseInstallations",
        "GoogleAppMeasurement",
        "GoogleAppMeasurementIdentitySupport",
        "GoogleDataTransport",
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
        "FBLPromises",
        "FirebaseAppCheck"
      ],
      path: "Sources/FirebaseAppCheck"
    ),
    .target(
      name: "FirebaseAppDistributionTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FBLPromises",
        .target(name: "FirebaseAppDistribution", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAppDistribution"
    ),
    .target(
      name: "FirebaseAuthTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FBLPromises",
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
        "FBLPromises",
        "FirebaseCrashlytics"
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
        "FBLPromises",
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
        "FBLPromises",
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
        "FBLPromises",
        "FirebaseFirestore",
        "FirebaseFirestoreSwift",
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
        "FBLPromises",
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
        "FBLPromises",
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
        "FBLPromises",
        "FirebaseMLModelDownloader",
        "SwiftProtobuf"
      ],
      path: "Sources/FirebaseMLModelDownloader"
    ),
    .target(
      name: "FirebaseMessagingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FBLPromises",
        "FirebaseMessaging"
      ],
      path: "Sources/FirebaseMessaging"
    ),
    .target(
      name: "FirebasePerformanceTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FBLPromises",
        "FirebaseABTesting",
        .target(name: "FirebasePerformance", condition: .when(platforms: [.iOS, .tvOS])),
        "FirebaseRemoteConfig"
      ],
      path: "Sources/FirebasePerformance"
    ),
    .target(
      name: "FirebaseRemoteConfigTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FBLPromises",
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
        "FBLPromises",
        "FirebaseAppCheckInterop",
        "FirebaseAuthInterop",
        "FirebaseCoreExtension",
        "FirebaseStorage",
        "FirebaseStorageInternal",
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
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/AppAuth.xcframework.zip",
      checksum: "2d7b9dd29cf17bb8c44a74da7042f8813ce3f424ce5fa4316f2209171a0223a2"
    ),
    .binaryTarget(
      name: "BoringSSL-GRPC",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/BoringSSL-GRPC.xcframework.zip",
      checksum: "3f6ff02dcd5a7ebc88383a2cf454a41ac64e8b065bcbcc030015973add68678b"
    ),
    .binaryTarget(
      name: "FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/FBLPromises.xcframework.zip",
      checksum: "e897ea5d6bbb765d47d6e68e6672f8bf4621135dc121cb133878576c84b9f308"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/FirebaseABTesting.xcframework.zip",
      checksum: "b26385a3914b198219ceaafa0e0daec115cb4ce6dd6c6bb5f3308f7507875271"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/FirebaseAnalytics.xcframework.zip",
      checksum: "5d45de1c359231855d426a610ba8f90ba4f41541b61e448e7ebde7171d77c30f"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "4eb351023fcc24cf4a75b6c89c5eba2850d01afaf16f8e800bf512719c79cb66"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "7c75142efcaf6547756a7acce470055f6143d593ce41741909ca9a2955ee7e22"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/FirebaseAppCheck.xcframework.zip",
      checksum: "b55fcf2362c024f8110f79c1cd86d97c91777f56cc44509185890f1fdcfa2f7b"
    ),
    .binaryTarget(
      name: "FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/FirebaseAppCheckInterop.xcframework.zip",
      checksum: "192391284d8ec30fe5197b93af2ec37225e8aa5a27a9ce722858c3caf8d07953"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/FirebaseAppDistribution.xcframework.zip",
      checksum: "d8051a895ada80a9f8fff03e217f0e013384bb0383eb9b9292527834c478ac7b"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/FirebaseAuth.xcframework.zip",
      checksum: "324ce186b53cd859939409b1eb5fa8bb2cd7c244a5dc789263ffc84869682c53"
    ),
    .binaryTarget(
      name: "FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/FirebaseAuthInterop.xcframework.zip",
      checksum: "f92b76721d06efc7d55305e515c3c57b4765324d91f2d48cf8569530e0571bac"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/FirebaseCore.xcframework.zip",
      checksum: "f463a67a81f617d2e1bd82f7849253fa1e80bf5cacb8431abe3b6dc560edf7a0"
    ),
    .binaryTarget(
      name: "FirebaseCoreDiagnostics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/FirebaseCoreDiagnostics.xcframework.zip",
      checksum: "3639d17fef9e3bb4cf43c203e152774d0b515425c090af00574702071fe0f5c9"
    ),
    .binaryTarget(
      name: "FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/FirebaseCoreExtension.xcframework.zip",
      checksum: "3fe45c4ece4d0b23cdfd8103ca7876d49a2afc7b8a90c18d852e0a4325337ee8"
    ),
    .binaryTarget(
      name: "FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/FirebaseCoreInternal.xcframework.zip",
      checksum: "41b5c695ca598bd9461ff125f5b6ae182b50a3f01cc5f8a2a30e384271f76694"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/FirebaseCrashlytics.xcframework.zip",
      checksum: "856a8bd772c4b43f2bf4bf8bb1c322d262e61e2493a9befa80db0671bbabde45"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/FirebaseDatabase.xcframework.zip",
      checksum: "5f933fa89ffe213b37e19b555c735b7db9ae9d2584c7f1967eabf61c0328432c"
    ),
    .binaryTarget(
      name: "FirebaseDatabaseSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/FirebaseDatabaseSwift.xcframework.zip",
      checksum: "0b8067a6b38f89dd208a2f5434e47a5ea713b10ecd99aa9ca62e9b6c5c06faad"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/FirebaseDynamicLinks.xcframework.zip",
      checksum: "4857df601254378e360dab16a1f1a7bf7331480a11a81713ee8aaebe1860c2fa"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/FirebaseFirestore.xcframework.zip",
      checksum: "7ab74d6326f7a9f8faa366159ecf3cd71a61558f2b2b460c00bff8faaf52c8f9"
    ),
    .binaryTarget(
      name: "FirebaseFirestoreSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/FirebaseFirestoreSwift.xcframework.zip",
      checksum: "3346ab6350a0db29cfe2f34b90859762d26134400df32edf412d367e9251e738"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/FirebaseFunctions.xcframework.zip",
      checksum: "d5e8bfa39f34b28203490718ee1fc2358c6535bb4a2d96969e9fd8eb06ddfb45"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/FirebaseInAppMessaging.xcframework.zip",
      checksum: "6bd3217555ee71c04d2bdc0c4a93985314eb78b46059adf0b9a3792af3deb89d"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessagingSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "8fc8e21b0e95fc0af869035456274ce7cea0bb557f8aa33be7b103f2fac243e7"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/FirebaseInstallations.xcframework.zip",
      checksum: "d07b1a629da579a1e408c6db3f7b4f708909761190863f92a825b7a007ce48a6"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "6ecac9887047495f2953835bb473bf5150a404d0c81da09543ea71b1d0734d9d"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/FirebaseMessaging.xcframework.zip",
      checksum: "7fae2098e1c76eb1a60ded6c06e289a5c4e4bf8a7351cf9b89cafbcba8495093"
    ),
    .binaryTarget(
      name: "FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/FirebaseMessagingInterop.xcframework.zip",
      checksum: "0f06286f9191a997e48da58e4b59087ae9ca4b1597ba70c73863ffc908d43b5f"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/FirebasePerformance.xcframework.zip",
      checksum: "9880a4be262b786b2800f1cc1c52512783108b520cd6e0755154449a800b6d82"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/FirebaseRemoteConfig.xcframework.zip",
      checksum: "744966d7ec0a61a772cd0093798deb948319ba46cf2407eb19ce7c909f34939c"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfigSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "6d74720a0d8b69936b7ebf75d28713a9a4d28953a50b48c100a15bdb258a152c"
    ),
    .binaryTarget(
      name: "FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/FirebaseSharedSwift.xcframework.zip",
      checksum: "f52e172957e5b39be64c9ce88af8f24da23e9c15b69777903c59ab53f46b6bf0"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/FirebaseStorage.xcframework.zip",
      checksum: "9c57a839361e304d1546435b8e16e8c81cb54c7243d39195538d3827e9aa2cbf"
    ),
    .binaryTarget(
      name: "FirebaseStorageInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/FirebaseStorageInternal.xcframework.zip",
      checksum: "308e630452444865a9440a896f12364ffd1231bcdf971731dc88e8222241176c"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/GTMAppAuth.xcframework.zip",
      checksum: "e6ce1be4a0e14eaefa14e58e46e40c3a6fd79c968045d3d1194bb2dd7bfcd033"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/GTMSessionFetcher.xcframework.zip",
      checksum: "1165ba71d5dcb56a9e0fcbc663875a515e539ef664b97141be6eae1a6c9e7634"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/GoogleAppMeasurement.xcframework.zip",
      checksum: "3294e6b222f5e5f53ec042c26f1488e058688bef7bef727414c091eec083b8ce"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "a5413dee10bc1404b7c9b1cbdbe77cda2fc60983cb39e9872c2676d2b5e52a56"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "ef60278889237399e26a72f23ba7ecc3815c64b2554f09c8bf5cc639f8372aee"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/GoogleDataTransport.xcframework.zip",
      checksum: "b3c485bacc707a19507828e1922e8d2ec2cf6c0d4bbf98687fa10ffb9bba9b7f"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/GoogleMobileAds.xcframework.zip",
      checksum: "65ec2c4587d62f2b3f83c29c53cddaad11f1ede451ca0f0dd2754bb242911ba0"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/GoogleSignIn.xcframework.zip",
      checksum: "131e4a067d8263b7d92446b028c840074c839a4293cfddfe5c23a3905aa9d3f3"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/GoogleUtilities.xcframework.zip",
      checksum: "d700274cc7ce2067a41825419b096d3260e17974c581a0253f0a6fedde164630"
    ),
    .binaryTarget(
      name: "Libuv-gRPC",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/Libuv-gRPC.xcframework.zip",
      checksum: "39c6ea77debd34b601fa12a74b33e06094a51102c62744c71ad7bcde834c696e"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/SwiftProtobuf.xcframework.zip",
      checksum: "45368ccc4f0b1a6bc26591e75a228061aff7c15f59060e0b51b50d18e92ae1f2"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/UserMessagingPlatform.xcframework.zip",
      checksum: "3fa9428f6658163e77b11fe65a29a50b74a73b82a5c72eaf7d033d5f23593d06"
    ),
    .binaryTarget(
      name: "abseil",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/abseil.xcframework.zip",
      checksum: "6c2c3e97f17794cf156561957821a357e4a3f0b4becf47a830622981beafb02c"
    ),
    .binaryTarget(
      name: "gRPC-C++",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/gRPC-C++.xcframework.zip",
      checksum: "5bbcbb8e7923df2619357baad341388227cbf7b16bbad61feef95890528af8b8"
    ),
    .binaryTarget(
      name: "gRPC-Core",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/gRPC-Core.xcframework.zip",
      checksum: "e3771cf00a02efc6d85491ce979d4a84d3245247520a96ab8d6f43d71e9bd07c"
    ),
    .binaryTarget(
      name: "leveldb-library",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/leveldb-library.xcframework.zip",
      checksum: "f977f0df9a9e77d7893fa5bebadb7dd8f3dedabbcc32196696af4873c92e17d8"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/nanopb.xcframework.zip",
      checksum: "9660f11248879e99650df2bce2daff7e3adabb3f9311273ecba6e1389f3c78d8"
    )
  ]
)
    
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
        .target(name: "FirebaseAppDistribution", condition: .when(platforms: [.iOS]))
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
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/AppAuth.xcframework.zip",
      checksum: "b9db33182a8ecc082f2750af15dfd3038e7f8746eaa32133fc8a939cb1bb52a2"
    ),
    .binaryTarget(
      name: "BoringSSL-GRPC",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/BoringSSL-GRPC.xcframework.zip",
      checksum: "75993dea1ef72fd8069bfd8abd0b3adf382a571d9bc781c9760605430b0ce369"
    ),
    .binaryTarget(
      name: "FBLPromises",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/FBLPromises.xcframework.zip",
      checksum: "0d2403276066c8d06208b71caadfdc9934022f400142686df1c863528888f364"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/FirebaseABTesting.xcframework.zip",
      checksum: "77f84256441f4748220b0ec98545ec093731f0275df349d5d02ddbb87c519eec"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/FirebaseAnalytics.xcframework.zip",
      checksum: "1a934dd6983ac773f7549a20217f222e838dad7a72cc6cf49adf6e8cc00db84b"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "b29be9a10a616b98de64f4d95376b11a7a200e6ad058db3218e8efec8358fa92"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "cac9d66a6c60f8641c084948f6eefee6edc09e28b680fa85d447fc088d3c9de8"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/FirebaseAppCheck.xcframework.zip",
      checksum: "2020d897790ef3cdfb7d39a8e5cf9299f1354255197d6a037dfcb967e741c514"
    ),
    .binaryTarget(
      name: "FirebaseAppCheckInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/FirebaseAppCheckInterop.xcframework.zip",
      checksum: "c197a7560e31811d63131cb741902efcfadac8a1cc9a89e8eac11872dda03f41"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/FirebaseAppDistribution.xcframework.zip",
      checksum: "1f838540b5cf61c01518193745565242ac82e8238a8df618e89b17e661a4d51e"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/FirebaseAuth.xcframework.zip",
      checksum: "9048e2e1f232a74a7dbf3173b89e8dc8995687f43d5a08d8eaa1c6a6e3adaa13"
    ),
    .binaryTarget(
      name: "FirebaseAuthInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/FirebaseAuthInterop.xcframework.zip",
      checksum: "6d70783ad0e251e1d6f2bfe01901293f85c7cd23f64088db9730d981d8fbd6fe"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/FirebaseCore.xcframework.zip",
      checksum: "186196c24e64a410e59902dc2c06b7a4b22e9182e3cf8a432b900a9eb7309c79"
    ),
    .binaryTarget(
      name: "FirebaseCoreExtension",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/FirebaseCoreExtension.xcframework.zip",
      checksum: "12412ee050bc220ea1bf3c6c943c93895f1c27c640180804ac1fa4f925150d30"
    ),
    .binaryTarget(
      name: "FirebaseCoreInternal",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/FirebaseCoreInternal.xcframework.zip",
      checksum: "39ddec5f1ceaab5b6c1f197eead60e7735f75a75d02d15a140d8773d480868e5"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/FirebaseCrashlytics.xcframework.zip",
      checksum: "fecdac8f2fcd036e45951d50e1c0557bd505558cbaaee0016b7d3553b969b193"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/FirebaseDatabase.xcframework.zip",
      checksum: "79d638f4ebfb02cdd8e7f5b833c84a8f0203b10ff01bc5627a4bcc2a6d741acf"
    ),
    .binaryTarget(
      name: "FirebaseDatabaseSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/FirebaseDatabaseSwift.xcframework.zip",
      checksum: "ddff7f01808b67a8588b9d0331067bc84f842d5f467beb22c3047b3658c99c58"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/FirebaseDynamicLinks.xcframework.zip",
      checksum: "4ad45746be7e262014b3567fc410024420df908445c7c4d6cffd612b4744ed4c"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/FirebaseFirestore.xcframework.zip",
      checksum: "90b4b05d0103eee5ab7373c866a4bc4dc9ead457d979b38d18f1d3aadbaaa0f3"
    ),
    .binaryTarget(
      name: "FirebaseFirestoreSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/FirebaseFirestoreSwift.xcframework.zip",
      checksum: "154497da22000bd14d402c2f353b61582f87b1f8069e81104d47d76df77cdf70"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/FirebaseFunctions.xcframework.zip",
      checksum: "f402209bd17b4eaa55084c332bb2845a8493584a562f26de787e6de6490fd5b3"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/FirebaseInAppMessaging.xcframework.zip",
      checksum: "0c81060d62d9ab9c4fdc2e056550c35bea0d4e9c2bab459fc1a2a26c9eb086fb"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessagingSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "1d751de5441551d0c9829472405f8e223d3db5a6fa125d1c3bd109a9d5f3e32d"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/FirebaseInstallations.xcframework.zip",
      checksum: "28a4faaf0f5e071fd955dbdcaaecc4c5e102cf893ebf6fdb317e2f6400c172e2"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "796cb64011579a66bbe94a69d1b0b070769220779cf3af1d620f2455bdaeb27e"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/FirebaseMessaging.xcframework.zip",
      checksum: "d7c86bf826de485cbd56762effd3f20d42a8b79c568c6ff75236a497cdc1361f"
    ),
    .binaryTarget(
      name: "FirebaseMessagingInterop",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/FirebaseMessagingInterop.xcframework.zip",
      checksum: "bbb0370966d2055f84e66c9150cfc38caa19ce565c775c339e4e95357f3000bb"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/FirebasePerformance.xcframework.zip",
      checksum: "ab00df47435f1051b1ca688fc57ff440e2b1ea40853d4540f76feb7487da4de8"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/FirebaseRemoteConfig.xcframework.zip",
      checksum: "eba24649a5e30bb0dd23b9efc5baf79378cc8511578cbb6184c26acfd33e093c"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfigSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "249495c1b3feba493d3060e59075375d39ea25eb226a60ba78bbb4f73911311f"
    ),
    .binaryTarget(
      name: "FirebaseSessions",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/FirebaseSessions.xcframework.zip",
      checksum: "7a8d1d249cb75c08b07570dda924a473e6764dee2f70495f904dd5fdf7439c58"
    ),
    .binaryTarget(
      name: "FirebaseSharedSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/FirebaseSharedSwift.xcframework.zip",
      checksum: "4caad1cf8ea9e9790057a6f3a848a55b31ff3b5a40e3d94a4fd2787e15684a3d"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/FirebaseStorage.xcframework.zip",
      checksum: "30818d44d6c9e502e4852ba481186f83dbc47be5246bbad2d8ea25595bbe7491"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/GTMAppAuth.xcframework.zip",
      checksum: "d6f652f4a99b2f1234e087a7d052015e2d66e58ca8089a28fac139776fbe7621"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/GTMSessionFetcher.xcframework.zip",
      checksum: "e864883d3e3e22748b68f7da8d920b07373de9443e9af59fcf8f52b7cc4da634"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/GoogleAppMeasurement.xcframework.zip",
      checksum: "ece55e5d522c4a81845be01fd3cbd2823b453b97ce3df71c2fdb0284d9db5ca6"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "425dcbf4e79208b0f4761ef0d8a49c6e54df4ef1838e11eda01db79dce81fe59"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "8a1893424e0132d2854f29b390680e4377b30415580cff018e027023049a23e8"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/GoogleDataTransport.xcframework.zip",
      checksum: "16624eb84dbb42f9bc14e130d95e840538fb66fa7d29739bcfbe0d65308b4dd8"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/GoogleMobileAds.xcframework.zip",
      checksum: "63ac421afb579c49c040a88f74b46cc3941f7f59ceee1c118406b1c987e8b4bf"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/GoogleSignIn.xcframework.zip",
      checksum: "947cba76609b525bd067524ecd1e3c3149223cdca6b5444ae3b43ba7613051ab"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/GoogleUtilities.xcframework.zip",
      checksum: "416bc357b39273d0c1b4e51fa362f86b8b4cd96fe974ace594c9c0928840d173"
    ),
    .binaryTarget(
      name: "Libuv-gRPC",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/Libuv-gRPC.xcframework.zip",
      checksum: "23a9c7b916ac95cd77093bad327d5da0c2464fe642cd5142eaf8199b71dad915"
    ),
    .binaryTarget(
      name: "PromisesSwift",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/PromisesSwift.xcframework.zip",
      checksum: "ea424bfedf698ad6a14d97ffaa30dd353c1cc18e81e27b800e734c7fd2f43232"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/SwiftProtobuf.xcframework.zip",
      checksum: "79309ac2e772073be3301c3e989d23189836ba26773a3b82f48680ba5c79da5a"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/UserMessagingPlatform.xcframework.zip",
      checksum: "32836440ee37e7cc21e7dae62ec34a9ec7fc82f28fd71666d4fe379b99391d55"
    ),
    .binaryTarget(
      name: "abseil",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/abseil.xcframework.zip",
      checksum: "381811721043f83ea17ededdea3910d4524d1ae96585d91007f9acc187ff98db"
    ),
    .binaryTarget(
      name: "gRPC-C++",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/gRPC-C++.xcframework.zip",
      checksum: "c7ca240ada246c9b290fc4d6477e9f3337cf7e40854862fcf70e2a193852d23c"
    ),
    .binaryTarget(
      name: "gRPC-Core",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/gRPC-Core.xcframework.zip",
      checksum: "e5f9a85e564b7c4fde2e073c353d6efc6459f23366fbf9931ce96ab0d5086b2f"
    ),
    .binaryTarget(
      name: "leveldb-library",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/leveldb-library.xcframework.zip",
      checksum: "92ce7e3abb47807eb733f22dc33c88234b8f6da607873c5e8938329486c9995d"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/nanopb.xcframework.zip",
      checksum: "676891b21e2bbdd39536fcb4b6fb58082dadd4147279d54b787f0df608f3aabd"
    )
  ]
)
    
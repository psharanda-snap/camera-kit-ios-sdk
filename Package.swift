// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "CameraKit",
    defaultLocalization: "en",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "SCSDKCameraKit", targets: ["SCSDKCameraKit"]),
        .library(name: "SCSDKCameraKitBaseExtension", targets: ["SCSDKCameraKitBaseExtension_Wrapper"]),
        .library(name: "SCSDKCameraKitLoginKitAuth", targets: ["SCSDKCameraKitLoginKitAuth_Wrapper"]),
        .library(name: "SCSDKCameraKitPushToDeviceExtension", targets: ["SCSDKCameraKitPushToDeviceExtension_Wrapper"]),
        .library(name: "SCSDKCameraKitReferenceUI", targets: ["SCSDKCameraKitReferenceUI"]),
        .library(name: "SCSDKCameraKitReferenceSwiftUI", targets: ["SCSDKCameraKitReferenceSwiftUI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Snapchat/snap-kit-spm", .upToNextMajor(from: "2.5.0"))
    ],
    targets: [
        .binaryTarget(
            name: "SCSDKCameraKit",
            url: "https://storage.googleapis.com/snap-kit-build/scsdk/camera-kit-ios/releases-spm/1.35.0/SCSDKCameraKit.xcframework.zip",
            checksum: "8337ef920d68a490464ee68282c741a60a208b03246627f73d5732f9784ceee2"
        ),
        
        .binaryTarget(
            name: "SCSDKCameraKitBaseExtension",
            url: "https://storage.googleapis.com/snap-kit-build/scsdk/camera-kit-ios/releases-spm/1.35.0/SCSDKCameraKitBaseExtension.xcframework.zip",
            checksum: "4549858012674c33af9ab5ee323f7d53e5ce8d46a5b04e46238005eeaf10437a"
        ),
        .target(
            name: "SCSDKCameraKitBaseExtension_Wrapper",
            dependencies: [
                .target(name: "SCSDKCameraKitBaseExtension"),
                .target(name: "SCSDKCameraKit")
            ],
            path: "Sources/CameraKitBaseExtension_Wrapper"
        ),

        .binaryTarget(
            name: "SCSDKCameraKitLoginKitAuth",
            url: "https://storage.googleapis.com/snap-kit-build/scsdk/camera-kit-ios/releases-spm/1.35.0/SCSDKCameraKitLoginKitAuth.xcframework.zip",
            checksum: "dd3f4084f8e45a447ed5c70fcc7c34fd8fa3dca0280d56a5c2fbfc9c94e66605"
        ),
        .target(
            name: "SCSDKCameraKitLoginKitAuth_Wrapper",
            dependencies: [
                .target(name: "SCSDKCameraKitLoginKitAuth"),
                .target(name: "SCSDKCameraKit"),
                .product(name: "SnapSDK", package: "snap-kit-spm")
            ],
            path: "Sources/CameraKitLoginKitAuth_Wrapper"
        ),

        .binaryTarget(
            name: "SCSDKCameraKitPushToDeviceExtension",
            url: "https://storage.googleapis.com/snap-kit-build/scsdk/camera-kit-ios/releases-spm/1.35.0/SCSDKCameraKitPushToDeviceExtension.xcframework.zip",
            checksum: "7fcc72208134d184752d7562f9ab13817c4006fa74346981734c39885c022003"
        ),
        .target(
            name: "SCSDKCameraKitPushToDeviceExtension_Wrapper",
            dependencies: [
                .target(name: "SCSDKCameraKitPushToDeviceExtension"),
                .target(name: "SCSDKCameraKitBaseExtension_Wrapper"),
            ],
            path: "Sources/CameraKitPushToDeviceExtension_Wrapper"
        ),
                
        .target(name: "SCSDKCameraKitReferenceUI", dependencies: ["SCSDKCameraKit"], path: "Sources/SCSDKCameraKitReferenceUI"),
        .target(name: "SCSDKCameraKitReferenceSwiftUI", dependencies: ["SCSDKCameraKitReferenceUI"], path: "Sources/SCSDKCameraKitReferenceSwiftUI")
    ]
)

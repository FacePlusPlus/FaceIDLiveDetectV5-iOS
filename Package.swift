// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "FaceIDLiveDetectV5",
    
    platforms: [
        .iOS(.v12)
    ],
    
    products: [
        .library(
            name: "FaceIDLiveDetectV5CN",
            targets: ["MegLiveV5DetectCN",
                      "BundleResources"]
        ),
        .library(
            name: "FaceIDLiveDetectV5CNLite",
            targets: ["MegLiveV5DetectCNLite",
                      "BundleResources"]
        ),
        .library(
            name: "FaceIDLiveDetectV5Global",
            targets: ["MegLiveV5DetectGlobal",
                      "BundleResources"]
        ),
        .library(
            name: "FaceIDLiveDetectV5GlobalLite",
            targets: ["MegLiveV5DetectGlobalLite",
                      "BundleResources"]
        )
    ],
    
    targets: [
        .binaryTarget(
            name: "MGFaceIDBaseKitBinary",
            url: "https://bj-csg-prod-client.oss-cn-beijing.aliyuncs.com/FaceID_V5/SPM/V5.8.19/MegLiveV5Base.zip",
            checksum: "5a4162722e0bad96be114aee5ce909bbc769cf1ad8ce9e43635cafc91e9dc69f"
        ),
        .binaryTarget(
            name: "MegLiveV5DetectCNBinary",
            url: "https://bj-csg-prod-client.oss-cn-beijing.aliyuncs.com/FaceID_V5/SPM/V5.8.19/MegLiveV5DetectCN.zip",
            checksum: "a85d86c1f180d84a8168d5e3417cd9941b6bb5266ea6eed53f89b5b570a896b1"
        ),
        .binaryTarget(
            name: "MegLiveV5DetectCNLiteBinary",
            url: "https://bj-csg-prod-client.oss-cn-beijing.aliyuncs.com/FaceID_V5/SPM/V5.8.19/MegLiveV5DetectCNLite.zip",
            checksum: "2a31c1cd13164dfb6e79fef36a493a8de25f5341a96e3299b23fe9b0f34114a6"
        ),
        .binaryTarget(
            name: "MegLiveV5DetectGlobalBinary",
            url: "https://bj-csg-prod-client.oss-cn-beijing.aliyuncs.com/FaceID_V5/SPM/V5.8.19/MegLiveV5DetectGlobal.zip",
            checksum: "72c699bf6807e8d7671c8ff781be51492c41ac4ae2a75ab3c1a877a7b938dc4b"
        ),
        .binaryTarget(
            name: "MegLiveV5DetectGlobalLiteBinary",
            url: "https://bj-csg-prod-client.oss-cn-beijing.aliyuncs.com/FaceID_V5/SPM/V5.8.19/MegLiveV5DetectGlobalLite.zip",
            checksum: "460e50a26257c3d9141a5a3e241e114ee67bb878c9a1c2730f2cab9a3d730f31"
        ),
        .target(
            name: "MGFaceIDBaseKit",
            dependencies: [
                "MGFaceIDBaseKitBinary"
            ],
            path: "Sources/MGFaceIDBaseKit",
            linkerSettings: [
                .linkedFramework("AVFoundation"),
            ]
        ),
        .target(
            name: "MegLiveV5DetectCN",
            dependencies: [
                "MGFaceIDBaseKit",
                "MegLiveV5DetectCNBinary"
            ],
            path: "Sources/MegLiveV5DetectCN",
            linkerSettings: [
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreMotion"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("MediaPlayer"),
                .linkedFramework("WebKit"),
                .linkedFramework("SystemConfiguration"),
                .linkedLibrary("z")
            ]
        ),
        .target(
            name: "MegLiveV5DetectCNLite",
            dependencies: [
                "MGFaceIDBaseKit",
                "MegLiveV5DetectCNLiteBinary"
            ],
            path: "Sources/MegLiveV5DetectCNLite",
            linkerSettings: [
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreMotion"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("MediaPlayer"),
                .linkedFramework("WebKit"),
                .linkedFramework("SystemConfiguration"),
                .linkedLibrary("z")
            ]
        ),
        .target(
            name: "MegLiveV5DetectGlobal",
            dependencies: [
                "MGFaceIDBaseKit",
                "MegLiveV5DetectGlobalBinary"
            ],
            path: "Sources/MegLiveV5DetectGlobal",
            linkerSettings: [
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreMotion"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("MediaPlayer"),
                .linkedFramework("WebKit"),
                .linkedFramework("SystemConfiguration"),
                .linkedLibrary("z")
            ]
        ),
        .target(
            name: "MegLiveV5DetectGlobalLite",
            dependencies: [
                "MGFaceIDBaseKit",
                "MegLiveV5DetectGlobalLiteBinary"
            ],
            path: "Sources/MegLiveV5DetectGlobalLite",
            linkerSettings: [
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreMotion"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("MediaPlayer"),
                .linkedFramework("WebKit"),
                .linkedFramework("SystemConfiguration"),
                .linkedLibrary("z")
            ]
        ),
        .target(
            name: "BundleResources",
            resources: [
                .copy("MegLiveV5Detect.bundle")
            ]
        )
    ]
)

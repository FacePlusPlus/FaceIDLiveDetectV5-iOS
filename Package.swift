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
            url: "https://bj-csg-prod-client.oss-cn-beijing.aliyuncs.com/FaceID_V5/SPM/V5.8.18/MegLiveV5Base.zip",
            checksum: "3b54e40f592c00089c8ace35882d00c898edffaaf9fb3c7e5dad087633bab2d2"
        ),
        .binaryTarget(
            name: "MegLiveV5DetectCNBinary",
            url: "https://bj-csg-prod-client.oss-cn-beijing.aliyuncs.com/FaceID_V5/SPM/V5.8.18/MegLiveV5DetectCN.zip",
            checksum: "a53fc0fc21ed586a80816227c2b166098a7eb9a9b1382a0ef208b0a6ee911a92"
        ),
        .binaryTarget(
            name: "MegLiveV5DetectCNLiteBinary",
            url: "https://bj-csg-prod-client.oss-cn-beijing.aliyuncs.com/FaceID_V5/SPM/V5.8.18/MegLiveV5DetectCNLite.zip",
            checksum: "b55d4335bb02d9321f741d8c367be80588452d4f480dd748f892248a795b8bbb"
        ),
        .binaryTarget(
            name: "MegLiveV5DetectGlobalBinary",
            url: "https://bj-csg-prod-client.oss-cn-beijing.aliyuncs.com/FaceID_V5/SPM/V5.8.18/MegLiveV5DetectGlobal.zip",
            checksum: "fc92be62963523f1299906284a570511ae50dd8596552ea35bfd8bb05b0e172b"
        ),
        .binaryTarget(
            name: "MegLiveV5DetectGlobalLiteBinary",
            url: "https://bj-csg-prod-client.oss-cn-beijing.aliyuncs.com/FaceID_V5/SPM/V5.8.18/MegLiveV5DetectGlobalLite.zip",
            checksum: "b3cadd217ae61fae236851922e4a47a00d013a6c60fdf6e39981cce28c4490c6"
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

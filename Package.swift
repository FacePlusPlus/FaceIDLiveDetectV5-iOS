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
            url: "https://bj-csg-prod-client.oss-cn-beijing.aliyuncs.com/FaceID_V5/SPM/V5.8.19.3/MegLiveV5Base.zip",
            checksum: "51d2f60a2dc7b809e919769f269f10a855b6d1a001f07791d97bfa9960462179"
        ),
        .binaryTarget(
            name: "MegLiveV5DetectCNBinary",
            url: "https://bj-csg-prod-client.oss-cn-beijing.aliyuncs.com/FaceID_V5/SPM/V5.8.19.3/MegLiveV5DetectCN.zip",
            checksum: "d11d6d122e5d591f6589ae87f898f85257bba1bc3899ccf00db26eaccada153d"
        ),
        .binaryTarget(
            name: "MegLiveV5DetectCNLiteBinary",
            url: "https://bj-csg-prod-client.oss-cn-beijing.aliyuncs.com/FaceID_V5/SPM/V5.8.19.3/MegLiveV5DetectCNLite.zip",
            checksum: "b75aa922a7e9604722569541fc706c727cd0cd6127198a70983c677545655f8b"
        ),
        .binaryTarget(
            name: "MegLiveV5DetectGlobalBinary",
            url: "https://bj-csg-prod-client.oss-cn-beijing.aliyuncs.com/FaceID_V5/SPM/V5.8.19.3/MegLiveV5DetectGlobal.zip",
            checksum: "412831f09326b67be0884044d25f3776a04c363f0185ef38d5ba8b0be381befe"
        ),
        .binaryTarget(
            name: "MegLiveV5DetectGlobalLiteBinary",
            url: "https://bj-csg-prod-client.oss-cn-beijing.aliyuncs.com/FaceID_V5/SPM/V5.8.19.3/MegLiveV5DetectGlobalLite.zip",
            checksum: "226543bfcca114a983624013bdcac3477170a7b101ffd847101acd1eed23e994"
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

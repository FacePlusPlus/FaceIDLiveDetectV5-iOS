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
            url: "https://bj-csg-prod-client.oss-cn-beijing.aliyuncs.com/FaceID_V5/SPM/V5.8.17/MegLiveV5Base.zip",
            checksum: "8b0811e38dfd75b01f3db9636006a319020fe40b2a3f0e2835a18c43cbfac0a7"
        ),
        .binaryTarget(
            name: "MegLiveV5DetectCNBinary",
            url: "https://bj-csg-prod-client.oss-cn-beijing.aliyuncs.com/FaceID_V5/SPM/V5.8.17/MegLiveV5DetectCN.zip",
            checksum: "6c8f298d594a8aeb8a6ee2a2abdb29e01c0a2ffa54eda66b8989a81e09be47fe"
        ),
        .binaryTarget(
            name: "MegLiveV5DetectCNLiteBinary",
            url: "https://bj-csg-prod-client.oss-cn-beijing.aliyuncs.com/FaceID_V5/SPM/V5.8.17/MegLiveV5DetectCNLite.zip",
            checksum: "7ef318d7ab399bdc769518fea31271709ddeb8f80b93acf582403cd6dc41d5dd"
        ),
        .binaryTarget(
            name: "MegLiveV5DetectGlobalBinary",
            url: "https://bj-csg-prod-client.oss-cn-beijing.aliyuncs.com/FaceID_V5/SPM/V5.8.17/MegLiveV5DetectGlobal.zip",
            checksum: "640587069265ccf424eeaf0c47dc2b7246dd75f087284aac2793e1fb16d134e6"
        ),
        .binaryTarget(
            name: "MegLiveV5DetectGlobalLiteBinary",
            url: "https://bj-csg-prod-client.oss-cn-beijing.aliyuncs.com/FaceID_V5/SPM/V5.8.17/MegLiveV5DetectGlobalLite.zip",
            checksum: "69b2c5b581144e0eb853456f4ee8b079d4366126509b94cffcdf656e675b1b2f"
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

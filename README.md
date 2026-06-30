# FaceIDLiveDetectV5

FaceID 人脸活体检测 iOS SDK，支持 Swift Package Manager。

## 环境要求

- iOS 12.0+
- Xcode 15.0+
- Swift 5.9+

## 产品列表

本包提供四个版本，适用于不同地区：

| 产品 | 说明 | 适用场景 |
|--------|-------------|----------|
| `FaceIDLiveDetectV5CN` | 中国区完整版 | 中国大陆人脸核身 |
| `FaceIDLiveDetectV5CNLite` | 中国区轻量版，移除设备风险检测，陀螺仪垂直检测 | 中国大陆轻量级场景 |
| `FaceIDLiveDetectV5Global` | 全球版完整版 | 海外地区人脸核身 |
| `FaceIDLiveDetectV5GlobalLite` | 全球版轻量版，移除设备风险检测，陀螺仪垂直检测 | 海外地区轻量级场景 |

## 安装

### Swift Package Manager

**方式一：Xcode 图形化操作**

1. 在 Xcode 中选择 **File > Add Package Dependencies**
2. 输入仓库地址：`https://github.com/FacePlusPlus/FaceIDLiveDetectV5-SPM`
3. 选择你需要的产品：(本包的四个版本请根据自己的情况选择任意一个，多选会导致编译时符号重复)
   - 中国区：`FaceIDLiveDetectV5CN` 或 `FaceIDLiveDetectV5CNLite`
   - 全球区：`FaceIDLiveDetectV5Global` 或 `FaceIDLiveDetectV5GlobalLite`  
4. 点击 **Add Package**

**方式二：Package.swift 依赖声明**

```swift
dependencies: [
    .package(
        url: "https://github.com/FacePlusPlus/FaceIDLiveDetectV5-SPM",
        from: "5.8.16"
    )
]
```

然后在目标 target 中引入产品：

```swift
.product(name: "FaceIDLiveDetectV5CN", package: "FaceIDLiveDetectV5-SPM")
```

## 依赖的系统库

SDK 会自动链接以下系统框架：

- AVFoundation
- CoreMotion
- CoreTelephony
- MediaPlayer
- WebKit
- SystemConfiguration
- libz

## 隐私权限配置

在 `Info.plist` 中添加以下权限说明：

```xml
<key>NSCameraUsageDescription</key>
<string>摄像头权限用于人脸身份验证</string>
```

## 多语言支持特别说明
1. 项目中默认带了一份MegLiveV5Detect.bundle资源包，同时支持中文和英文。spm集成默认放到MainBundle-FaceIDLiveDetectV5_BundleResources.bundle中；
2. 如果要支持其他语言，请根据SDK接入文档中的多语言支持自定义相关资源。为了防止SDK在更新时覆盖掉自定义的资源，可以将MegLiveV5Detect.bundle放到MainBundle中或者其他路径下，在SDK初始化的时候，通过initConfigItem.bundleFilePath参数指定资源路径；
3. 增加多语言资源后，SDK初始化时指定initConfigItem.languageType可以使用int值进行类型转换，具体值需要配合`languageconfiguration.plist`中配置的enum；
4. 自定义资源路径后，为了优化MainBundle中的资源占用情况，可以删除掉BundleResources/MegLiveV5Detect.bundle中的内容，但是不要删除bundle本身；
5. 除了语言资源，bundle包中还有模型资源，模型资源会在初始化的时候进行校验，校验不通过也会进行报错，提示需要更新模型。


## 快速接入


```swift
import MegLiveV5Detect
```
```OC
#import <MegLiveV5Detect/MegLiveV5Detect.h>
```

本文档仅用于Swift Package Manager的集成接入说明，具体的SDK功能使用请参考SDK接入文档。

## SDK 版本

当前版本：**5.8.17**

## 更新日志

### 5.8.17
- 首次发布 SPM 版本
- 支持中国区和全球区版本
- 提供完整版和轻量版

## 许可证

Copyright © 2026. All rights reserved.

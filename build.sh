#!/bin/bash

# 参数赋值
VERSION=$1
FACEID_SDK_DIR="MegLiveStill_${1}DP_I"

cd oss

rm -rf MegLiveV5Base
mkdir MegLiveV5Base
rm -rf MegLiveV5DetectCN 
mkdir MegLiveV5DetectCN
rm -rf MegLiveV5DetectCNLite 
mkdir MegLiveV5DetectCNLite
rm -rf MegLiveV5DetectGlobal
mkdir MegLiveV5DetectGlobal
rm -rf MegLiveV5DetectGlobalLite 
mkdir MegLiveV5DetectGlobalLite

cp -cr ./output/FaceID/GuoNei/$FACEID_SDK_DIR/iOS/标准版/sdk/xcframework/nocodesign/MGFaceIDBaseKit.xcframework ./MegLiveV5Base
cp -cr ./output/FaceID/GuoNei/$FACEID_SDK_DIR/iOS/标准版/sdk/xcframework/nocodesign/MegLiveV5Detect.xcframework ./MegLiveV5DetectCN
cp -cr ./output/FaceID/GuoNei/$FACEID_SDK_DIR/iOS/纯净版/sdk/xcframework/nocodesign/MegLiveV5Detect.xcframework ./MegLiveV5DetectCNLite
cp -cr ./output/FaceID/HaiWai/$FACEID_SDK_DIR/iOS/Standard/sdk/xcframework/nocodesign/MegLiveV5Detect.xcframework ./MegLiveV5DetectGlobal
cp -cr ./output/FaceID/HaiWai/$FACEID_SDK_DIR/iOS/Basic/sdk/xcframework/nocodesign/MegLiveV5Detect.xcframework ./MegLiveV5DetectGlobalLite

zip -r MegLiveV5Base.zip MegLiveV5Base
zip -r MegLiveV5DetectCN.zip MegLiveV5DetectCN
zip -r MegLiveV5DetectCNLite.zip MegLiveV5DetectCNLite
zip -r MegLiveV5DetectGlobal.zip MegLiveV5DetectGlobal
zip -r MegLiveV5DetectGlobalLite.zip MegLiveV5DetectGlobalLite

BASE_CHECKSUM=$(swift package compute-checksum MegLiveV5Base.zip)
CN_CHECKSUM=$(swift package compute-checksum MegLiveV5DetectCN.zip)
CN_LITE_CHECKSUM=$(swift package compute-checksum MegLiveV5DetectCNLite.zip)
GLOBAL_CHECKSUM=$(swift package compute-checksum MegLiveV5DetectGlobal.zip)
GLOBAL_LITE_CHECKSUM=$(swift package compute-checksum MegLiveV5DetectGlobalLite.zip)

cd ..
rm -rf Package.swift
cp Package.swift.template Package.swift

sed -i '' "s/\${VERSION}/$VERSION/g" Package.swift
sed -i '' "s/\${BASE_CHECKSUM}/$BASE_CHECKSUM/g" Package.swift
sed -i '' "s/\${CN_CHECKSUM}/$CN_CHECKSUM/g" Package.swift
sed -i '' "s/\${CN_LITE_CHECKSUM}/$CN_LITE_CHECKSUM/g" Package.swift
sed -i '' "s/\${GLOBAL_CHECKSUM}/$GLOBAL_CHECKSUM/g" Package.swift
sed -i '' "s/\${GLOBAL_LITE_CHECKSUM}/$GLOBAL_LITE_CHECKSUM/g" Package.swift

rm -rf ./Sources/BundleResources/MegLiveV5Detect.bundle
cp -cr ./oss/output/FaceID/GuoNei/$FACEID_SDK_DIR/iOS/标准版/resource/ ./Sources/BundleResources/
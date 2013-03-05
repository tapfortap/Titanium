#!/bin/sh

# Licensed under the MIT license
# http://htmlpreview.github.com/?https://github.com/tapfortap/Documentation/blob/master/License.html
# Copyright (c) 2013 Tap for Tap 

VERSION="1.0.0"

cd "$(dirname $0)"

ANDROID_FILE=android/src/com/tapfortap/ti/TapForTapProxy.java
IOS_FILE=ios/Classes/TapForTapProxies/ComTapfortapTiTapForTapProxy.m

# Update the Plugin Version numbers in the native files
sed -i '' "s/.*TapForTap.pluginVersion.*/        TapForTap.pluginVersion = \"$VERSION\";/" $ANDROID_FILE
sed -i '' "s/.*TapForTap performSelector: @selector(_setPluginVersion:).*/    [TapForTap performSelector: @selector(_setPluginVersion:) withObject: @\"$VERSION\"];/" $IOS_FILE

sed -i '' "s/.*version: 1.0.*/version: $VERSION/" android/manifest
sed -i '' "s/.*version: 1.0.*/version: $VERSION/" ios/manifest

if [ -f update_native_libraries ]; then
	./update_native_libraries
fi

rm -rf release
mkdir release

android/release.sh
ios/release.sh

cp android/release/* release
cp ios/release/* release

cd release
zip TapForTap-Titanium-"$VERSION".zip ./*

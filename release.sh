#!/bin/sh

# Licensed under the MIT license
# http://htmlpreview.github.com/?https://github.com/tapfortap/Documentation/blob/master/License.html
# Copyright (c) 2013 Tap for Tap

VERSION="1.2.0"

cd "$(dirname $0)"

ANDROID_FILE=android/src/com/tapfortap/ti/TapForTapProxy.java
IOS_FILE=ios/Classes/TapForTapProxies/ComTapfortapTiTapForTapProxy.m

# Update the Plugin Version numbers in the native files
sed -i '' "s/.*TapForTap.PLUGIN_VERSION.*/        TapForTap.PLUGIN_VERSION = \"$VERSION\";/" $ANDROID_FILE
sed -i '' "s/.*TFTTapForTap performSelector: @selector(setPluginVersion:).*/    [TFTTapForTap performSelector: @selector(setPluginVersion:) withObject: @\"$VERSION\"];/" $IOS_FILE

sed -i '' "s/^version: .*$/version: $VERSION/" android/manifest
sed -i '' "s/^version: .*$/version: $VERSION/" ios/manifest

rm -rf release
mkdir release

android/release.sh
ios/release.sh

cp android/release/* release
cp ios/release/* release

cd release
zip TapForTap-Titanium-"$VERSION".zip ./*

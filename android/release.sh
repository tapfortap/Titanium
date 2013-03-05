#!/bin/sh

# Licensed under the MIT license
# http://htmlpreview.github.com/?https://github.com/tapfortap/Documentation/blob/master/License.html
# Copyright (c) 2013 Tap for Tap 

cd "$(dirname $0)"

rm -rf release
mkdir release

rm -rf libs/
ant clean
ant dist
cp dist/com.tapfortap.ti-android-*.zip release

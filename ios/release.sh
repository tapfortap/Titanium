#!/bin/sh

# Licensed under the MIT license
# http://htmlpreview.github.com/?https://github.com/tapfortap/Documentation/blob/master/License.html
# Copyright (c) 2013 Tap for Tap 

cd "$(dirname $0)"

rm -rf release
mkdir release

./build.py
mv com.tapfortap.ti-iphone* release

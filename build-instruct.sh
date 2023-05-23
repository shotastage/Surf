#!/usr/bin/env bash

# Check SDKs on macOS
ls `xcode-select -p`/Platforms/MacOSX.platform/Developer/SDKs

mkdir _cache_tmp_
cd _cache_tmp_

git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git

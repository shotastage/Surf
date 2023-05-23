#!/usr/bin/env bash

# Check SDKs on macOS
echo "Current installed SDKs:"
ls "$(xcode-select -p)"/Platforms/MacOSX.platform/Developer/SDKs


# Download and install depot tools
tmp_dir="_cache_tmp_"
depot_tools_dir="$HOME/.depot_tools/"

mkdir "$tmp_dir"
cd "$tmp_dir"

git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
mv depot_tools "$depot_tools_dir"

cd ..
rm -rf "$tmp_dir"

echo "Depot Tools is successfully installed."
echo "Please set the following path config."

# Set path
export PATH="$PATH:$depot_tools_dir"
cd chromium

# Get Chromium source code
caffeinate fetch chromium

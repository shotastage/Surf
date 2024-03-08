#!/usr/bin/env python

import os

# Download and install depot tools
tmp_dir="_cache_tmp_"
depot_tools_dir="$HOME/.depot_tools/"

if __name__ == "__main__":
    print("Current installed SDKs:")
    os.system("ls \"$(xcode-select -p)\"/Platforms/MacOSX.platform/Developer/SDKs")

#!/usr/bin/env python

import shutil
import os

PRE_BUILT_BINARY="https://cef-builds.spotifycdn.com/index.html#windows64"

# Download and install depot tools
tmp_dir="_cache_tmp_"
depot_tools_dir="$HOME/.depot_tools/"

if __name__ == "__main__":
    shutil.rmtree("Vendor/cef/")
    os.system("git clone https://bitbucket.org/chromiumembedded/cef.git")
    try:
        with open("Vendor/cef/.gitkeep", 'w') as file:
            pass
    except IOError as e:
        print(f"Failed to recover keep file: {e}")

    shutil.rmtree("Vendor/cef/.git/")

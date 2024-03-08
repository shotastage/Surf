#!/usr/bin/env python

import shutil
import os

# Download and install depot tools
tmp_dir="_cache_tmp_"
depot_tools_dir="$HOME/.depot_tools/"

if __name__ == "__main__":
    shutil.rmtree("cef")
    os.system("git clone https://shotastage@bitbucket.org/chromiumembedded/cef.git")
    try:
        with open("cef/.gitkeep", 'w') as file:
            pass
    except IOError as e:
        print(f"Failed to recover keep file: {e}")

    shutil.rmtree("cef/.git/")

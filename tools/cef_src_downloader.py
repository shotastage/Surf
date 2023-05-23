#!/usr/bin/env python

import os

# Download and install depot tools
tmp_dir="_cache_tmp_"
depot_tools_dir="$HOME/.depot_tools/"

if __name__ == "__main__":
    os.system("git clone https://shotastage@bitbucket.org/chromiumembedded/cef.git")

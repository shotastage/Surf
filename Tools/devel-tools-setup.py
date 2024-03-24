#!/usr/bin/env python

import os
import platform
import sys

# Homebrew dependencies
HOMEBREW_DEPS = [
    "cmake",
    "swiftlint",
    "swiftformat",
    "swift-protobuf",
    "rust"
]

if __name__ == "__main__":
    # Check if the OS is macOS, abort if not.
    if platform.system().lower() != "darwin":
        print("This script can only be run on macOS.")
        sys.exit(1)

    os.system("brew update")

    for dep in HOMEBREW_DEPS:
        os.system("brew install " + dep)

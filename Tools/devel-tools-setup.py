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
    "clang-format",
    "pre-commit"
]

APT_PACKAGE_DEPS = [
    "cmake"
]

if __name__ == "__main__":
    # Check if the OS is macOS, abort if not.
    os_name = platform.system().lower()
    if os_name not in ("darwin", "linux"):
        print("This script can only be run on macOS or Linux.")
        sys.exit(1)

    if os_name == "darwin":
        os.system("brew update")

        # Install dependencies
        for dep in HOMEBREW_DEPS:
            os.system("brew install " + dep)

    if os_name == "Linux":
        print("Currently this platform is not fully supported!")
        os.system("sudo apt-get update -y")

        for dep in APT_PACKAGE_DEPS:
            os.system("sudo apt install -y " + dep)

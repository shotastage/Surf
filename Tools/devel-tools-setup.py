#!/usr/bin/env python

import os
import platform
import sys
import urllib.request
import shutil
import subprocess


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

def download_file(url, filename):
    with urllib.request.urlopen(url) as response:
        with open(filename, 'wb') as out_file:
            out_file.write(response.read())

def sparkle_toolchain_setup():
    if os_name != "darwin":
        return

    download_file("https://github.com/sparkle-project/Sparkle/releases/download/2.6.0/Sparkle-2.6.0.tar.xz", "Sparkle-2.6.0.tar.xz")

    if os.path.isdir(".local"):
        shutil.move("Sparkle-2.6.0.tar.xz", ".local/")
    else:
        os.mkdir(".local")
        shutil.move("Sparkle-2.6.0.tar.xz", ".local/")
    os.mkdir(".local/sparkle")
    command = ['tar', '-xf', ".local/Sparkle-2.6.0.tar.xz", '-C', ".local/sparkle/"]
    result = subprocess.run(command, capture_output=True, text=True)

    if result.returncode == 0:
        print("Sparkle toolchain has been installed.")
    else:
        print("Failed to extract Sparkle package.")
        print("Message:", result.stderr)
    os.remove(".local/Sparkle-2.6.0.tar.xz")

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

        sparkle_toolchain_setup()

    if os_name == "Linux":
        print("Currently this platform is not fully supported!")
        os.system("sudo apt-get update -y")

        for dep in APT_PACKAGE_DEPS:
            os.system("sudo apt install -y " + dep)

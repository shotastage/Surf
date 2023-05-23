#!/usr/bin/env python

import os

# Homebrew dependencies
HOMEBREW_DEPS = [
    "cmake"
]

if __name__ == "__main__":
    os.system("brew update")

    for dep in HOMEBREW_DEPS:
        os.system("brew install " + dep)

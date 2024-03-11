#!/usr/bin/env python

import shutil
import os

def rm(path):
    try:
        if os.path.isdir(path):
            shutil.rmtree(path)
        else:
            os.remove(path)
    except OSError as e:
        pass


def clean_generated_config():
    print("Cleaning generated config files...")

    targets = [
        "./App/macOS/project.yml",
        ""
    ]

    for target in targets:
        rm(target)


if __name__ == "__main__":
    rm('target')
    rm('Vendor/Chromium/.cipd/')
    rm('Vendor/Chromium/.gclient')
    rm('Vendor/cef')

    rm('Vendor/cef')
    os.mkdir('Vendor/cef')
    try:
        with open("Vendor/cef/.gitkeep", 'w') as file:
            pass
    except IOError as e:
        print(f"Failed to recover keep file: {e}")

    clean_generated_config()

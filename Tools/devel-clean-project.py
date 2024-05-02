#!/usr/bin/env python

import shutil
import os

def rm(path):
    """
    Removes a file or directory at the given path if it exists.

    Args:
        path (str): The path to the file or directory to remove.
    """
    try:
        if os.path.isdir(path):
            shutil.rmtree(path)
        elif os.path.isfile(path):
            os.remove(path)
    except OSError as e:
        print(f"Error removing {path}: {e.strerror}")

def clean_paths(paths):
    """
    Cleans the given list of files and directories.

    Args:
        paths (list): A list of file or directory paths to remove.
    """
    for path in paths:
        rm(path)

if __name__ == "__main__":
    # Cleaning Chromium dependencies
    chromium_deps = [
        'Vendor/Chromium/.cipd/',
        'Vendor/Chromium/.gclient',
        'target'
    ]
    clean_paths(chromium_deps)

    # Cleaning CEF components
    cef_components = ['Vendor/cef']
    clean_paths(cef_components)

    # Cleaning generated config files
    generated_configs = [
        "./App/macOS/project.yml"
    ]
    clean_paths(generated_configs)

    print("Cleaning process completed.")

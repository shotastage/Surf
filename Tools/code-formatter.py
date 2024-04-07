#!/usr/bin/env python

import shutil
import os

PROJ_BACKUP_FOLDER = "./.proj_backup/"

def _format_swift_code():
    os.system("swiftformat ./App")
    os.system("swiftformat ./Source")

def _format_cpp():
    os.system("find ./Source/ \( -name "*.cpp" -o -name "*.hpp" \) -exec clang-format -i {} +")

if __name__ == "__main__":
    _format_swift_code()
    _format_cpp()

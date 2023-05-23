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

if __name__ == "__main__":
    rm('target')
    rm('chromium/.cipd/')
    rm('chromium/.gclient')

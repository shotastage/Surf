#!/usr/bin/env python

import os

PROJ_BACKUP_FOLDER = "./.proj_backup/"


def format_swift_code():
    os.system("swiftformat ./App")
    os.system("swiftformat ./Source")

def format_cpp():
    os.system("find ./Source/ \\( -name \"*.cpp\" -o -name \"*.hpp\" \\) -exec clang-format -i {} +")


def _get_license_text(file_name):
    return f"""//
// {file_name}
//
// Copyright © 2024 Shota Shimazu. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//	https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
\n
"""

def _add_license_to_file(file_path):
    file_name = os.path.basename(file_path)
    print("Formatting " + file_name + "...")
    with open(file_path, 'r+') as file:
        original_content = file.read()
        
        if "Licensed under the Apache License" in original_content:
            return
        
        license_text = _get_license_text(file_name)
        file.seek(0, 0)
        file.write(license_text.rstrip('\r\n') + '\n' + original_content)


def add_license_to_dir(directory):
    extensions = ('.hpp', '.cpp')

    for root, dirs, files in os.walk(directory):
        for file in files:
            if file.endswith(extensions):
                _add_license_to_file(os.path.join(root, file))


if __name__ == "__main__":
    format_swift_code()
    add_license_to_dir("./Source/")
    format_cpp()

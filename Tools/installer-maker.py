#!/usr/bin/env python

import shutil
import os

def zip_directory(directory_path, output_filename):
    """
    Compresses the specified directory into ZIP format.

    Parameters:
    directory_path (str): The path of the directory to compress.
    output_filename (str): The name of the generated ZIP file (including path).
    """
    # Execute the compression
    shutil.make_archive(output_filename, 'zip', directory_path, compresslevel=9)

if __name__ == "__main__":
    # Create PROJ_BACKUP_FOLDER directory if it does not exist.

    os.system("xcodebuild -project ./App/macOS/Surf.xcodeproj -scheme Surf -configuration Release -exportArchive -exportPath ./Surf.app")
    #zip_directory("./App/macOS/Surf.xcodeproj", PROJ_BACKUP_FOLDER + "Surf_macOS_Profile")

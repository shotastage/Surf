//
// SSTable.cpp
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
#include "SSTable.hpp"

string SSTable::exportFilePath;

void SSTable::writeSSTable(const vector<Entry>& entries) {
  ofstream file(exportFilePath, ios::binary);

  if (!file.is_open()) {
    // errc << "Failed to open file for writing: " << filename << endl;

    return;
  }
}

bool SSTable::readSSTable(const std::string& key, std::vector<uint8_t>& value) {
  // Open the file
  // ...

  // Find the value corresponding to the key
  // ...

  // Read the value
  // ...

  // Close the file
  // ...
  return true;
}

// Set export file path
void SSTable::setExportPath(const string& filename) {
  exportFilePath = filename;
}

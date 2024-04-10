//
// SSTable.hpp
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
#pragma once

#include <iostream>
#include <string>
#include <vector>

#include "BinaryFormat.hpp"

using namespace std;

/**
 * SSTable class
 *
 * SSTable (Sorted String Table) is a data structure that stores key-value pairs
 * in sorted order. This class provides functionality to write and read data to
 * a file.
 */
class SSTable {
 public:
  /**
   * Writes a list of entries to an SSTable file.
   *
   * @param entries The list of entries to write
   */
  static void writeSSTable(const vector<Entry>& entries);

  /**
   * Reads the value corresponding to a given key.
   *
   * @param key The key to read
   * @param value The buffer to store the read value
   * @return True on success, false on failure
   */
  static bool readSSTable(const string& key, vector<uint8_t>& value);

  /**
   * Sets the path to the file to write to.
   *
   * @param filename The path to the file to write to
   */
  void setExportPath(const string& filename);

 private:
  /**
   * The path to the file to write to
   */
  static string exportFilePath;
};

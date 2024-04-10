//
// MemTable.hpp
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

#include <algorithm>
#include <fstream>
#include <iostream>
#include <map>
#include <string>
#include <vector>

#include "BinaryFormat.hpp"

using namespace std;

/**
 * MemTable class
 *
 * MemTable is a simple in-memory key-value store.
 * It uses a `std::map` to store the data.
 */
class MemTable {
 public:
  /**
   * Puts a key-value pair into the MemTable.
   *
   * @param key The key to put
   * @param entry The value to put
   */
  void put(const string& key, Entry& entry);

  /**
   * Gets the value associated with a given key from the MemTable.
   *
   * @param key The key to get
   * @param entry The value to store the result
   * @return True if the key was found, false otherwise
   */
  bool get(const string& key, Entry& entry);

 private:
  /**
   * The map used to store the data
   */
  map<string, Entry> table;
};

//
// MemTable.cpp
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

#include "MemTable.hpp"

void MemTable::put(const string& key, Entry& entry) {
  table[key] = entry;
}

bool MemTable::get(const string& key, Entry& entry) {
  auto it = table.find(key);
  if (it != table.end()) {
    entry = it->second;
    return true;
  }
  return false;
}

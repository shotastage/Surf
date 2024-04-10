//
// SimpleBackend.cpp
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

#include "SimpleBackend.hpp"

// Insert or update a value
void SimpleBackend::set(const std::string& key, const std::string& value) {
  store[key] = value;
}

// Get a value
std::string SimpleBackend::get(const std::string& key) {
  if (store.find(key) != store.end()) {
    return store[key];
  }
  return "";  // In case the key does not exist
}

// Delete a key
bool SimpleBackend::remove(const std::string& key) {
  if (store.find(key) != store.end()) {
    store.erase(key);
    return true;
  }
  return false;
}

// Check if a key exists
bool SimpleBackend::contains(const std::string& key) {
  return store.find(key) != store.end();
}

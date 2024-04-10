//
// BinaryFormat.cpp
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

#include "BinaryFormat.hpp"

// Write Entry to file
void Entry::writeToFile(ofstream& file) const {
  file.write(reinterpret_cast<const char*>(&type), sizeof(type));
  file.write(reinterpret_cast<const char*>(&key_length), sizeof(key_length));
  file.write(key.data(), key_length);
  file.write(reinterpret_cast<const char*>(&value_length),
             sizeof(value_length));
  file.write(reinterpret_cast<const char*>(value.data()), value_length);
}

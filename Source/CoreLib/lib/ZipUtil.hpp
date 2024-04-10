//
// ZipUtil.hpp
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

#include <zlib.h>

#include <fstream>
#include <iostream>
#include <sstream>
#include <string>

constexpr auto BUFFER_SIZE = 0x4000;

using namespace std;

class ZipUtil {
 public:
  static string extract(string& data);
  static string compress(string& data, const int level);
};

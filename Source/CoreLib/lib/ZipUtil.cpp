//
// ZipUtil.cpp
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
#include "ZipUtil.hpp"  // Include the header file for the ZipUtil class

using namespace std;

string ZipUtil::extract(string& data) {
  gzFile file = gzopen("compressed.zip", "rb");
  if (file == NULL) {
    cerr << "Can not open file." << endl;
    return 1;
  }

  struct gz_header header;
  gzread(file, &header, sizeof(header));
  return "__HELLO_DATA__";
}

string ZipUtil::compress(string& data, const int level) {
  return "__HELLO_DATA__";
}

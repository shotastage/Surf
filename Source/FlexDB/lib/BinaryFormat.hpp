//
//  BinaryFormat.hpp
//
//
//  Created by Shota Shimazu on 2024/03/30.
//

#pragma once

#include <fstream>
#include <string>
#include <vector>

using namespace std;

struct Entry {
  uint8_t type;
  uint32_t key_length;
  string key;
  uint32_t value_length;
  vector<uint8_t> value;

  void writeToFile(ofstream& file) const;
};

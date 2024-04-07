//
//  BinaryFormat.cpp
//
//
//  Created by Shota Shimazu on 2024/03/30.
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

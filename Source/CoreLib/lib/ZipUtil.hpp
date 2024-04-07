// This file defines a class `URLParser` that can be used to parse a URL into
// its constituent parts.

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

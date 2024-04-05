// This file defines a class `URLParser` that can be used to parse a URL into its constituent parts.

#pragma once

#include <iostream>
#include <sstream>
#include <fstream>
#include <zlib.h>
#include <string>


constexpr auto BUFFER_SIZE = 0x4000;

using namespace std;

class ZipUtil {
public:
static string extract(string &data);
static string compress(string &data, const int level);
};

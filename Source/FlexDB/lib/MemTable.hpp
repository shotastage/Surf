//
//  MemTable.hpp
//
//
//  Created by Shota Shimazu on 2024/03/30.
//
//  This code uses the `std::map` class from the STL to implement a simple
//  key-value store.

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

//
//  MemTable.hpp
//  
//
//  Created by Shota Shimazu on 2024/03/30.
//

#pragma once

#include <iostream>
#include <map>
#include <string>
#include <vector>


using namespace std;

struct Entry {
    uint8_t type;
    uint32_t key_length;
    string key;
    uint32_t value_length;
    vector<uint8_t> value;
};


class Memtable {
public:
    void put(const string& key, Entry& entry);
    bool get(const string& key, Entry& entry);

private:
    map<string, Entry> table;
};

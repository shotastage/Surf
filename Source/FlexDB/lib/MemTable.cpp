//
//  MemTable.cpp
//  
//
//  Created by Shota Shimazu on 2024/03/30.
//

#include "MemTable.hpp"

void Memtable::put(const string& key, Entry& entry) {
    table[key] = entry;
}

bool Memtable::get(const string& key, Entry& entry) {
    auto it = table.find(key);
    if (it != table.end()) {
        entry = it -> second;
        return true;
    }
    return false;
}

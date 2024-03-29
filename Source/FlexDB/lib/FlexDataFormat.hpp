//
//  FlexDataFormat.hpp
//  
//
//  Created by Shota Shimazu on 2024/03/29.
//

#pragma once

#include <string>
#include <vector>
#include <iostream>

struct Entry {
    uint8_t type;
    uint32_t key_length;
    std::string key;
    uint32_t value_length;
    std::vector<uint8_t> value;
};

void WriteEntry(const Entry& entry, std::ostream& out);
Entry ReadEntry(std::istream& in);
void WriteTimestamp(uint64_t timestamp, std::ostream& out);
uint64_t ReadTimestamp(std::istream& in);

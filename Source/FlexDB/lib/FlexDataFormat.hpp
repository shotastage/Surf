//
//  FlexDataFormat.hpp
//  
//
//  Created by Shota Shimazu on 2024/03/29.
//

#pragma once

#include <iostream>
#include <vector>

using namespace std;

struct Entry {
    uint8_t type;
    uint32_t key_length;
    uint32_t value_length;
    vector<uint8_t> value;
};

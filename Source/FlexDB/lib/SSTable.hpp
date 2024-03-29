#pragma once

#include <string>


class SSTable {
private:
    // No private properties
public:
    uint64_t timestamp;
    uint64_t size;
    uint64_t length;
};

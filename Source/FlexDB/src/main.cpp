// main.cpp

#include <iostream>
#include "FlexDB.hpp"

int main() {
    FlexDB db;

    db.set("key1", "value1");

    std::cout << "key1: " << db.get("key1") << std::endl;

    if (db.contains("key1")) {
        std::cout << "key1 exists." << std::endl;
    }

    db.remove("key1");

    if (!db.contains("key1")) {
        std::cout << "key1 does not exist." << std::endl;
    }

    return 0;
}

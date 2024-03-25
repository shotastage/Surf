// main.cpp

#include <iostream>
#include "LSMTree.hpp"

int main() {
    LSMTree tree;

    // Test set
    tree.set("key1", "value1");
    tree.set("key2", "value2");

    // Test read
    std::cout << "key1: " << tree.get("key1") << std::endl;
    std::cout << "key2: " << tree.get("key2") << std::endl;

    return 0;
}

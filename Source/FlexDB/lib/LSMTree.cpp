// LSMTree.cpp

#include "LSMTree.hpp"
#include <string>

LSMTree::LSMTree() {
    levels.push_back(std::map<std::string, std::string>()); // Memory level
    levels.push_back(std::map<std::string, std::string>()); // Disk level 1
}

void LSMTree::set(const std::string& key, const std::string& value) {
    // Insert data into the first level (memory level)
    levels[0][key] = value;

    // When the memory level reaches a certain size, flush to the next level (simplified example)
    if (levels[0].size() > 10) { // This threshold is illustrative
        for (size_t i = 0; i < levels.size() - 1; ++i) {
            if (levels[i].size() > 10) {
                // Merge into the next level
                levels[i + 1].insert(levels[i].begin(), levels[i].end());
                levels[i].clear();
            }
        }
    }
}


std::string LSMTree::get(const std::string& key) {
    // Search all levels
    for (auto& level : levels) {
        auto it = level.find(key);
        if (it != level.end()) {
            return it->second;
        }
    }
    return ""; // In case the key is not found
}

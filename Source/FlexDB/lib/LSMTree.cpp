// LSMTree.cpp

#include "LSMTree.hpp"

#include <iostream>
#include <string>

using namespace std;

LSMTree::LSMTree() {
  levels.push_back(map<std::string, string>());  // Memory level
  levels.push_back(map<std::string, string>());  // Disk level 1
}

void LSMTree::set(const string& key, const string& value) {
  // Insert data into the first level (memory level)
  levels[0][key] = value;

  // When the memory level reaches a certain size, flush to the next level
  // (simplified example)
  if (levels[0].size() > 10) {  // This threshold is illustrative
    for (size_t i = 0; i < levels.size() - 1; ++i) {
      if (levels[i].size() > 10) {
        // Merge into the next level
        levels[i + 1].insert(levels[i].begin(), levels[i].end());
        levels[i].clear();
      }
    }
  }
}

std::string LSMTree::get(const string& key) {
  // Search all levels
  for (auto& level : levels) {
    auto it = level.find(key);
    if (it != level.end()) {
      return it->second;
    }
  }
  return "";  // In case the key is not found
}

void LSMTree::flash() {
  cout << "Now under construction" << endl;
}

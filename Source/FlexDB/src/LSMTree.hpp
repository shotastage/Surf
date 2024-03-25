#ifndef LSM_TREE_HPP
#define LSM_TREE_HPP

#include <string>
#include <unordered_map>
#include <map>

class LSMTree {
private:
    std::vector<std::map<std::string, std::string>> levels; // Simulates in-memory and disk levels

public:
    LSMTree();
    void set(const std::string& key, const std::string& value);
    std::string get(const std::string& key);
};

#endif // LSM_TREE_HPP

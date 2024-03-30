#pragma once

#include <string>
#include <vector>
#include <unordered_map>
#include <map>

using namespace std;

class LSMTree {
private:
    vector<map<string, string>> levels; // Simulates in-memory and disk levels

public:
    LSMTree();
    void set(const string& key, const string& value);
    string get(const string& key);
    void flash();
};

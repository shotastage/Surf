// FlexDB.cpp

#include "FlexDB.hpp"

// Insert or update a value
void FlexDB::set(const std::string& key, const std::string& value) {
    store[key] = value;
}

// Get a value
std::string FlexDB::get(const std::string& key) {
    if (store.find(key) != store.end()) {
        return store[key];
    }
    return ""; // In case the key does not exist
}

// Delete a key
bool FlexDB::remove(const std::string& key) {
    if (store.find(key) != store.end()) {
        store.erase(key);
        return true;
    }
    return false;
}

// Check if a key exists
bool FlexDB::contains(const std::string& key) {
    return store.find(key) != store.end();
}

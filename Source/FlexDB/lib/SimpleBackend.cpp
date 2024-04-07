// SimpleBackend.cpp

#include "SimpleBackend.hpp"

// Insert or update a value
void SimpleBackend::set(const std::string& key, const std::string& value) {
  store[key] = value;
}

// Get a value
std::string SimpleBackend::get(const std::string& key) {
  if (store.find(key) != store.end()) {
    return store[key];
  }
  return "";  // In case the key does not exist
}

// Delete a key
bool SimpleBackend::remove(const std::string& key) {
  if (store.find(key) != store.end()) {
    store.erase(key);
    return true;
  }
  return false;
}

// Check if a key exists
bool SimpleBackend::contains(const std::string& key) {
  return store.find(key) != store.end();
}

// FlexDB.hpp

#ifndef FLEX_DB_HPP
#define FLEX_DB_HPP

#include <string>
#include <unordered_map>

class FLexDB {
private:
    std::unordered_map<std::string, std::string> store;

public:
    void set(const std::string& key, const std::string& value);
    std::string get(const std::string& key);
    bool remove(const std::string& key);
    bool contains(const std::string& key);
};

#endif // FLEX_DB_HPP

#pragma once

#include <iostream>
#include <string>
#include <vector>
#include "BinaryFormat.hpp"


using namespace std;

/**
 * SSTable class
 *
 * SSTable (Sorted String Table) is a data structure that stores key-value pairs in sorted order.
 * This class provides functionality to write and read data to a file.
 */
class SSTable {
public:
    /**
    * Writes a list of entries to an SSTable file.
    *
    * @param entries The list of entries to write
    */
    static void writeSSTable(const vector<Entry>& entries);

    /**
    * Reads the value corresponding to a given key.
    *
    * @param key The key to read
    * @param value The buffer to store the read value
    * @return True on success, false on failure
    */
    static bool readSSTable(const string& key, vector<uint8_t>& value);

    /**
    * Sets the path to the file to write to.
    *
    * @param filename The path to the file to write to
    */
    void setExportPath(const string& filename);
private:
    /**
    * The path to the file to write to
    */
    static string exportFilePath;
};

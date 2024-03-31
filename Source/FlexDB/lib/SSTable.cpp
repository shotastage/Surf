#include "SSTable.hpp"


string SSTable::exportFilePath;

void SSTable::writeSSTable(const vector<Entry>& entries) {
    ofstream file(exportFilePath, ios::binary);

    if (!file.is_open()) {
        // errc << "Failed to open file for writing: " << filename << endl;

        return;
    }
}

bool SSTable::readSSTable(const std::string& key, std::vector<uint8_t>& value) {
    // Open the file
    // ...

    // Find the value corresponding to the key
    // ...

    // Read the value
    // ...

    // Close the file
    // ...
    return true;
}

// Set export file path
void SSTable::setExportPath(const string& filename) {
    exportFilePath = filename;
}

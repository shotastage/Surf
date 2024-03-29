//
//  FlexDataFormat.cpp
//  
//
//  Created by Shota Shimazu on 2024/03/29.
//

#include "FlexDataFormat.hpp"
#include <cstdint>
#include <ctime> 


void WriteEntry(const Entry& entry, std::ostream& out) {
    out.write((char*)&entry.type, 1);
    WriteVarInt(entry.key_length, out);
    out.write(entry.key.data(), entry.key_length);
    WriteVarInt(entry.value_length, out);
    out.write((char*)&entry.value[0], entry.value_length);
}

Entry ReadEntry(std::istream& in) {
    Entry entry;
    in.read((char*)&entry.type, 1);
    entry.key_length = ReadVarInt(in);
    entry.key.resize(entry.key_length);
    in.read(&entry.key[0], entry.key_length);
    entry.value_length = ReadVarInt(in);
    entry.value.resize(entry.value_length);
    in.read((char*)&entry.value[0], entry.value_length);
    return entry;
}

void WriteTimestamp(uint64_t timestamp, std::ostream& out) {
    WriteVarInt(timestamp, out);
}

uint64_t ReadTimestamp(std::istream& in) {
    return ReadVarInt(in);
}

#include "ZipUtil.hpp" // Include the header file for the URLParser class

using namespace std;


string ZipUtil::extract(string &data) {
  gzFile file = gzopen("compressed.zip", "rb");
  if (file == NULL) {
    cerr << "Can not open file." << endl;
    return 1;
  }

  struct gz_header header;
  gzread(file, &header, sizeof(header));
  return "__HELLO_DATA__";
}

string ZipUtil::compress(string &data, const int level) {
  return "__HELLO_DATA__";
}

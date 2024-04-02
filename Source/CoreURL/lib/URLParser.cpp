#include "URLParser.hpp" // Include the header file for the URLParser class
#include <sstream>         // For working with string streams

using namespace std;

// **URLParser Constructor**
// * Initializes the object by immediately parsing the provided URL.
URLParser::URLParser(const string& url) {
  parseURL(url);
}

// **getProtocol**
// * Retrieves the previously parsed protocol of the URL.
string URLParser::getProtocol() const {
  return protocol;
}

// **getHost**
// * Retrieves the previously parsed host of the URL.
string URLParser::getHost() const {
  return host;
}

// **getPath**
// * Retrieves the previously parsed path component of the URL.
string URLParser::getPath() const {
  return path;
}

// **parseURL**
// * Parses the given URL string, extracting protocol, host, and path.
// * Uses a stringstream to break the URL into segments.
void URLParser::parseURL(const string& url) {
  istringstream urlStream(url);

  // Extract protocol (up to the colon ':')
  getline(urlStream, protocol, ':');

  // Discard "//" after the protocol
  urlStream.ignore(2);

  // Extract host (up to the next '/')
  getline(urlStream, host, '/');

  // Extract the remaining path
  getline(urlStream, path);

  //  Check if protocol accidentally ends with ':', if so, remove it
  if (!protocol.empty() && protocol.back() == ':') {
    protocol.pop_back();
  }
}

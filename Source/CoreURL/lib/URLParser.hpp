// This file defines a class `URLParser` that can be used to parse a URL into
// its constituent parts.

#pragma once

#include <string>

using namespace std;

class URLParser {
 public:
  // Constructor that takes a URL as a string and parses it into its constituent
  // parts.
  URLParser(const string& url);

  // Gets the protocol of the URL.
  string getProtocol() const;

  // Gets the host of the URL.
  string getHost() const;

  // Gets the path of the URL.
  string getPath() const;

 private:
  // The protocol of the URL.
  string protocol;

  // The host of the URL.
  string host;

  // The path of the URL.
  string path;

  // Parses the URL into its constituent parts.
  void parseURL(const string& url);

  // Helper function that parses the protocol of the URL.
  void parseProtocol();

  // Helper function that parses the host of the URL.
  void parseHost();

  // Helper function that parses the path of the URL.
  void parsePath();
};

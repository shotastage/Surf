#ifndef URLPARSER_HPP
#define URLPARSER_HPP

#include <string>

class URLParser {
public:
    URLParser(const std::string& url);
    std::string getProtocol() const;
    std::string getHost() const;
    std::string getPath() const;

private:
    std::string protocol;
    std::string host;
    std::string path;

    void parseURL();
};

#endif // URLPARSER_HPP

#include "URLParser.hpp"
#include <sstream>

URLParser::URLParser(const std::string& url) {
    parseURL(url);
}

std::string URLParser::getProtocol() const {
    return protocol;
}

std::string URLParser::getHost() const {
    return host;
}

std::string URLParser::getPath() const {
    return path;
}

void URLParser::parseURL(const std::string& url) {
    std::istringstream urlStream(url);
    std::getline(urlStream, protocol, ':');
    urlStream.ignore(2);
    std::getline(urlStream, host, '/');
    std::getline(urlStream, path);

    if (!protocol.empty() && protocol.back() == ':') {
        protocol.pop_back();
    }
}

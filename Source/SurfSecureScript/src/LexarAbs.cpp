#include "LexerAbs.hpp"
#include <cctype>
#include <iostream>

Lexer::Lexer(const std::string& src) : src(src), pos(0) {}

std::vector<Token> Lexer::tokenize() {
    std::vector<Token> tokens;

    while (pos < src.size()) {
        const char current = src[pos];

        if (std::isspace(current)) {
            pos++;
        } else if (std::isdigit(current)) {
            tokens.push_back({TokenType::NUM, readNumber()});
        } else if (current == ':') {
            tokens.push_back({TokenType::COLON, ":"});
            pos++;
        } else if (current == ',') {
            tokens.push_back({TokenType::COMMA, ","});
            pos++;
        } else if (current == '(') {
            tokens.push_back({TokenType::LPAREN, "("});
            pos++;
        } else if (current == ')') {
            tokens.push_back({TokenType::RPAREN, ")"});
            pos++;
        } else if (current == '{') {
            tokens.push_back({TokenType::LBRACE, "{"});
            pos++;
        } else if (current == '}') {
            tokens.push_back({TokenType::RBRACE, "}"});
            pos++;
        } else if (std::isalpha(current)) {
            std::string identifier = readWhile(std::isalnum);
            if (identifier == "func") {
                tokens.push_back({TokenType::FUNC, identifier});
            } else if (identifier == "Int64") {
                tokens.push_back({TokenType::INT64, identifier});
            } else if (identifier == "ret") {
                tokens.push_back({TokenType::RET, identifier});
            } else {
                tokens.push_back({TokenType::IDENTIFIER, identifier});
            }
        } else {
            std::cerr << "Unknown character: " << current << std::endl;
            pos++;
        }
    }

    tokens.push_back({TokenType::END, ""});
    return tokens;
}

std::string Lexer::readNumber() {
    size_t start = pos;
    while (pos < src.size() && std::isdigit(src[pos])) pos++;
    return src.substr(start, pos - start);
}

std::string Lexer::readWhile(std::function<int(int)> predicate) {
    std::string result;
    while (pos < src.size() && predicate(src[pos])) {
        result.push_back(src[pos]);
        pos++;
    }
    return result;
}

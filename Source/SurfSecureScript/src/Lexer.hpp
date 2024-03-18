#ifndef LEXER_HPP
#define LEXER_HPP

#include <string>
#include <vector>
#include <functional>

enum class TokenType {
    FUNC,
    IDENTIFIER,
    STRING,
    INT64,
    COLON,
    COMMA,
    LPAREN,
    RPAREN,
    LBRACE,
    RBRACE,
    RET,
    NUM,
    END
};

struct Token {
    TokenType type;
    std::string value;
};

class Lexer {
public:
    Lexer(const std::string& src);
    std::vector<Token> tokenize();

private:
    std::string src;
    size_t pos;

    std::string readNumber();
    std::string readWhile(std::function<int(int)> predicate);
};

#endif // LEXER_HPP

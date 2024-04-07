#pragma once

#include <functional>
#include <string>
#include <vector>

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

using namespace std;

struct Token {
  TokenType type;
  string value;
};

class Lexer {
 public:
  Lexer(const string& src);
  vector<Token> tokenize();

 private:
  string src;
  size_t pos;

  string readNumber();
  string readWhile(function<int(int)> predicate);
};

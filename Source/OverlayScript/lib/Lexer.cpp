//
// Lexer.cpp
//
// Copyright © 2024 Shota Shimazu. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//	https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
#include "Lexer.hpp"

#include <cctype>
#include <iostream>

using namespace std;

Lexer::Lexer(const string& src) : src(src), pos(0) {}

vector<Token> Lexer::tokenize() {
  vector<Token> tokens;

  while (pos < src.size()) {
    const char current = src[pos];

    if (isspace(current)) {
      pos++;
    } else if (isdigit(current)) {
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
    } else if (isalpha(current)) {
      string identifier = readWhile([](unsigned char c) { return isalnum(c); });
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
      cerr << "Unknown character: " << current << endl;
      pos++;
    }
  }

  tokens.push_back({TokenType::END, ""});
  return tokens;
}

string Lexer::readNumber() {
  size_t start = pos;
  while (pos < src.size() && isdigit(src[pos]))
    pos++;
  return src.substr(start, pos - start);
}

string Lexer::readWhile(function<int(int)> predicate) {
  string result;
  while (pos < src.size() && predicate(src[pos])) {
    result.push_back(src[pos]);
    pos++;
  }
  return result;
}

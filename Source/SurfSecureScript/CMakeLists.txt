cmake_minimum_required(VERSION 3.28)

project(SurfSecureScriptProject VERSION 1.0)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)


set(SOURCE_FILES
    src/main.cpp
    #src/LexerAbs.cpp
    #src/LexerAbs.hpp
)

# Executable
add_executable(LexerApp ${SOURCE_FILES})

# Set include dir
target_include_directories(LexerApp PUBLIC "${PROJECT_SOURCE_DIR}/src")

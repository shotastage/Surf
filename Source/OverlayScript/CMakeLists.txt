cmake_minimum_required(VERSION 3.10)

project(OverlayScript VERSION 1.0)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)


set(SOURCE_FILES
    lib/main.cpp
    lib/Lexer.cpp
    lib/Lexer.hpp
)

# Executable
add_executable(OverlayScript ${SOURCE_FILES})

# Set include dir
target_include_directories(OverlayScript PUBLIC "${PROJECT_SOURCE_DIR}/src")

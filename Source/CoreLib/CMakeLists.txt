cmake_minimum_required(VERSION 3.10)

project(CoreLib VERSION 1.0)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)


set(SOURCE_FILES
    lib/main.cpp
)

# Executable
add_executable(CoreLib ${SOURCE_FILES})

# Set include dir
target_include_directories(CoreLib PUBLIC "${PROJECT_SOURCE_DIR}/src")

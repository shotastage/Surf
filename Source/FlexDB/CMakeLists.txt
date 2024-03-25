cmake_minimum_required(VERSION 3.10)

project(FlexDB VERSION 1.0)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)


set(SOURCE_FILES
    lib/main.cpp
    lib/FlexDB.cpp
    lib/FlexDB.hpp
    lib/LSMTree.cpp
    lib/LSMTree.hpp
)

# Executable
add_executable(FlexDB ${SOURCE_FILES})

# Set include dir
target_include_directories(FlexDB PUBLIC "${PROJECT_SOURCE_DIR}/src")

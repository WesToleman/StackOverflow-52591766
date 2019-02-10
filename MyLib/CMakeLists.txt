cmake_minimum_required(VERSION 3.3.0)
Project(MyLib
    DESCRIPTION "Library with bundled interface dependency"
    LANGUAGES CXX)

# MyLib library
add_library(MyLib STATIC
    ${CMAKE_SOURCE_DIR}/src/MyLib.cpp)

target_include_directories(MyLib
    PUBLIC $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/include/MyLib>
    PUBLIC $<INSTALL_INTERFACE:include/MyLib>)

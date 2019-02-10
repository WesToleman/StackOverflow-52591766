cmake_minimum_required(VERSION 3.3.0)
project(User
	LANGUAGES CXX)

# CppLUT dependency
find_package(MyLib REQUIRED)

add_executable(Test main.cpp)
target_link_libraries(Test
	PRIVATE MyLib::MyLib)

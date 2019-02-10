cmake_minimum_required(VERSION 3.3.0)
Project(MyLib
    DESCRIPTION "Library with bundled interface dependency"
    LANGUAGES CXX)

include(GNUInstallDirs)
include(CMakePackageConfigHelpers)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${PROJECT_SOURCE_DIR}/CMake/modules)

set(PROJECT_VERSION 0.0.0)
set(PROJECT_VERSION_MAJOR 0)
set(PROJECT_VERSION_MINOR 0)
set(PROJECT_VERSION_PATCH 0)

# Find LibDep dependency
find_package(libDep REQUIRED)

# MyLib library
add_library(MyLib STATIC
    ${CMAKE_SOURCE_DIR}/src/MyLib.cpp)

target_include_directories(MyLib
    PUBLIC $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/include/MyLib>
    PUBLIC $<INSTALL_INTERFACE:include/MyLib>)

target_link_libraries(MyLib
    PUBLIC MyLib::LibDep)

install(TARGETS MyLib
    EXPORT MyLibTargets
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    RUNTIME DESTINATION bin
    INCLUDES DESTINATION include)

include(CMakePackageConfigHelpers)
write_basic_package_version_file(MyLibConfigVersion.cmake
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY AnyNewerVersion)

install(EXPORT MyLibTargets
    FILE MyLibTargets.cmake
    NAMESPACE MyLib::
    DESTINATION lib/cmake/MyLib)

configure_file(CMake/MyLibConfig.cmake.in MyLibConfig.cmake @ONLY)

install(FILES
    "${CMAKE_CURRENT_BINARY_DIR}/MyLibConfig.cmake"
    "${CMAKE_CURRENT_BINARY_DIR}/MyLibConfigVersion.cmake"
    DESTINATION lib/cmake/MyLib)

install(DIRECTORY ${MyLib_PUBLIC_INCLUDE_DIR}
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

install(DIRECTORY ${libDep_INCLUDE_DIRS}
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/MyLib/third_party)

install(FILES
    ${CMAKE_MODULE_PATH}/FindlibDep.cmake
    DESTINATION lib/cmake/MyLib)

# Package with CPack
include(InstallRequiredSystemLibraries)
include(CPack)

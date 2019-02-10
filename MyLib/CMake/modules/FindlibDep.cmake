find_path(LibDep_INCLUDE_DIR
    NAMES LibDep.hpp
    PATHS third_party/libDep
    PATH_SUFFIXES Mylib/third_party/libDep)

mark_as_advanced(LibDep_FOUND LibDep_INCLUDE_DIR)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(LibDep
    REQUIRED_VARS LibDep_INCLUDE_DIR
)

if(LibDep_FOUND)
    set(LibDep_INCLUDE_DIRS ${LibDep_INCLUDE_DIR})
endif()

if(LibDep_FOUND AND NOT TARGET MyLib::LibDep)
    add_library(MyLib::LibDep INTERFACE IMPORTED)
    set_target_properties(MyLib::LibDep PROPERTIES
        INTERFACE_INCLUDE_DIRECTORIES ${LibDep_INCLUDE_DIR})
endif()


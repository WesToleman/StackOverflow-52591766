# CMake dependency installation testing

This repository implements the example situation in a [StackOverflow question](https://stackoverflow.com/questions/52591766/how-do-i-install-bundled-interface-dependencies-with-modern-cmake) about installing bundled dependencies.

# Reproducing the situation in the question

To reproduce the situation in the question execute `./reproduce_issue.sh`.

# Cleaning up

*reproduce_issue.sh* installs some files, a list of files can be found in *install_manifest.txt* in your build directory.
The install process will also add *MyLib/* to your system include directory.
To clean up remove these files.

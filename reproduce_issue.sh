#!/bin/sh

# Unofficial strict mode
set -eu

# Redefine `pushd`/`popd` builtins to silence stack printing
pushd() { builtin pushd "$@" > /dev/null; }
popd() { builtin popd "$@" > /dev/null; }

mkdir -p MyLib/build User/build

pushd MyLib/build
	cmake ..
	sudo make install
popd

cd User/build
echo "Attempting to build user application"
cmake ..

#!/bin/bash
set -xeuo pipefail

export CMAKE_PREFIX_PATH=$PREFIX

# only build the Python bindings, not libHalide again
$PYTHON -m pip install . -vv --no-deps -C cmake.source-dir=python_bindings

# fix installation of lib files inside Python package to $PREFIX/lib
mv -v $SP_DIR/halide/lib/lib* $PREFIX/lib/
mv -v $SP_DIR/halide/lib/cmake/* $PREFIX/lib/cmake/
rm -rvf $SP_DIR/halide/lib

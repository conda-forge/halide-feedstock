#!/bin/bash
set -xeuo pipefail

export CMAKE_PREFIX_PATH=$PREFIX

$PYTHON -m pip install . -vv --no-deps

rm -rvf $SP_DIR/halide/libHalide.so.*

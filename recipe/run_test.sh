#!/bin/bash
set -ex

${CXX} ${CPPFLAGS} ${CXXFLAGS} -std=c++17 test.cpp ${LDFLAGS} -lHalide -o test
./test
test -f f_aot.a
test -f f_aot.h

#!/bin/bash

${CXX} ${CPPFLAGS} ${CXXFLAGS} test.cpp ${LDFLAGS} -lHalide -o test
./test

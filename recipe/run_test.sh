${CXX} -std=c++11 ${CPPFLAGS} ${CXXFLAGS} test.cpp \
    ${LDFLAGS} -lHalide -lz \
    -o test

./test

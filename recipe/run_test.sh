${CXX} ${CPPFLAGS} ${CXXFLAGS} test.cpp \
    ${LDFLAGS} -lHalide -lz \
    -o test

./test

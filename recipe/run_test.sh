if [[ $(uname) == "Darwin" ]]; then
    # ensure we test with host compiler on darwin
    export CXX=/usr/bin/c++
fi

${CXX:-c++} -std=c++11 -I$PREFIX/include $RECIPE_DIR/test.cpp \
    -Wl,-rpath,"$PREFIX/lib" -L$PREFIX/lib -lHalide -lz \
    -o test

./test

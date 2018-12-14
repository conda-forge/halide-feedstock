if [[ $(uname) == "Darwin" && "$cxx_compiler" == "toolchain_cxx" ]]; then
    # ensure toolchain uses host compiler on darwin
    export CXX=/usr/bin/c++
    export CC=/usr/bin/cc
fi

export LLVM_CONFIG=$PREFIX/bin/llvm-config
export CLANG=$PREFIX/bin/clang

# need to look in $PREFIX for zlib
export LDFLAGS="-L$PREFIX/lib $LDFLAGS"

make -j${NUM_CPUS}
make install PREFIX=$PREFIX

if [[ $(uname) == "Darwin" && "$cxx_compiler" == "toolchain_cxx" ]]; then
    # ensure toolchain uses host compiler on darwin
    export CXX=/usr/bin/c++
    export CC=/usr/bin/cc
fi

# avoid linking to libLLVM in build prefix
rm -vf "$BUILD_PREFIX"/lib/libLLVM*.a

export LLVM_CONFIG=$PREFIX/bin/llvm-config
export CLANG=$PREFIX/bin/clang

# need to look in $PREFIX for zlib
export LDFLAGS="-L$PREFIX/lib $LDFLAGS"
# avoid under-linking with dead_strip_dylibs
export LDFLAGS="${LDFLAGS/-Wl,-dead_strip_dylibs/}"

make -j${CPU_COUNT}
make install PREFIX=$PREFIX

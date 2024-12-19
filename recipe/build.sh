export LLVM_CONFIG=$PREFIX/bin/llvm-config
export CLANG=$PREFIX/bin/clang

# avoid under-linking with dead_strip_dylibs
export LDFLAGS="${LDFLAGS/-Wl,-dead_strip_dylibs/}"

mkdir -p build
cd build

cmake ${CMAKE_ARGS} \
  -DHalide_LLVM_SHARED_LIBS=YES \
  -DWITH_PYTHON_BINDINGS=NO \
  -DWITH_TESTS=NO \
  -DWITH_TUTORIALS=NO \
  ..

make -j${CPU_COUNT}
make install

# if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR}" != "" ]]; then
#   ctest -j${CPU_COUNT}
# fi

if [[ $(uname) == "Darwin" ]]; then
    # don't use clang++ from the env
    export CXX=c++
else
    # need to look in $PREFIX for zlib
    export LDFLAGS="-L$PREFIX/lib $LDFLAGS"
fi

make -j${NUM_CPUS}
make install PREFIX=$PREFIX

(
    cd python_bindings
    make -j${NUM_CPUS}
    cp build/halide.so ${SP_DIR}
    mkdir -p $PREFIX/share/halide/tutorial/python
    cp tutorial/*.py $PREFIX/share/halide/tutorial/python
)

if [[ $(uname) == "Darwin" ]]; then
    # set the dll id on macOS
    LIBHALIDE="$PREFIX/lib/libHalide.so"
    install_name_tool -id $LIBHALIDE $LIBHALIDE
fi

#include "Halide.h"

#include <cstdio>

using namespace Halide;

int main() {
    Var x("x"), y("y");
    Func f("f");
    f(x, y) = x + y * 2;

    // JIT compile and run.
    Buffer<int> out = f.realize({8, 8});
    for (int j = 0; j < out.height(); j++) {
        for (int i = 0; i < out.width(); i++) {
            if (out(i, j) != i + j * 2) {
                std::printf("Mismatch at (%d, %d): %d\n", i, j, out(i, j));
                return 1;
            }
        }
    }

    // Exercise the LLVM backend's ahead-of-time path as well.
    f.compile_to_static_library("f_aot", {}, "f_aot", get_host_target());

    std::printf("Success!\n");
    return 0;
}

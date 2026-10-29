#!/bin/bash
set -xeuo pipefail

# Build only the Python bindings, against the libHalide in $PREFIX.
# Every Python variant shares this work directory, so start fresh.
rm -rf build-python
cmake ${CMAKE_ARGS} \
  -S python_bindings \
  -B build-python \
  -DPython_EXECUTABLE="${PYTHON}" \
  -DHalide_INSTALL_PYTHONDIR="${SP_DIR#"${PREFIX}/"}/halide" \
  -DWITH_PYTHON_STUBS=NO \
  -DWITH_TESTS=NO \
  -DWITH_TUTORIALS=NO

cmake --build build-python -j"${CPU_COUNT}"

for component in Halide_Python Halide_PythonRuntime Halide_PythonBin; do
  cmake --install build-python --component "${component}"
done

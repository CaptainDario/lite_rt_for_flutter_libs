# this script mainly follows: https://ai.google.dev/edge/litert/build/cmake

# Step 3. Create CMake build directory
mkdir tflite_build
cd tflite_build

# Build LiteRT C library
cmake ../tensorflow/tensorflow/lite \
    -DTFLITE_ENABLE_GPU=ON \
    -DTFLITE_ENABLE_RUY=ON
cmake --build . -j

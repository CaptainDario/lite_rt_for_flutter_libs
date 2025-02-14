cd tensorflow

bazelisk clean

bazelisk build -c opt \
  --copt -Os \
  --repo_env=HERMETIC_PYTHON_VERSION=3.11 \
  --copt -DTFLITE_GPU_BINARY_RELEASE \
  --copt -fvisibility=hidden \
  --linkopt -s \
  --strip always \
  --cxxopt=-std=c++17 \
  //tensorflow/lite/delegates/gpu:tensorflow_lite_gpu_dylib \
  --apple_platform_type=macos

find ./bazel-out/ -type f -name "*.dylib"

cp $(find ./bazel-out/ -type f -name "*.dylib") ./tensorflowlite_arm64_gpu.dylib


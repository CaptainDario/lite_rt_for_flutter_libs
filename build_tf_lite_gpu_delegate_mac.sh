# build standard c library
#bazelisk build -c opt //tensorflow/lite/c:tensorflowlite_c
# build macos gpu
#bazelisk build -c opt --copt -Os --copt -DTFLITE_GPU_BINARY_RELEASE \
#    --copt -fvisibility=hidden --linkopt -s --strip always \
#    --cxxopt=-std=c++14 //tensorflow/lite/delegates/gpu:tensorflow_lite_gpu_dylib \
#    --apple_platform_type=macos
# build flex delegate
# //tensorflow/lite/delegates/flex:delegate \

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

cp $(find ./bazel-out/ -type f -name "*.dylib") ./


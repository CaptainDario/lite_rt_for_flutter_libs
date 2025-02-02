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

#bazelisk build -c opt \
#  --copt -Os \
#  --copt -DTFLITE_GPU_BINARY_RELEASE \
#  --copt -fvisibility=hidden \
#  --linkopt -s \
#  --strip always \
#  --cxxopt=-std=c++17 \
#  //tensorflow/lite/delegates/gpu:tensorflow_lite_gpu_dylib \
#  --apple_platform_type=macos

bazelisk build -c opt \
  --repo_env=HERMETIC_PYTHON_VERSION=3.11 \
  //tensorflow/lite/c:tensorflowlite_c

find ./bazel-out/ -type f -name "*.dylib"

#nm -gU ./bazel-bin//tensorflow/lite/c/libtensorflowlite_c.dylib | grep InterpreterOptions

#nm -gU ./bazel-bin//tensorflow/lite/delegates/gpu/tensorflow_lite_gpu_dylib.dylib

#cp ./bazel-bin//tensorflow/lite/c/libtensorflowlite_c.dylib \
#    /Users/darioklepoch/dev/flutter_packages/flutter-tflite/example/image_classification_mobilenet/blobs/libtensorflowlite_c-mac.dylib
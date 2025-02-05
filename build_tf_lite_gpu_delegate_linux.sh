cd tensorflow

bazelisk clean

bazel build -c opt \
  --copt -DMESA_EGL_NO_X11_HEADERS \
  --copt -DEGL_NO_X11 \
  tensorflow/lite/delegates/gpu:delegate

find ./bazel-out/ -type f -name "*.dylib"

cp $(find ./bazel-out/ -type f -name "*.dylib") ./tensorflowlite_arm64_gpu.dylib


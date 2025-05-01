echo $ARCH

# clean tensorflow build directory
cd tensorflow
bazelisk clean

bazel build -c opt \
  --copt -DMESA_EGL_NO_X11_HEADERS \
  --copt -DEGL_NO_X11 \
  tensorflow/lite/delegates/gpu:delegate

find ./bazel-out/ -type f -name "*.so"

cp $(find ./bazel-out/ -type f -name "*.so") ./ libtensorflowlite_${ARCH}_gpu_delegate_c.so


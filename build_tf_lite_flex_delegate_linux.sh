cd tensorflow

bazelisk clean

bazelisk build -c opt \
  --repo_env=HERMETIC_PYTHON_VERSION=3.11 \
  //tensorflow/lite/delegates/flex:tensorflowlite_flex

find ./bazel-out/ -type f -name "*.so"

cp $(find ./bazel-out/ -type f -name "*.so") ./libtensorflowlite_flex_x86.so


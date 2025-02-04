cd tensorflow

bazelisk clean

bazelisk build -c opt \
  --repo_env=HERMETIC_PYTHON_VERSION=3.11 \
  //tensorflow/lite/c:tensorflowlite_c

find ./bazel-out/ -type f -name "*.dylib"

cp ./bazel-out//darwin_arm64-opt/bin/tensorflow/lite/c/libtensorflowlite_c.dylib ./libtensorflowlite_arm64_c.dylib



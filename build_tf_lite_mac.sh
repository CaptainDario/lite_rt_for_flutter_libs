cd tensorflow
arch -x86_64 bazelisk clean

arch -x86_64 bazelisk build -c opt \
  --repo_env=HERMETIC_PYTHON_VERSION=3.11 \
  //tensorflow/lite/c:tensorflowlite_c
find ./bazel-out/ -type f -name "*.dylib"

cp $(find ./bazel-out/ -type f -name "*.dylib") ./libtensorflowlite_arm64.dylib



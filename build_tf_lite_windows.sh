cd tensorflow

bazelisk clean

bazelisk build -c opt \
    --repo_env=HERMETIC_PYTHON_VERSION=3.11 \
    //tensorflow/lite/c:tensorflowlite_c

find ./bazel-bin/ -type f -name "*.dll"

cp $(find ./bazel-bin/ -type f -name "*.dll") ./libtensorflowlite_x86.dll
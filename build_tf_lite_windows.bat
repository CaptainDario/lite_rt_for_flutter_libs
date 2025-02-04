cd tensorflow

bazel clean

bazel build -c opt --repo_env=HERMETIC_PYTHON_VERSION=3.11 //tensorflow/lite/c:tensorflowlite_c

# find ./bazel-out/ -type f -name "*.dll"

# cp $(find ./bazel-out/ -type f -name "*.dll") ./libtensorflowlite_arm64_c.dll



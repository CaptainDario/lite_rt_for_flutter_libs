# clean tensorflow build directory
cd tensorflow
bazelisk clean

# build base rnutime and check it was successful
bazelisk build -c opt \
  --repo_env=HERMETIC_PYTHON_VERSION=3.11 \
  //tensorflow/lite/c:tensorflowlite_c
find ./bazel-out/ -type f -name "*.so"

# rename and copy the output based on the current system
if [[ "${RUNNER_ARCHITECTURE}" == "x64" ]]; then
    arch="x86"
elif [[ "${RUNNER_ARCHITECTURE}" == "arm64" ]]; then
    arch="arm64"
else
    echo "Unsupported architecture: ${RUNNER_ARCHITECTURE}"
    exit 1
fi
cp $(find ./bazel-out/ -type f -name "*.so") "./libtensorflowlite_${arch}_c.so"




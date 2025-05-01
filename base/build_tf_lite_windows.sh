echo $ARCH
# clean tensorflow build directory
cd tensorflow
bazelisk clean

# build base rnutime and check it was successful
bazelisk build -c opt \
    --cpu=arm64_windows \
    --repo_env=HERMETIC_PYTHON_VERSION=3.11 \
    //tensorflow/lite/c:tensorflowlite_c
find ./bazel-bin/ -type f -name "*.dll"

# rename and copy the output based on the current system
cp $(find ./bazel-bin/ -type f -name "*.dll") ./libtensorflowlite_${ARCH}_c.dll
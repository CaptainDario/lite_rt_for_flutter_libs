# clean tensorflow build directory
cd tensorflow
bazelisk clean

# build base rnutime and check it was successful
bazelisk build -c opt \
  --repo_env=HERMETIC_PYTHON_VERSION=3.11 \
  //tensorflow/lite/c:tensorflowlite_c
find ./bazel-out/ -type f -name "*.so"

# rename and copy the output based on the current system
cp $(find ./bazel-out/ -type f -name "*.so") "./libtensorflowlite_${arch}_c.so"




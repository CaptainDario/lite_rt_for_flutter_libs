echo $ARCH

# clean tensorflow build directory
cd tensorflow
bazelisk clean

# build base rnutime and check it was successful
bazelisk build -c opt \
  --repo_env=HERMETIC_PYTHON_VERSION=3.11 \
  //tensorflow/lite/c:tensorflowlite_c
find ./bazel-out/ -type f -name "*.dylib"

# rename and copy the output based on the current system
cp $(find ./bazel-out/ -type f -name "*.dylib") ./libtensorflowlite_${ARCH}_c.dylib

# change the linking name
install_name_tool -id @rpath/libtensorflowlite_flex.dylib libtensorflowlite_${ARCH}_flex.dylib
echo $ARCH

# clean tensorflow build directory
cd LiteRT
#bazelisk clean

# build base rnutime and check it was successful
bazelisk build \
  --repo_env=HERMETIC_PYTHON_VERSION=3.11 \
  tflite/delegates/coreml:coreml_delegate
#find ./bazel-out/ -type f -name "*.dylib"

# rename and copy the output based on the current system
#cp $(find ./bazel-out/ -type f -name "*.dylib") ./libtensorflowlite_${ARCH}_c.dylib

# change the linking name
#install_name_tool -id @rpath/libtensorflowlite_c.dylib libtensorflowlite_${ARCH}_c.dylib
cd tensorflow

bazelisk clean

bazelisk build -c opt --config=monolithic \
  --repo_env=HERMETIC_PYTHON_VERSION=3.11 \
  //tensorflow/lite/delegates/flex:tensorflowlite_flex

find ./bazel-out/ -type f -name "*.dylib"

cp $(find ./bazel-out/ -type f -name "*.dylib") ./libtensorflowlite_${ARCH}_flex_delegate_c.dylib

install_name_tool -id @rpath/libtensorflowlite_flex_delegate_c.dylib libtensorflowlite_${ARCH}_flex_delegate_c.dylib
cd tensorflow

bazelisk clean

bazel build -c opt \ 
  --repo_env=HERMETIC_PYTHON_VERSION=3.11 \
  tensorflow/lite/delegates/flex:tensorflowlite_flex
#bazelisk build -c opt --config=monolithic \
#  --repo_env=HERMETIC_PYTHON_VERSION=3.11 \
#  --cxxopt='/std:c++20' \
#  tensorflow/lite/delegates/flex:tensorflowlite_flex
  #--config=win_clang \

find ./bazel-out/ -type f -name "*.dll"

cp $(find ./bazel-out/ -type f -name "*.dll") ./libtensorflowlite_${ARCH}_flex_delegate_c.dll


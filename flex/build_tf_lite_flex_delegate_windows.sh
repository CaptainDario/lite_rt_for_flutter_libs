# only worked in Msys2

cd tensorflow

bazelisk clean

export MSYS_NO_PATHCONV=1
export MSYS2_ARG_CONV_EXCL="*"

export PATH=" /f/bazelisk/:$PATH"
export PATH="/c/Users/dario/AppData/Local/Programs/Python/Python311/:$PATH"

/f/bazelisk/bazelisk.exe build -c opt \
  --config=monolithic \
  --repo_env=HERMETIC_PYTHON_VERSION=3.11 \
  --config=win_clang \
  --cxxopt='/std:c++17' \
  tensorflow/lite/delegates/flex:tensorflowlite_flex

find ./bazel-out/ -type f -name "*.dll"

cp $(find ./bazel-out/ -type f -name "*.dll") ./libtensorflowlite_${ARCH}_flex_delegate_c.dll


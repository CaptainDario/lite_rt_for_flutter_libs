

mkdir tflite_build
cd tflite_build


cmake ../tensorflow/tensorflow/lite/c -DTFLITE_ENABLE_GPU=ON -DCMAKE_BUILD_TYPE=release
cmake --build . -j 8 --config release

ls -la
ls debug/ -la

cp ./Release/tensorflowlite_c.dll ../libtensorflowlite_${ARCH}_gpu_delegate_c.dll
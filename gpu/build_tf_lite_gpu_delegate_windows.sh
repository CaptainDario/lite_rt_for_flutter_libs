

mkdir tflite_build
cd tflite_build


cmake ../tensorflow_src/tensorflow/lite/c -DTFLITE_ENABLE_GPU=ON -DCMAKE_BUILD_TYPE=release
cmake --build . -j 8 --config release

ls -la
ls debug/ -la
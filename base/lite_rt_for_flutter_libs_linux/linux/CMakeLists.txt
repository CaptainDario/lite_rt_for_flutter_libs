# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

# Project-level configuration.
set(PROJECT_NAME "lite_rt_for_flutter_libs_linux")
project(${PROJECT_NAME} LANGUAGES CXX)

# Invoke the build for native code shared with the other target platforms.
# This can be changed to accommodate different builds.
add_subdirectory("${CMAKE_CURRENT_SOURCE_DIR}/../src" "${CMAKE_CURRENT_BINARY_DIR}/shared")

# List of absolute paths to libraries that should be bundled with the plugin.
# This list could contain prebuilt libraries, or libraries created by an
# external build triggered from this build file.
message(STATUS "Detected processor architecture: ${CMAKE_SYSTEM_PROCESSOR}")
if(CMAKE_SYSTEM_PROCESSOR STREQUAL "ARM64" OR
    CMAKE_SYSTEM_PROCESSOR STREQUAL "aarch64")
    set(LIB_TFLITE ${CMAKE_CURRENT_SOURCE_DIR}/libtensorflowlite_arm64_c.so)
elseif(CMAKE_SYSTEM_PROCESSOR STREQUAL "x86_64" OR
        CMAKE_SYSTEM_PROCESSOR STREQUAL "AMD64")
    set(LIB_TFLITE ${CMAKE_CURRENT_SOURCE_DIR}/libtensorflowlite_x86_c.so)
endif()
configure_file(${LIB_TFLITE} ${CMAKE_CURRENT_SOURCE_DIR}/libtensorflowlite_c.so COPYONLY)

set(lite_rt_for_flutter_libs_linux_bundled_libraries
  # Defined in ../src/CMakeLists.txt.
  # This can be changed to accommodate different builds.
  ${CMAKE_CURRENT_SOURCE_DIR}/libtensorflowlite_c.so
  PARENT_SCOPE
)

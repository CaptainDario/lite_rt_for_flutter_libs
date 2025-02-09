# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

project(lite_rt_for_flutter_libs_windows_library VERSION 0.0.1 LANGUAGES C)

add_library(lite_rt_for_flutter_libs_windows SHARED
  "lite_rt_for_flutter_libs_windows.c"
)

set_target_properties(lite_rt_for_flutter_libs_windows PROPERTIES
  PUBLIC_HEADER lite_rt_for_flutter_libs_windows.h
  OUTPUT_NAME "lite_rt_for_flutter_libs_windows"
)

target_compile_definitions(lite_rt_for_flutter_libs_windows PUBLIC DART_SHARED_LIB)

if (ANDROID)
  # Support Android 15 16k page size
  target_link_options(lite_rt_for_flutter_libs_windows PRIVATE "-Wl,-z,max-page-size=16384")
endif()

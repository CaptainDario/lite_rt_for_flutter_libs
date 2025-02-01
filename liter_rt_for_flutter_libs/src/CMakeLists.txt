# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

project(liter_rt_for_flutter_libs_library VERSION 0.0.1 LANGUAGES C)

add_library(liter_rt_for_flutter_libs SHARED
  "liter_rt_for_flutter_libs.c"
)

set_target_properties(liter_rt_for_flutter_libs PROPERTIES
  PUBLIC_HEADER liter_rt_for_flutter_libs.h
  OUTPUT_NAME "liter_rt_for_flutter_libs"
)

target_compile_definitions(liter_rt_for_flutter_libs PUBLIC DART_SHARED_LIB)

if (ANDROID)
  # Support Android 15 16k page size
  target_link_options(liter_rt_for_flutter_libs PRIVATE "-Wl,-z,max-page-size=16384")
endif()

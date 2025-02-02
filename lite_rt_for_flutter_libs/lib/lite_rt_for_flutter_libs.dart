import 'dart:ffi';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:lite_rt_for_flutter/installed_packages.dart';




var init = () {
  InstalledLibs().libsInstalled = true;
  print("Installe libs package");
} ();

/// Get the `DynamicLibrary` of this plugin, ie. the base tf lite runtime
DynamicLibrary getLibrary(){

  DynamicLibrary? tfLiteLib;

  if (Platform.isAndroid) {
    tfLiteLib = DynamicLibrary.open('libtensorflowlite_jni.so');
  }
  else if (Platform.isIOS) {
    tfLiteLib = DynamicLibrary.process();
  }
  else if (Platform.isMacOS) {
    tfLiteLib = DynamicLibrary.open('libtflite_c.dylib');
  }
  else if (Platform.isLinux) {
    tfLiteLib = DynamicLibrary.open('libtflite_c.so');
  }
  else if (Platform.isWindows) {
    tfLiteLib = DynamicLibrary.open('libtflite_c.dll');
  }
  // TODO web
  else {
    throw PlatformException(code: "Platform unsupported");
  }

  return tfLiteLib;

}
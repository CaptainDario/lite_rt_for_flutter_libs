// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter

import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:web/web.dart' as web;

import 'lite_rt_for_flutter_libs_web_tfjs_tflite_platform_interface.dart';

/// A web implementation of the LiteRtForFlutterLibsWebTfjsTflitePlatform of the LiteRtForFlutterLibsWebTfjsTflite plugin.
class LiteRtForFlutterLibsWebTfjsTfliteWeb extends LiteRtForFlutterLibsWebTfjsTflitePlatform {
  /// Constructs a LiteRtForFlutterLibsWebTfjsTfliteWeb
  LiteRtForFlutterLibsWebTfjsTfliteWeb();

  static void registerWith(Registrar registrar) {
    LiteRtForFlutterLibsWebTfjsTflitePlatform.instance = LiteRtForFlutterLibsWebTfjsTfliteWeb();
  }

  /// Returns a [String] containing the version of the platform.
  @override
  Future<String?> getPlatformVersion() async {
    final version = web.window.navigator.userAgent;
    return version;
  }
}

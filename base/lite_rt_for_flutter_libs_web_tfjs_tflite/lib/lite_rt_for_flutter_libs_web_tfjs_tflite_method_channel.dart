import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'lite_rt_for_flutter_libs_web_tfjs_tflite_platform_interface.dart';

/// An implementation of [LiteRtForFlutterLibsWebTfjsTflitePlatform] that uses method channels.
class MethodChannelLiteRtForFlutterLibsWebTfjsTflite extends LiteRtForFlutterLibsWebTfjsTflitePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('lite_rt_for_flutter_libs_web_tfjs_tflite');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}

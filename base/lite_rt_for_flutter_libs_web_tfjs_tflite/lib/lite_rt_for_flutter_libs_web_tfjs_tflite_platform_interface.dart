import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'lite_rt_for_flutter_libs_web_tfjs_tflite_method_channel.dart';

abstract class LiteRtForFlutterLibsWebTfjsTflitePlatform extends PlatformInterface {
  /// Constructs a LiteRtForFlutterLibsWebTfjsTflitePlatform.
  LiteRtForFlutterLibsWebTfjsTflitePlatform() : super(token: _token);

  static final Object _token = Object();

  static LiteRtForFlutterLibsWebTfjsTflitePlatform _instance = MethodChannelLiteRtForFlutterLibsWebTfjsTflite();

  /// The default instance of [LiteRtForFlutterLibsWebTfjsTflitePlatform] to use.
  ///
  /// Defaults to [MethodChannelLiteRtForFlutterLibsWebTfjsTflite].
  static LiteRtForFlutterLibsWebTfjsTflitePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [LiteRtForFlutterLibsWebTfjsTflitePlatform] when
  /// they register themselves.
  static set instance(LiteRtForFlutterLibsWebTfjsTflitePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}

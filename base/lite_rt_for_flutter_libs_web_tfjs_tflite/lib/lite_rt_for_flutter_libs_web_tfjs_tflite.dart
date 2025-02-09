
import 'lite_rt_for_flutter_libs_web_tfjs_tflite_platform_interface.dart';

class LiteRtForFlutterLibsWebTfjsTflite {
  Future<String?> getPlatformVersion() {
    return LiteRtForFlutterLibsWebTfjsTflitePlatform.instance.getPlatformVersion();
  }
}

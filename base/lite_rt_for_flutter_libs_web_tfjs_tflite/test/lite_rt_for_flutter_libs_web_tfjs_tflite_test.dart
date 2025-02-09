import 'package:flutter_test/flutter_test.dart';
import 'package:lite_rt_for_flutter_libs_web_tfjs_tflite/lite_rt_for_flutter_libs_web_tfjs_tflite.dart';
import 'package:lite_rt_for_flutter_libs_web_tfjs_tflite/lite_rt_for_flutter_libs_web_tfjs_tflite_platform_interface.dart';
import 'package:lite_rt_for_flutter_libs_web_tfjs_tflite/lite_rt_for_flutter_libs_web_tfjs_tflite_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockLiteRtForFlutterLibsWebTfjsTflitePlatform
    with MockPlatformInterfaceMixin
    implements LiteRtForFlutterLibsWebTfjsTflitePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final LiteRtForFlutterLibsWebTfjsTflitePlatform initialPlatform = LiteRtForFlutterLibsWebTfjsTflitePlatform.instance;

  test('$MethodChannelLiteRtForFlutterLibsWebTfjsTflite is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelLiteRtForFlutterLibsWebTfjsTflite>());
  });

  test('getPlatformVersion', () async {
    LiteRtForFlutterLibsWebTfjsTflite liteRtForFlutterLibsWebTfjsTflitePlugin = LiteRtForFlutterLibsWebTfjsTflite();
    MockLiteRtForFlutterLibsWebTfjsTflitePlatform fakePlatform = MockLiteRtForFlutterLibsWebTfjsTflitePlatform();
    LiteRtForFlutterLibsWebTfjsTflitePlatform.instance = fakePlatform;

    expect(await liteRtForFlutterLibsWebTfjsTflitePlugin.getPlatformVersion(), '42');
  });
}

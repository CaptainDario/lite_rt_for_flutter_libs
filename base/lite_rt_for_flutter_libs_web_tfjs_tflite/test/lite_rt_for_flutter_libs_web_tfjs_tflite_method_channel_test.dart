import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lite_rt_for_flutter_libs_web_tfjs_tflite/lite_rt_for_flutter_libs_web_tfjs_tflite_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelLiteRtForFlutterLibsWebTfjsTflite platform = MethodChannelLiteRtForFlutterLibsWebTfjsTflite();
  const MethodChannel channel = MethodChannel('lite_rt_for_flutter_libs_web_tfjs_tflite');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}

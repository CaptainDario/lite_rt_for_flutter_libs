import Flutter
import UIKit

public class LiteRtForFlutterLibsFlexDelegateIosPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "lite_rt_for_flutter_libs_flex_delegate_ios", binaryMessenger: registrar.messenger())
    let instance = LiteRtForFlutterLibsFlexDelegateIosPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}

import Cocoa
import FlutterMacOS

public class LiteRtForFlutterLibsCoremlDelegateMacosPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "lite_rt_for_flutter_libs_coreml_delegate_macos", binaryMessenger: registrar.messenger)
    let instance = LiteRtForFlutterLibsCoremlDelegateMacosPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("macOS " + ProcessInfo.processInfo.operatingSystemVersionString)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}

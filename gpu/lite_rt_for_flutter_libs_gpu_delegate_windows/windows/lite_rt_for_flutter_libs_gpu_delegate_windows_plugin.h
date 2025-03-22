#ifndef FLUTTER_PLUGIN_LITE_RT_FOR_FLUTTER_LIBS_GPU_DELEGATE_WINDOWS_PLUGIN_H_
#define FLUTTER_PLUGIN_LITE_RT_FOR_FLUTTER_LIBS_GPU_DELEGATE_WINDOWS_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace lite_rt_for_flutter_libs_gpu_delegate_windows {

class LiteRtForFlutterLibsGpuDelegateWindowsPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  LiteRtForFlutterLibsGpuDelegateWindowsPlugin();

  virtual ~LiteRtForFlutterLibsGpuDelegateWindowsPlugin();

  // Disallow copy and assign.
  LiteRtForFlutterLibsGpuDelegateWindowsPlugin(const LiteRtForFlutterLibsGpuDelegateWindowsPlugin&) = delete;
  LiteRtForFlutterLibsGpuDelegateWindowsPlugin& operator=(const LiteRtForFlutterLibsGpuDelegateWindowsPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace lite_rt_for_flutter_libs_gpu_delegate_windows

#endif  // FLUTTER_PLUGIN_LITE_RT_FOR_FLUTTER_LIBS_GPU_DELEGATE_WINDOWS_PLUGIN_H_

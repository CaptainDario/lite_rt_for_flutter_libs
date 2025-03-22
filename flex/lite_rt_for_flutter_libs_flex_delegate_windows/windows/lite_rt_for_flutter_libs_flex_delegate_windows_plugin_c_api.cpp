#include "include/lite_rt_for_flutter_libs_flex_delegate_windows/lite_rt_for_flutter_libs_flex_delegate_windows_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "lite_rt_for_flutter_libs_flex_delegate_windows_plugin.h"

void LiteRtForFlutterLibsFlexDelegateWindowsPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  lite_rt_for_flutter_libs_flex_delegate_windows::LiteRtForFlutterLibsFlexDelegateWindowsPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}

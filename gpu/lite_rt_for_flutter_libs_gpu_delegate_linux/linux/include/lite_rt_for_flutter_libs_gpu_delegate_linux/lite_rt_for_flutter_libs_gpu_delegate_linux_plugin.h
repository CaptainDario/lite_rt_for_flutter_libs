#ifndef FLUTTER_PLUGIN_LITE_RT_FOR_FLUTTER_LIBS_GPU_DELEGATE_LINUX_PLUGIN_H_
#define FLUTTER_PLUGIN_LITE_RT_FOR_FLUTTER_LIBS_GPU_DELEGATE_LINUX_PLUGIN_H_

#include <flutter_linux/flutter_linux.h>

G_BEGIN_DECLS

#ifdef FLUTTER_PLUGIN_IMPL
#define FLUTTER_PLUGIN_EXPORT __attribute__((visibility("default")))
#else
#define FLUTTER_PLUGIN_EXPORT
#endif

typedef struct _LiteRtForFlutterLibsGpuDelegateLinuxPlugin LiteRtForFlutterLibsGpuDelegateLinuxPlugin;
typedef struct {
  GObjectClass parent_class;
} LiteRtForFlutterLibsGpuDelegateLinuxPluginClass;

FLUTTER_PLUGIN_EXPORT GType lite_rt_for_flutter_libs_gpu_delegate_linux_plugin_get_type();

FLUTTER_PLUGIN_EXPORT void lite_rt_for_flutter_libs_gpu_delegate_linux_plugin_register_with_registrar(
    FlPluginRegistrar* registrar);

G_END_DECLS

#endif  // FLUTTER_PLUGIN_LITE_RT_FOR_FLUTTER_LIBS_GPU_DELEGATE_LINUX_PLUGIN_H_

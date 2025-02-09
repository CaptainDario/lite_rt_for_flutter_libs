#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint lite_rt_for_flutter_libs.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'lite_rt_for_flutter_libs'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter FFI plugin project.'
  s.description      = <<-DESC
A new Flutter FFI plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }

  # This will ensure the source files in Classes/ are included in the native
  # builds of apps using this FFI plugin. Podspec does not support relative
  # paths, so Classes contains a forwarder C file that relatively imports
  # `../src/*` so that the C sources can be shared among all target platforms.
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'

  # If your plugin requires a privacy manifest, for example if it collects user
  # data, update the PrivacyInfo.xcprivacy file to describe your plugin's
  # privacy impact, and then uncomment this line. For more information,
  # see https://developer.apple.com/documentation/bundleresources/privacy_manifest_files
  # s.resource_bundles = {'lite_rt_for_flutter_libs_privacy' => ['Resources/PrivacyInfo.xcprivacy']}

  s.dependency 'FlutterMacOS'

  # Script Phase to copy the correct library at build time
  s.script_phase = {
    :name => 'Select TensorFlow Lite Library',
    :execution_position => :before_compile,
    :script => <<-SCRIPT
      ARCH=$(uname -m)
      if [ "$ARCH" = "arm64" ]; then
        cp -f "${PODS_TARGET_SRCROOT}/libtensorflowlite_arm64_c.dylib" "${PODS_TARGET_SRCROOT}/libtensorflowlite_c.dylib"
        cp -f "${PODS_TARGET_SRCROOT}/libtensorflowlite_arm64_gpu_delegate_c.dylib" "${PODS_TARGET_SRCROOT}/libtensorflowlite_gpu_delegate_c.dylib"
        cp -f "${PODS_TARGET_SRCROOT}/libtensorflowlite_arm64_flex.dylib" "${PODS_TARGET_SRCROOT}/libtensorflowlite_flex.dylib"
      else
        cp -f "${PODS_TARGET_SRCROOT}/libtensorflowlite_x86_c.dylib" "${PODS_TARGET_SRCROOT}/libtensorflowlite_c.dylib"
      fi
    SCRIPT
  }
  #install_name_tool -id @rpath/libtensorflowlite_gpu_delegate_c.dylib libtensorflowlite_gpu_delegate_c.dylib
  s.vendored_libraries = 'libtensorflowlite_c.dylib', 'libtensorflowlite_gpu_delegate_c.dylib', 'libtensorflowlite_flex.dylib'
  
  s.static_framework = true
  s.user_target_xcconfig = {
    'OTHER_LDFLAGS' => [
      '-ltensorflowlite_c -ltensorflowlite_flex',
    ].join(' ')
  }

  s.platform = :osx, '10.11'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end

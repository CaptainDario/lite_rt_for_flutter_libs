#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint lite_rt_for_flutter_libs_flex_delegate_ios.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'lite_rt_for_flutter_libs_flex_delegate_ios'
  s.version          = '0.0.2'
  s.summary          = 'A new Flutter plugin project.'
  s.description      = <<-DESC
A new Flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '12.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.user_target_xcconfig = {
    'OTHER_LDFLAGS' => [
      '-force_load',
      '$(SRCROOT)/Pods/TensorFlowLiteSelectTfOps/Frameworks/TensorFlowLiteSelectTfOps.xcframework/ios-arm64/TensorFlowLiteSelectTfOps.framework/TensorFlowLiteSelectTfOps',
    ].join(' ')
  }
  s.swift_version = '5.0'

  # get tf lite from cocoa
  tflite_version = '2.17.0'
  s.dependency 'TensorFlowLiteSelectTfOps', tflite_version
  s.static_framework = true # this is important to make it work

  # If your plugin requires a privacy manifest, for example if it uses any
  # required reason APIs, update the PrivacyInfo.xcprivacy file to describe your
  # plugin's privacy impact, and then uncomment this line. For more information,
  # see https://developer.apple.com/documentation/bundleresources/privacy_manifest_files
  # s.resource_bundles = {'lite_rt_for_flutter_libs_flex_delegate_ios_privacy' => ['Resources/PrivacyInfo.xcprivacy']}
end

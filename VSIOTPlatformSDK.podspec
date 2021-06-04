#
#  Be sure to run `pod spec lint VSIOTPlatformSDK.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "VSIOTPlatformSDK"
  s.version      = "0.0.8"
  s.swift_version = '5.0'
  s.ios.deployment_target = '10.0'
  s.summary      = "VSIOTPlatformSDK简介"
  s.description  = "VSIOTPlatformSDK长介绍"
  s.homepage     = "https://github.com/djq993452611/VSIOTPlatformSDK"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

   s.license     = "MIT"
 # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  s.author             = { "JianQi" => "13178331272@163.com" }
  s.source       = { :git => "https://github.com/djq993452611/VSIOTPlatformSDK.git", :tag => s.version }
  s.requires_arc = true
  s.static_framework = true
  
  ##路径添加，远程验证有问题的情况，把路径名字改成小写的文件名(还是验证失败就增加新的tag分支验证发布)
  #s.source_files = "**/public/*", "**/public/**/*"
  ##只做framework资源分享，把source_files文件资源删除，sourceTree提交更新代码
  ##（因为source路径需要的是开源仓库路径，所以源文件全部删除,只暴露framework资源）
  s.vendored_frameworks = '**/sources/*.framework'
  
  ##依赖的系统动态库
  s.frameworks = 'UIKit', 'Foundation', 'CoreFoundation', "CoreBluetooth"
  
  ##本库添加的第三方依赖库
  s.dependency 'RxSwift', '~> 5.1.1'
  s.dependency 'RxCocoa', '~> 5.1.1'
  s.dependency 'RxCocoa', '~> 5.1.1'
  
  ##pod lib lint指令会报错 xcodebuild: Returned an unsuccessful exit code.
  ##pod lib lint --verbose 查看具体信息是 App normal arm64
  ##添加下面两行代码解决问题
  s.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }


  
  # s.exclude_files = "Classes/Exclude"
  # spec.public_header_files = "Classes/**/*.h"
  # spec.resource  = "icon.png"
  # spec.resources = "Resources/*.png"
  # spec.preserve_paths = "FilesToSave", "MoreFilesToSave"
  # spec.framework  = "SomeFramework"
  # spec.frameworks = "SomeFramework", "AnotherFramework"
  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"
  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # spec.dependency "JSONKit", "~> 1.4"

end

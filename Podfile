platform :ios, '12.0'

use_frameworks!
use_modular_headers!

target 'LabirintMini' do
  pod 'SwiftLint'
  pod 'SwiftGen', '~> 6.0'
  pod 'ReactiveDataDisplayManager', '~> 7.2.1'
  pod 'NodeKit/UrlCache', :git => 'https://github.com/surfstudio/NodeKit', :tag => '3.2.0'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
    end
  end
end

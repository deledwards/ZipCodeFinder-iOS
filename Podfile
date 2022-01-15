
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target 'ZipCodeFinder' do
  pod 'Alamofire'
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'SwiftyJSON'
  pod 'Swinject'
  pod 'SwinjectAutoregistration'
  pod 'SwinjectStoryboard'
  # pod 'SwiftyBeaver'

  # pod 'SwiftValidator'

  post_install do |installer|
   installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
     config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '10.0'
    end
   end
  end
end

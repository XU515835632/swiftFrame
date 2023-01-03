platform :ios, '11.0'
# 屏蔽所有第三方框架警告
inhibit_all_warnings!
install! 'cocoapods', :warn_for_unused_master_specs_repo => false
source 'https://github.com/CocoaPods/Specs.git'
target 'swiftArchitecture' do
use_frameworks!


# 自动布局
pod 'SnapKit'
# 网络请求
pod 'Moya'
pod 'Alamofire'
pod 'ReachabilitySwift'
# 数据解析
pod 'SwiftyJSON'
# 键盘
pod 'IQKeyboardManagerSwift'
# 网络图片加载缓存
pod 'Kingfisher'
# 数据存储与数据安全
pod 'SwiftyUserDefaults'
# 引导页
pod 'Instructions'
# 图表 Charts
#pod 'Charts'
# 下拉刷新
pod 'ESPullToRefresh'
# 加载框
pod 'PKHUD'


# 更改所有第三方框架 Target 版本
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
    end
  end
end


end

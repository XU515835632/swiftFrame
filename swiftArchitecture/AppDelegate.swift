//
//  AppDelegate.swift
//  swiftArchitecture
//
//  Created by apple on 2022/11/9.
//

import UIKit
import IQKeyboardManagerSwift
import PKHUD
import SwiftyUserDefaults
import SwiftyJSON
import Alamofire

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //初始化 window
        AppDelegate_configIQKeyboardManager()
        monitorNetwork()
        return true
    }
    
    func initWindow() {
        // 创建窗口
        self.window = UIWindow.init()
        self.window?.backgroundColor = UIColor.white
        self.window?.frame = UIScreen.main.bounds
        // 显示窗口
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = BaseTabBarController()
    }
    
    // MARK: - 键盘处理
    func AppDelegate_configIQKeyboardManager() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = true //工具条
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true //点击背景收回键盘
        IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "完成"
        //        IQKeyboardManager.shared.preventShowingBottomBlankSpace = true
        //        IQKeyboardManager.shared.preventShowingBottomBlankSpace = false
        IQKeyboardManager.shared.toolbarTintColor = .lightGray
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 5.0
    }
    
    // MARK: - 实时网络监测
    func monitorNetwork() {
        ReachabilityTool.monitorNetworkStatus { status in
            var message = ""
            switch status {
            case .unknown:
                message = "未知网络"
            case .notReachable:
                message = "无网络连接"
            case .wwan:
                message = "蜂窝移动网络"
            case .ethernetOrWiFi:
                message = "WiFi"
            }
            CbsLog("当前网络状态===：\(message)")
//            HUD.flash(.label(message),delay: 2.0)
        }
    }
}


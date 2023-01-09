//
//  ReachabilityTool.swift
//  swiftArchitecture
//
//  Created by apple on 2022/12/26.
//

import UIKit
import Reachability

enum NetworkStatus {
    /// 未知网络
    case unknown
    /// 无网络
    case notReachable
    /// 手机网络
    case wwan
    // WIFI网络
    case ethernetOrWiFi
}

class ReachabilityTool {
    
    static let shared = ReachabilityTool()
    
    static let reachability = try! Reachability()
    
    /// 监听网络变化 - ReachabilitySwift
    static func monitorNetworkStatus(status: @escaping(NetworkStatus)->Void) {
        // 网络可用或切换网络类型时执行
        reachability.whenReachable = { reachability in
            if reachability.connection == .wifi {
                KLog("WiFi")
                status(.ethernetOrWiFi)
            } else {
                KLog("蜂窝移动网络")
                status(.wwan)
            }
        }
        
        // 网络不可用时执行
        reachability.whenUnreachable = { reachability in
            KLog("无网络连接")
            status(.notReachable)
        }
        
        do {
            // 开始监听，停止监听调用reachability.stopNotifier()即可
            try reachability.startNotifier()
        } catch {
            KLog("Unable to start notifier")
        }
    }
}


//
//  CbsConfigMacro.swift
//  swiftArchitecture
//
//  Created by apple on 2022/12/26.
//

import Foundation
import UIKit


// MARK: - 应用信息


/// App 显示名称
let kAppDisplayName = Bundle.main.infoDictionary?["CFBundleDisplayName"] ?? ""
/// App BundleName
let kAppName = Bundle.main.infoDictionary![kCFBundleNameKey as String] ?? ""
/// App BundleID
let kAppBundleID = Bundle.main.bundleIdentifier ?? ""
/// App 版本号
let kAppVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] ?? ""
/// App BuildNumber
let kAppBuildNumber = Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) ?? ""

/// App Language en
let kAPPLanguage = NSLocale.preferredLanguages[0]

let CbsApplication = UIApplication.shared
let CbsKeyWindow = UIApplication.shared.keyWindow
let CbsAppDelegate = UIApplication.shared.delegate
let CbsUserDefaults = UserDefaults.standard
let CbsNotificationCenter = NotificationCenter.default


// MARK: - 打印输出

/// 默认打印
public func CbsLog<T>(_ message: T) {
#if DEBUG
    print("\(message)")
#endif
}

/// 全部打印
public func CbsAllLog<T>(_ message: T, file: String = #file, funcName: String = #function, lineNum: Int = #line) {
#if DEBUG
    let fileName = (file as NSString).lastPathComponent
    print("\n********** CbsAllLog-satrt ***********\n\n文件名称:\(fileName)\n方法名称:\(funcName)\n行数:\(lineNum)\n信息:\n\n\(message)\n\n********** CbsAllLog-end ***********\n")
#endif
}

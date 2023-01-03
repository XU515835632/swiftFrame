//
//  UIColor+Cbs_DarkColor.swift
//  swiftArchitecture
//
//  Created by apple on 2022/11/9.
//

import UIKit

extension UIColor {
    
    /// 设置动态颜色
    static func Cbs_dynamicColor(_ lightColor: UIColor, _ darkColor: UIColor) -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.init{ (traitCollection: UITraitCollection) -> UIColor in
                if (traitCollection.userInterfaceStyle == .light) {
                    return lightColor
                } else {
                    return darkColor
                }
            };
        } else {
            return lightColor
        }
    }
    
    /// 设置动态颜色（十六进制，color：支持“#123456” ）
    static func Cbs_dynamicHexColor(_ lightColor: String, _ darkColor: String) -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.init{ (traitCollection: UITraitCollection) -> UIColor in
                if (traitCollection.userInterfaceStyle == .light) {
                    return UIColor.Cbs_hexColor(lightColor)
                } else {
                    return UIColor.Cbs_hexColor(darkColor)
                }
            }
        } else {
            return UIColor.Cbs_hexColor(lightColor)
        }
    }
    
    /// 设置动态颜色（十六进制，color：支持“#123456” ）
    static func Cbs_isdynamicHexColor(_ lightColor: String, _ darkColor: String) -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.init{ (traitCollection: UITraitCollection) -> UIColor in
                if (traitCollection.userInterfaceStyle == .light) {
                    return UIColor.Cbs_hexColor(lightColor)
                } else {
                    return UIColor.Cbs_hexColor(darkColor)
                }
            }
        } else {
            return UIColor.Cbs_hexColor(lightColor)
        }
    }
  
}


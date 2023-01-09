//
//  UIColor+K_DarkColor.swift
//  swiftArchitecture
//
//  Created by apple on 2022/11/9.
//

import UIKit

extension UIColor {
    
    /// 设置动态颜色
    static func K_dynamicColor(_ lightColor: UIColor, _ darkColor: UIColor) -> UIColor {
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
    static func K_dynamicHexColor(_ lightColor: String, _ darkColor: String) -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.init{ (traitCollection: UITraitCollection) -> UIColor in
                if (traitCollection.userInterfaceStyle == .light) {
                    return UIColor.K_hexColor(lightColor)
                } else {
                    return UIColor.K_hexColor(darkColor)
                }
            }
        } else {
            return UIColor.K_hexColor(lightColor)
        }
    }
    
    /// 设置动态颜色（十六进制，color：支持“#123456” ）
    static func K_isdynamicHexColor(_ lightColor: String, _ darkColor: String) -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.init{ (traitCollection: UITraitCollection) -> UIColor in
                if (traitCollection.userInterfaceStyle == .light) {
                    return UIColor.K_hexColor(lightColor)
                } else {
                    return UIColor.K_hexColor(darkColor)
                }
            }
        } else {
            return UIColor.K_hexColor(lightColor)
        }
    }
  
}


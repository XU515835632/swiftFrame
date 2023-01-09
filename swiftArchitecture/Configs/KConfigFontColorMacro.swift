//
//  KConfigFontColorMacro.swift
//  swiftArchitecture
//
//  Created by apple on 2022/11/9.
//

import UIKit


// MARK: -颜色设置

/// RGB颜色设置：支持(255, 255, 255)
func KColor (_ r:CGFloat, _ g:CGFloat,_ b:CGFloat) -> UIColor {
    return UIColor(red: CGFloat(r) / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
}
func KColorA(_ r:CGFloat,_ g:CGFloat,_ b:CGFloat,_ a:CGFloat) -> UIColor {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
}
func KRandomColor() -> UIColor {
    return KColor(CGFloat(arc4random_uniform(255)), CGFloat(arc4random_uniform(255)), CGFloat(arc4random_uniform(255)))
}
func KGrayColor(_ v:CGFloat) -> UIColor {
    return KColor(v,v,v)
}

/// 十六进制颜色设置：支持#FF0000
func KHexColor(_ rgbValue: String) -> UIColor? {
    
    return UIColor.K_hexColor(rgbValue)
}
func KHexColorA(_ rgbValue: String,_ a:CGFloat) -> UIColor? {
    return UIColor.K_hexColorA(rgbValue, a)
}

// MARK: - dark mode 配置

/// 是否开启暗黑模式，iOS13之后生效，在info设置UIUserInterfaceStyle禁用则不起作用
let K_IsOpenDarkMode = true

/// 设置动态颜色
func KDynamicColor(_ lightColor: UIColor, _ darkColor: UIColor) -> UIColor {
    return K_IsOpenDarkMode==false ? UIColor.K_dynamicColor(lightColor, lightColor) : UIColor.K_dynamicColor(lightColor, darkColor)
}

/// 设置动态颜色（十六进制，color：支持“#123456” ）
func KDynamicHexColor(_ lightColor: String, _ darkColor: String) -> UIColor {
    return K_IsOpenDarkMode==false ? UIColor.K_dynamicHexColor(lightColor, lightColor) : UIColor.K_dynamicHexColor(lightColor, darkColor)
}

/// 设置动态图片
func KDynamicImage(_ lightImage: String, _ darkImage: String) -> UIImage {
    return K_IsOpenDarkMode==false ? UIImage.K_dynamicImage(lightImage, lightImage) : UIImage.K_dynamicImage(lightImage, darkImage)
}


// MARK: - 项目颜色

/// 主题色
let BaseThemeColor = KColor(214, 66, 58)
let BaseThemeGreenColor = KColor(0, 190, 102)
/// 背景色
let BaseBgColor = KDynamicColor(BaseBgColor_Light, BaseBgColor_Dark)
let BaseBgColor_Light = KColor(248, 248, 248)
let BaseBgColor_Dark  = KGrayColor(17)
/// 基础黑
let BaseBlackTextColor = KColor(153, 153, 153)
let BaseBlackTextColor_Dark = KGrayColor(198)
/// 浅灰色
let BaseLightGreyTextColor = KColor(119, 119, 119)
let BaseLightGreyTextColor_Dark = KGrayColor(120)

/// Label颜色
let BaseLabelColor = KDynamicColor(BaseBlackTextColor, BaseBlackTextColor_Dark)
/// title Label颜色
let BaseTitleLabelColor = KDynamicColor(BaseBlackTextColor, BaseBlackTextColor_Dark)
/// info Label颜色
let BaseInfoLabelColor = KDynamicColor(KGrayColor(150), KGrayColor(150))
/// Placeholder颜色
let BasePlaceholderColor = KDynamicColor(KGrayColor(187), KGrayColor(87))
/// 分割线颜色
let BaselineColor = KDynamicColor(KColor(230, 230, 230), KGrayColor(35))
/// 空数据文字颜色
let BaseEmptyDataTextColor = KDynamicColor(BaseLightGreyTextColor, BaseLightGreyTextColor_Dark)
/// 导航条背景色，白底黑字
let BaseNavBgColor = KDynamicColor(UIColor.white, BaseBgColor)
/// 导航条标题颜色
let BaseNavTitleColor = KDynamicColor(UIColor.black, UIColor.white)
/// 导航条item文字颜色
let BaseNavTextColor = KDynamicColor(UIColor.black, UIColor.white)
/// 导航条背景色，主题色白字
let BaseNavBgColor2 = KDynamicColor(BaseThemeColor, BaseBgColor)
/// 导航条标题颜色
let BaseNavTitleColor2 = KDynamicColor(UIColor.white, UIColor.white)
/// TabBar背景色
let BaseTabBarBgColor = KDynamicColor(UIColor.white, KGrayColor(29))
/// TabBar默认文字颜色
let BaseTabBarNormalTextColor = KDynamicColor(BaseBlackTextColor, BaseBlackTextColor_Dark)
/// TabBar选中文字颜色
let BaseTabBarSelectTextColor = KDynamicColor(BaseThemeColor, BaseThemeColor)
/// Cell背景颜色
let BaseCellBgColor = KDynamicColor(UIColor.white, KGrayColor(25))
/// TextView背景颜色
let BaseTextViewBgColor = KDynamicColor(KGrayColor(250), KGrayColor(50))
/// Btn、segment等UI组件背景颜色
let BaseBtnBgColor = KDynamicColor(BaseThemeColor, KGrayColor(43))
/// Toast 背景颜色
let BaseToastBgColor = KDynamicColor(UIColor.white, KGrayColor(47))
/// Alert 背景颜色
let BaseAlertBgColor = KDynamicColor(UIColor.white, KGrayColor(44))
/// Picker 背景颜色
let BasePickerBgColor = KDynamicColor(UIColor.white, KGrayColor(30))
/// Pop 背景颜色
let BasePopBgColor = KDynamicColor(UIColor.white, KGrayColor(64))



// MARK: - 字体设置

/// 设置字体大小
func KFont(_ size:CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: size)
}
/// 设置粗体字字号
func KBoldFont(_ size:CGFloat) -> UIFont {
    return UIFont.boldSystemFont(ofSize: size)
}

/// 根据屏幕自适应字体参数 16 * FontFit
let KFontFit = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height) / 375

/// 系统默认字体
func SystemFont(_ size: CGFloat) -> UIFont {
    return .systemFont(ofSize: size)
}
/// 系统默认字体
func SystemFontBold(_ size: CGFloat) -> UIFont {
    return .boldSystemFont(ofSize: size)
}

// MARK: - 常用系统字体大小

let KFont_10 = KFont(10)
let KFont_11 = KFont(11)
let KFont_12 = KFont(12)
let KFont_13 = KFont(13)
let KFont_14 = KFont(14)
let KFont_15 = KFont(15)
let KFont_16 = KFont(16)
let KFont_17 = KFont(17)
let KFont_18 = KFont(18)
let KFont_19 = KFont(19)
let KFont_20 = KFont(20)
let KFont_25 = KFont(25)
let KFont_30 = KFont(30)

// MARK: - 常用粗体系统字体大小

let KBoldFont_10 = KBoldFont(10)
let KBoldFont_11 = KBoldFont(11)
let KBoldFont_12 = KBoldFont(12)
let KBoldFont_13 = KBoldFont(13)
let KBoldFont_14 = KBoldFont(14)
let KBoldFont_15 = KBoldFont(15)
let KBoldFont_16 = KBoldFont(16)
let KBoldFont_17 = KBoldFont(17)
let KBoldFont_18 = KBoldFont(18)
let KBoldFont_19 = KBoldFont(19)
let KBoldFont_20 = KBoldFont(20)
let KBoldFont_25 = KBoldFont(25)
let KBoldFont_30 = KBoldFont(30)

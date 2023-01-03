//
//  CbsConfigFontColorMacro.swift
//  swiftArchitecture
//
//  Created by apple on 2022/11/9.
//

import UIKit


// MARK: -颜色设置

/// RGB颜色设置：支持(255, 255, 255)
func CbsColor (_ r:CGFloat, _ g:CGFloat,_ b:CGFloat) -> UIColor {
    return UIColor(red: CGFloat(r) / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
}
func CbsColorA(_ r:CGFloat,_ g:CGFloat,_ b:CGFloat,_ a:CGFloat) -> UIColor {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
}
func CbsRandomColor() -> UIColor {
    return CbsColor(CGFloat(arc4random_uniform(255)), CGFloat(arc4random_uniform(255)), CGFloat(arc4random_uniform(255)))
}
func CbsGrayColor(_ v:CGFloat) -> UIColor {
    return CbsColor(v,v,v)
}

/// 十六进制颜色设置：支持#FF0000
func CbsHexColor(_ rgbValue: String) -> UIColor? {
    
    return UIColor.Cbs_hexColor(rgbValue)
}
func CbsHexColorA(_ rgbValue: String,_ a:CGFloat) -> UIColor? {
    return UIColor.Cbs_hexColorA(rgbValue, a)
}

// MARK: - dark mode 配置

/// 是否开启暗黑模式，iOS13之后生效，在info设置UIUserInterfaceStyle禁用则不起作用
let Cbs_IsOpenDarkMode = true

/// 设置动态颜色
func CbsDynamicColor(_ lightColor: UIColor, _ darkColor: UIColor) -> UIColor {
    return Cbs_IsOpenDarkMode==false ? UIColor.Cbs_dynamicColor(lightColor, lightColor) : UIColor.Cbs_dynamicColor(lightColor, darkColor)
}

/// 设置动态颜色（十六进制，color：支持“#123456” ）
func CbsDynamicHexColor(_ lightColor: String, _ darkColor: String) -> UIColor {
    return Cbs_IsOpenDarkMode==false ? UIColor.Cbs_dynamicHexColor(lightColor, lightColor) : UIColor.Cbs_dynamicHexColor(lightColor, darkColor)
}

/// 设置动态图片
func CbsDynamicImage(_ lightImage: String, _ darkImage: String) -> UIImage {
    return Cbs_IsOpenDarkMode==false ? UIImage.Cbs_dynamicImage(lightImage, lightImage) : UIImage.Cbs_dynamicImage(lightImage, darkImage)
}


// MARK: - 项目颜色

/// 主题色
let BaseThemeColor = CbsColor(214, 66, 58)
let BaseThemeGreenColor = CbsColor(0, 190, 102)
/// 背景色
let BaseBgColor = CbsDynamicColor(BaseBgColor_Light, BaseBgColor_Dark)
let BaseBgColor_Light = CbsColor(248, 248, 248)
let BaseBgColor_Dark  = CbsGrayColor(17)
/// 基础黑
let BaseBlackTextColor = CbsColor(153, 153, 153)
let BaseBlackTextColor_Dark = CbsGrayColor(198)
/// 浅灰色
let BaseLightGreyTextColor = CbsColor(119, 119, 119)
let BaseLightGreyTextColor_Dark = CbsGrayColor(120)

/// Label颜色
let BaseLabelColor = CbsDynamicColor(BaseBlackTextColor, BaseBlackTextColor_Dark)
/// title Label颜色
let BaseTitleLabelColor = CbsDynamicColor(BaseBlackTextColor, BaseBlackTextColor_Dark)
/// info Label颜色
let BaseInfoLabelColor = CbsDynamicColor(CbsGrayColor(150), CbsGrayColor(150))
/// Placeholder颜色
let BasePlaceholderColor = CbsDynamicColor(CbsGrayColor(187), CbsGrayColor(87))
/// 分割线颜色
let BaselineColor = CbsDynamicColor(CbsColor(230, 230, 230), CbsGrayColor(35))
/// 空数据文字颜色
let BaseEmptyDataTextColor = CbsDynamicColor(BaseLightGreyTextColor, BaseLightGreyTextColor_Dark)
/// 导航条背景色，白底黑字
let BaseNavBgColor = CbsDynamicColor(UIColor.white, BaseBgColor)
/// 导航条标题颜色
let BaseNavTitleColor = CbsDynamicColor(UIColor.black, UIColor.white)
/// 导航条item文字颜色
let BaseNavTextColor = CbsDynamicColor(UIColor.black, UIColor.white)
/// 导航条背景色，主题色白字
let BaseNavBgColor2 = CbsDynamicColor(BaseThemeColor, BaseBgColor)
/// 导航条标题颜色
let BaseNavTitleColor2 = CbsDynamicColor(UIColor.white, UIColor.white)
/// TabBar背景色
let BaseTabBarBgColor = CbsDynamicColor(UIColor.white, CbsGrayColor(29))
/// TabBar默认文字颜色
let BaseTabBarNormalTextColor = CbsDynamicColor(BaseBlackTextColor, BaseBlackTextColor_Dark)
/// TabBar选中文字颜色
let BaseTabBarSelectTextColor = CbsDynamicColor(BaseThemeColor, BaseThemeColor)
/// Cell背景颜色
let BaseCellBgColor = CbsDynamicColor(UIColor.white, CbsGrayColor(25))
/// TextView背景颜色
let BaseTextViewBgColor = CbsDynamicColor(CbsGrayColor(250), CbsGrayColor(50))
/// Btn、segment等UI组件背景颜色
let BaseBtnBgColor = CbsDynamicColor(BaseThemeColor, CbsGrayColor(43))
/// Toast 背景颜色
let BaseToastBgColor = CbsDynamicColor(UIColor.white, CbsGrayColor(47))
/// Alert 背景颜色
let BaseAlertBgColor = CbsDynamicColor(UIColor.white, CbsGrayColor(44))
/// Picker 背景颜色
let BasePickerBgColor = CbsDynamicColor(UIColor.white, CbsGrayColor(30))
/// Pop 背景颜色
let BasePopBgColor = CbsDynamicColor(UIColor.white, CbsGrayColor(64))



// MARK: - 字体设置

/// 设置字体大小
func CbsFont(_ size:CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: size)
}
/// 设置粗体字字号
func CbsBoldFont(_ size:CGFloat) -> UIFont {
    return UIFont.boldSystemFont(ofSize: size)
}

/// 根据屏幕自适应字体参数 16 * FontFit
let CbsFontFit = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height) / 375

/// 系统默认字体
func SystemFont(_ size: CGFloat) -> UIFont {
    return .systemFont(ofSize: size)
}
/// 系统默认字体
func SystemFontBold(_ size: CGFloat) -> UIFont {
    return .boldSystemFont(ofSize: size)
}

// MARK: - 常用系统字体大小

let CbsFont_10 = CbsFont(10)
let CbsFont_11 = CbsFont(11)
let CbsFont_12 = CbsFont(12)
let CbsFont_13 = CbsFont(13)
let CbsFont_14 = CbsFont(14)
let CbsFont_15 = CbsFont(15)
let CbsFont_16 = CbsFont(16)
let CbsFont_17 = CbsFont(17)
let CbsFont_18 = CbsFont(18)
let CbsFont_19 = CbsFont(19)
let CbsFont_20 = CbsFont(20)
let CbsFont_25 = CbsFont(25)
let CbsFont_30 = CbsFont(30)

// MARK: - 常用粗体系统字体大小

let CbsBoldFont_10 = CbsBoldFont(10)
let CbsBoldFont_11 = CbsBoldFont(11)
let CbsBoldFont_12 = CbsBoldFont(12)
let CbsBoldFont_13 = CbsBoldFont(13)
let CbsBoldFont_14 = CbsBoldFont(14)
let CbsBoldFont_15 = CbsBoldFont(15)
let CbsBoldFont_16 = CbsBoldFont(16)
let CbsBoldFont_17 = CbsBoldFont(17)
let CbsBoldFont_18 = CbsBoldFont(18)
let CbsBoldFont_19 = CbsBoldFont(19)
let CbsBoldFont_20 = CbsBoldFont(20)
let CbsBoldFont_25 = CbsBoldFont(25)
let CbsBoldFont_30 = CbsBoldFont(30)

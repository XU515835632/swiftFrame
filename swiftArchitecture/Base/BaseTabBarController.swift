//
//  BaseTabBarController.swift
//  swiftArchitecture
//
//  Created by apple on 2022/11/9.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupItemTitleTextAttributes();
        setupChildViewControllers()
    }
    
    func setupItemTitleTextAttributes() {
        let normalColor = BaseTabBarNormalTextColor;
        let selectColor = BaseTabBarSelectTextColor;
        K_setTabBarColor(normalColor, selectColor, nil)
    }
    
    /// 添加所有子控制器
    func setupChildViewControllers() {
        setupOneChildViewController(childVC: HomeViewController(), title: "首页", image: "tab1", selectedImage: "tab1_select")
        setupOneChildViewController(childVC: SquareViewController(), title: "广场", image: "tab2", selectedImage: "tab2_select")
        setupOneChildViewController(childVC: OptionalViewController(), title: "自选", image: "tab3", selectedImage: "tab3_select")
        setupOneChildViewController(childVC: MineViewController(), title: "我的", image: "tab4", selectedImage: "tab4_select")
    }
    
    /// 初始化一个子控制器
    fileprivate func setupOneChildViewController(childVC:UIViewController,title:String,image:String,selectedImage:String) {
        //设置tabbar的文字
        childVC.tabBarItem.title = title;
        if (image.count>0) { // 图片名有具体值
            childVC.tabBarItem.image = UIImage(named: image)?.withRenderingMode(.alwaysOriginal)
            // 声明：这张图片按照原始的样子显示出来，不要自动渲染成其他颜色（比如蓝色）
            childVC.tabBarItem.selectedImage = UIImage(named: selectedImage)?.withRenderingMode(.alwaysOriginal)
        }
        let nav = BaseNavigationController.init(rootViewController: childVC)
        self.addChild(nav)
    }
    
}

func K_setTabBarColor(_ normalColor:UIColor,_ selectColor:UIColor,_ bgColor:UIColor?) {
    let tabBarItem = UITabBarItem.appearance();
    
    // 普通状态下的文字属性
    var normalAttrs = Dictionary<NSAttributedString.Key,Any>();
    normalAttrs[NSAttributedString.Key.font] = UIFont.systemFont(ofSize: 10);
    normalAttrs[NSAttributedString.Key.foregroundColor] = normalColor;
    // 选中状态下的文字属性
    var selectedAttrs = Dictionary<NSAttributedString.Key,Any>();
    selectedAttrs[NSAttributedString.Key.font] = UIFont.systemFont(ofSize: 10);
    selectedAttrs[NSAttributedString.Key.foregroundColor] = selectColor;
    
    tabBarItem.setTitleTextAttributes(normalAttrs, for: .normal);
    tabBarItem.setTitleTextAttributes(selectedAttrs, for: .normal);
    
    // iOS13适配，处理未选中颜色失效
    if #available(iOS 13.0, *) {
        UITabBar.appearance().unselectedItemTintColor = normalColor
    }
    // iOS15适配，处理tabBar背景和分割线透明，选中颜色失效
    if #available(iOS 15.0, *) {
        let appearance = UITabBarAppearance();
        if (bgColor != nil) {
            appearance.backgroundColor = bgColor; // tabBar背景颜色
        }
        //        appearance.backgroundEffect = nil; // 去掉半透明效果
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = normalAttrs;
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = selectedAttrs;
        UITabBar.appearance().standardAppearance = appearance;
        UITabBar.appearance().scrollEdgeAppearance = appearance;
    }
}

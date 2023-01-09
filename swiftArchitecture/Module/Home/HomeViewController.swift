//
//  HomeViewController.swift
//  swiftArchitecture
//
//  Created by apple on 2022/12/27.
//

import Foundation 
import UIKit

class HomeViewController: BaseViewController {
    
    override func viewDidLoad() {
        
        initNav()
        pushLogin()

        let userDefaults = UserDefaults.standard
        if userDefaults.value(forKey: "showIntroView") == nil {
            userDefaults.setValue("showView", forKey: "showIntroView")
            guidePage()
        }
    }
    
    func pushLogin() {
        let loginVc = LoginViewController()
        loginVc.modalPresentationStyle = UIModalPresentationStyle(rawValue: 0)!
        self.navigationController!.present(loginVc, animated: true)
    }
    
    func initNav() {
        self.view.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1)
        self.navigationController?.navigationBar.isHidden = true
    }
    

    func guidePage() {
        let imageArray = ["GuidePages_1.png","GuidePages_2.png","GuidePages_3.png"];
        let guideView = GuidePageView.init(images: imageArray) {
            KLog("进入")
        } startCompletion: {
            KLog("开始使用app")
        }
        guideView.skipButton.isHidden = true
        guideView.backgroundColor = UIColor.white
        KKeyWindow?.addSubview(guideView)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if #available(iOS 13.0, *) {
            if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
                // 适配代码
                configureTheme()
            }
        }
    }
    
    private func configureTheme() {
//        initNav()
    }
    
}

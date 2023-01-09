//
//  UIViewController+Extension.swift
//  swiftArchitecture
//
//  Created by apple on 2022/12/26.
//

import UIKit


extension UIViewController {
    
    class func K_stringFromClass(_ className : AnyClass) -> String {
        let str : String = NSStringFromClass(className)
        return str
    }
    
}

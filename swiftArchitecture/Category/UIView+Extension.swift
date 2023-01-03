//
//  UIView+Extension.swift
//  swiftArchitecture
//
//  Created by apple on 2022/12/26.
//

import Foundation

import UIKit


extension UIView {
    
    public var Cbs_x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set(newValue) {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    
    public var Cbs_y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set(newValue) {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    public var Cbs_width: CGFloat {
        get {
            return self.frame.size.width
        }
        set(newValue) {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }
    
    public var Cbs_height: CGFloat {
        get {
            return self.frame.size.height
        }
        set(newValue) {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }
    
    public var Cbs_centerX: CGFloat {
        get {
            return self.center.x
        }
        set(newValue) {
            var center = self.center
            center.x = newValue
            self.center = center
        }
    }
    
    public var Cbs_centerY: CGFloat {
        get {
            return self.center.y
        }
        set(newValue) {
            var center = self.center
            center.y = newValue
            self.center = center
        }
    }
    
    public var Cbs_maxX: CGFloat {
        get {
            return self.frame.maxX
        }
    }
    
    public var Cbs_maxY: CGFloat {
        get {
            return self.frame.maxY
        }
    }
    
    public var Cbs_midX: CGFloat {
        get {
            return self.frame.midX
        }
    }
    
    public var Cbs_midY: CGFloat {
        get {
            return self.frame.midY
        }
    }
    
    public var Cbs_size: CGSize {
        get {
            return self.frame.size
        }
        set(newValue) {
            var frame = self.frame
            frame.size = newValue
            self.frame = frame
        }
    }
    
    public var Cbs_origin: CGPoint {
        get {
            return self.frame.origin
        }
        set(newValue) {
            var frame = self.frame
            frame.origin = newValue
            self.frame = frame
        }
    }
    
    public var Cbs_left: CGFloat {
        get {
            return self.frame.origin.x
        }
        set(newValue) {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    
    public var Cbs_top: CGFloat {
        get {
            return self.frame.origin.y
        }
        set(newValue) {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    public var Cbs_right: CGFloat {
        get {
            return self.frame.origin.x + self.frame.size.width
        }
        set(newValue) {
            var frame = self.frame
            frame.origin.x = newValue - frame.size.width;
            self.frame = frame
        }
    }
    
    public var Cbs_bottom: CGFloat {
        get {
            return self.frame.origin.y + self.frame.size.height
        }
        set(newValue) {
            var frame = self.frame
            frame.origin.y = newValue - frame.size.height
            self.frame = frame
        }
    }
    
    /// 渐变色
    public func Cbs_gradientColor(_ startColor: UIColor,_ endColor: UIColor,_ startPoint: CGPoint,_ endPoint: CGPoint) -> Void {
        let gradientLayer = CAGradientLayer.init()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        self.layer.addSublayer(gradientLayer)
    }
    
    /// 删除所有的子视图
    public func Cbs_removeAllSubviews() -> Void {
        for view : UIView in self.subviews {
            view.removeFromSuperview()
        }
    }
    
}

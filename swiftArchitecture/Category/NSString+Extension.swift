//
//  NSString+Extension.swift
//  swiftArchitecture
//
//  Created by apple on 2022/12/28.
//

import Foundation

//MARK:检查是否是中文
extension String {
    
    //只能为中文
    func onlyInputChineseCharacters(_ string: String) -> Bool {
        let inputString = "[\u{4e00}-\u{9fa5}]+"
        let predicate = NSPredicate(format: "SELF MATCHES %@", inputString)
        let Chinese = predicate.evaluate(with: string)
        return Chinese
    }
}

// MARK: - 银行卡暗文
extension String {
    func replaceIndexStr(replaceStr newString : String,replaceLength index : Int,replaceStr stttr : String) -> String {
        var ddd : String = newString
        ddd.replaceSubrange(ddd.startIndex...ddd.index(ddd.startIndex, offsetBy: index), with: stttr)
        return ddd
    }
    
    /// 检查邮箱格式
    func validateEmail() -> Bool {
        let emailRegex: String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest: NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: self)
    }
    
    // 校验验证码
    func validateAutoCode() -> Bool {
        let emailRegex: String = "[a-zA-Z0-9._%+-]+"
        let emailTest: NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: self)
    }
    
    /// 校验身份证
    func checkUserIdCard(idCard:String) ->Bool {
        let pattern = "(^[0-9]{15}$)|([0-9]{17}([0-9]|X)$)";
        let pred = NSPredicate(format: "SELF MATCHES %@", pattern)
        let isMatch:Bool = pred.evaluate(with: idCard)
        return isMatch;
    }
    
    //// 检查用户名
    func checkUserName(userName:NSString) ->Bool {
        let pattern = "^[a-zA-Z\\u4E00-\\u9FA5]{1,20}"
        let pred = NSPredicate(format: "SELF MATCHES %@", pattern)
        let isMatch:Bool = pred.evaluate(with: userName)
        return isMatch;
    }
    
    /// 检密码
    func checkPass(passStr : String) -> Bool {
        let regex = "^[A-Za-z0-9\\^\\$\\.\\+\\*_@!#%&~=-]{6,32}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        let isMatch:Bool = predicate.evaluate(with: passStr)
        return isMatch
    }
    
    /// 检查支付密码
    func checkPaypass(passStr : String) -> Bool {
        let regex = "[0-9._%+-]{6}"
        let emailTest: NSPredicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return emailTest.evaluate(with: self)
    }
    
    /// 校验手机号
    func checkMobile(mobileNumbel:NSString) ->Bool
    {
        if mobileNumbel.length == 0 {
             return false
         }
         let mobile = "^1([358][0-9]|4[579]|66|7[0135678]|9[89])[0-9]{8}$"
         let regexMobile = NSPredicate(format: "SELF MATCHES %@",mobile)
         if regexMobile.evaluate(with: mobileNumbel) == true {
             return true
         }else
         {
             return false
         }
    }
    
    /// 校验验证码
    func checkAuthStr(password:NSString) ->Bool {
        let pattern = "^([0-9]){6}"
        let pred = NSPredicate(format: "SELF MATCHES %@", pattern)
        let isMatch:Bool = pred.evaluate(with: password)
        return isMatch;
    }
    
    // 校验金额
    func validateMoney() -> Bool {
        let emailRegex: String = "^[0-9]+(\\.[0-9]{1,6})?$"
        let emailTest: NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: self)
    }

    
    //Range转换为NSRange
    func range(from nsRange: NSRange) -> Range<String.Index>? {
        guard
            let from16 = utf16.index(utf16.startIndex, offsetBy: nsRange.location,
                                     limitedBy: utf16.endIndex),
            let to16 = utf16.index(from16, offsetBy: nsRange.length,
                                   limitedBy: utf16.endIndex),
            let from = String.Index(from16, within: self),
            let to = String.Index(to16, within: self)
            else { return nil }
        return from ..< to
    }
    
    /// 检查字符串中小数后8位
    func checkDotLenght(_ checkStr : String) -> Bool {
        let srrr = checkStr
        
        let arr : [String] = srrr.components(separatedBy: ".")
        print(arr)
        if (arr.last?.count)! > 8 {
            print("超过位数限定")
            return false
        } else {
            return true
        }
    }
    
    // 校验是否是数字
    func checkIsNumber() -> Bool {
        let emailRegex: String = "[a-zA-Z]"
        let emailTest: NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: self)
    }
    
    
    //根据开始位置和长度截取字符串
    func subString(start:Int, length:Int = -1)->String {
        var len = length
        if len == -1 {
            len = count - start
        }
        let st = index(startIndex, offsetBy:start)
        let en = index(st, offsetBy:len)
        return String(self[st ..< en])
    }
    
    
    func numberSuitScanf(_ number: String) -> String {
        
        //如果是手机号码的话
        let numberString: String = (number as NSString).replacingCharacters(in: NSRange(location: 3, length: 4), with: "****")
        return numberString
    }

    /// 时间戳转换成时间
    ///
    /// - Parameters:
    ///   - dateInterVal: 需要转的时间戳
    ///   - withDateFormat: 时间格式
    /// - Returns: 返回转换好的时间
    static func changeToDate(_ dateInterVal : Int,_ withDateFormat : String) -> String {
        //时间戳
        let timeStamp = dateInterVal / 1000
        
        //转换为时间
        let timeInterval:TimeInterval = TimeInterval(timeStamp)
        let date = Date(timeIntervalSince1970: timeInterval)
        
        //格式话输出
        let dformatter = DateFormatter()
        dformatter.dateFormat = withDateFormat
        return dformatter.string(from: date)
    }
}


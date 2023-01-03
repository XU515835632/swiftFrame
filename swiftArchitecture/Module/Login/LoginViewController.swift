//
//  LoginViewController.swift
//  swiftArchitecture
//
//  Created by apple on 2022/12/27.
//

import Foundation
import UIKit
import SnapKit
import PKHUD
import SwiftyJSON


class LoginViewController: BaseViewController, UITextFieldDelegate {
    
    var countDownTimer:Timer!;
    var countDownSeconds:NSInteger!;
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.white;
        countDownSeconds = 60;

        initNav()
        setUI()
        
        NotificationCenter.default.addObserver(self,
                 selector: #selector(textFieldTextDidChangeOneCI),
                 name:NSNotification.Name(rawValue:"UITextFieldTextDidChangeNotification"),
                                               object: self.phoneTextFiled)
        
        NotificationCenter.default.addObserver(self,
                 selector: #selector(textFieldTextDidChangeOneCI),
                 name:NSNotification.Name(rawValue:"UITextFieldTextDidChangeNotification"),
                                               object: self.msgTextFiled)
        
    }
    deinit {
        if(countDownTimer != nil && countDownTimer.isValid){
            countDownTimer.invalidate()
            countDownTimer = nil
        }
    }
    
    public lazy var backBtn:UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.setImage(UIImage(named: "nav_back.png"), for: .normal)
        btn.addTarget(self, action: #selector(backBtnClicked), for: .touchUpInside)
        return btn
    }()
    
    public lazy var titleLabel:UILabel = {
        let label = UILabel.init();
        label.text = "手机号注册/登录";
        label.textColor = CbsHexColor("#333333");
        label.font = CbsBoldFont(24);
        label.textAlignment = NSTextAlignment.center;
        return label;
    }()
    
    public lazy var phoneTextFiled:UITextField = {
        let textField = UITextField.init();
        textField.placeholder = "请输入手机号";
        textField.font = CbsFont(15);
        textField.keyboardType = .numberPad;
        textField.borderStyle = .none;
        textField.delegate = self;
        textField.layer.masksToBounds = true;
        textField.layer.cornerRadius = 20.0;
        textField.layer.borderWidth = 0.5;
        textField.layer.borderColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1).cgColor;
        
        let leftImageView = UIImage(named: "textFiled_phone")?.stretchableImage(withLeftCapWidth: 5, topCapHeight: 5);
        textField.background = leftImageView;
        let leftView = UIView.init();
        leftView.Cbs_width = 20;
        textField.leftViewMode = UITextField.ViewMode.always;
        textField.leftView = leftView;
       
        let attributes: [NSAttributedString.Key: Any] = [
            .font : CbsFont(14),
            .foregroundColor : UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        ]
        
        let attributedStr = NSMutableAttributedString(string: textField.placeholder!, attributes: attributes)
        textField.attributedPlaceholder = attributedStr;
        return textField;
    }()
    
    public lazy var msgTextFiled:UITextField = {
        let textField = UITextField.init();
        textField.placeholder = "请输入验证码";
        textField.font = CbsFont(15);
        textField.keyboardType = .numberPad;
        textField.borderStyle = .none;
        textField.delegate = self;
        textField.layer.masksToBounds = true;
        textField.layer.cornerRadius = 20.0;
        textField.layer.borderWidth = 0.5;
        textField.layer.borderColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1).cgColor;
        
        let leftImageView = UIImage(named: "textFiled_phone")?.stretchableImage(withLeftCapWidth: 5, topCapHeight: 5);
        textField.background = leftImageView;
        let leftView = UIView.init();
        leftView.Cbs_width = 20;
        textField.leftViewMode = UITextField.ViewMode.always;
        textField.leftView = leftView;
       
        let attributes: [NSAttributedString.Key: Any] = [
            .font : CbsFont(14),
            .foregroundColor : UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        ]
        
        let attributedStr = NSMutableAttributedString(string: textField.placeholder!, attributes: attributes)
        textField.attributedPlaceholder = attributedStr;
        return textField;
    }()
    
    public lazy var getMsgCodeBtn:UIButton = {
        let btn = UIButton.init(type: .custom);
        btn.setTitle("获取验证码", for: .normal)
        btn.setTitleColor(UIColor(red: 0.84, green: 0.26, blue: 0.23, alpha: 0.2), for: .normal)
        btn.titleLabel?.font = CbsFont(13)
        btn.isEnabled = false
        btn.addTarget(self, action: #selector(getMsgCodeBtnClick), for: .touchUpInside)
        return btn;
    }()
    
    public lazy var operationBtn:UIButton = {
        let btn = UIButton.init(type: .custom);
        btn.setTitle("手机号一键注册/登录", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = CbsFont(14)
        btn.isEnabled = false
        btn.backgroundColor = CbsHexColor("#E6E6E6")
        btn.addTarget(self, action: #selector(loginEnterClick), for: .touchUpInside)
        return btn;
    }()
    
    public lazy var touristsBtn:UIButton = {
        let btn = UIButton.init(type: .custom);
        btn.setTitle("游客登录", for: .normal)
        btn.setTitleColor(CbsHexColor("#999999"), for: .normal)
        btn.titleLabel?.font = CbsFont(12)
        btn.addTarget(self, action: #selector(touristsClick), for: .touchUpInside)
        return btn;
    }()
    
    public lazy var intoRegisterBtn:UIButton = {
        let btn = UIButton.init(type: .custom);
        btn.setTitle("收不到验证码？", for: .normal)
        btn.setTitleColor(CbsHexColor("#999999"), for: .normal)
        btn.titleLabel?.font = CbsFont(12)
        btn.titleLabel?.textAlignment = .right
        btn.addTarget(self, action: #selector(intoRegisterVCClick), for: .touchUpInside)
        return btn;
    }()
    
    
    func setUI() {
        self.view.addSubview(backBtn)
        backBtn.snp.makeConstraints { make in
            make.left.equalTo(15)
            make.top.equalTo(kTopSafeHeight)
            make.width.height.equalTo(44)
        }
        
        self.view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.right.equalTo(0)
            make.top.equalTo(backBtn.snp_bottom).offset(20)
        }
        
        self.view.addSubview(phoneTextFiled)
        phoneTextFiled.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp_bottom).offset(32)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(40)
        }
        
        self.view.addSubview(msgTextFiled)
        msgTextFiled.snp.makeConstraints { make in
            make.top.equalTo(phoneTextFiled.snp_bottom).offset(20)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(40)
        }
        
        self.view.addSubview(getMsgCodeBtn)
        getMsgCodeBtn.snp.makeConstraints { make in
            make.right.equalTo(-15)
            make.width.equalTo(90)
            make.height.equalTo(40)
            make.centerY.equalTo(msgTextFiled.snp_centerY)
        }
        
        self.view.addSubview(operationBtn)
        operationBtn.snp.makeConstraints { make in
            make.top.equalTo(msgTextFiled.snp_bottom).offset(20);
            make.right.equalTo(-15)
            make.left.equalTo(15)
            make.height.equalTo(40)
        }
        operationBtn.layer.cornerRadius = 20;
        
        self.view.addSubview(touristsBtn)
        touristsBtn.snp.makeConstraints { make in
            make.left.equalTo(27)
            make.height.equalTo(40)
            make.top.equalTo(operationBtn.snp_bottom).offset(5)
        }
        
        self.view.addSubview(intoRegisterBtn)
        intoRegisterBtn.snp.makeConstraints { make in
            make.right.equalTo(-15)
            make.height.equalTo(40)
            make.top.equalTo(operationBtn.snp_bottom).offset(5)
        }
    }
    
    
    func initNav() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @objc func backBtnClicked() {
        self .dismiss(animated: true)
    }
    
    @objc func textFieldTextDidChangeOneCI(obj:Notification){
        let textField = obj.object as! UITextField
        if(textField == self.phoneTextFiled){
            let oldPhoneString = phoneTextFiled.text;
            let changePhoneString = oldPhoneString!.replacingOccurrences(of: " ", with: "");
            phoneTextFiled.text = changePhoneString;
            
            if(!changePhoneString.checkMobile(mobileNumbel: changePhoneString as NSString)){
                getMsgCodeBtn.setTitleColor(UIColor(red: 0.84, green: 0.26, blue: 0.23, alpha: 0.2), for: .normal)
                getMsgCodeBtn.isEnabled = false
            }else{
                getMsgCodeBtn.setTitleColor(UIColor(red: 0.84, green: 0.26, blue: 0.23, alpha: 1.0), for: .normal)
                getMsgCodeBtn.isEnabled = true
            }
        }else{
            if(textField.text!.count >= 6 && phoneTextFiled.text!.count == 11){
                operationBtn.isEnabled = true
                operationBtn.backgroundColor = CbsHexColor("#d6423a")
            }else{
                operationBtn.isEnabled = false
                operationBtn.backgroundColor = CbsHexColor("#E6E6E6")
            }
        }
    }
    
    @objc func getMsgCodeBtnClick() {
        let oldPhoneString = phoneTextFiled.text;
        let changePhoneString = oldPhoneString!.replacingOccurrences(of: " ", with: "");
        phoneTextFiled.text = changePhoneString;
        
        if(!changePhoneString.checkMobile(mobileNumbel: changePhoneString as NSString)){
            HUD.flash(.label("手机号无效"),delay: 2.0)
            return;
        }
        getMsgCodeBtn.isEnabled = false;
        // 网络请求
        let param = ["phone_number":changePhoneString, "category":"signin_or_signup"]
        HttpTool.request(API.getCode(params: param)) { json in
            let res = JSON(json)
            let isSuccess = res["success"].boolValue
            if (isSuccess){
                HUD.flash(.label("发送成功"), delay: 0.8)
            }else{
                HUD.flash(.label("发送失败"), delay: 0.8)
            }
        } failure: { code, msg in
            HUD.flash(.label("发送失败"), delay: 0.8)
        }
        startTimer()
    }

    @objc func loginEnterClick() {
        let phoneString = phoneTextFiled.text;
        if(!phoneString!.checkMobile(mobileNumbel: phoneString! as NSString)){
            HUD.flash(.label("手机号无效"),delay: 2.0)
            return;
        }
        let codeString = msgTextFiled.text;
        if(codeString!.count <= 0){
            return;
        }
        operationBtn.isEnabled = false;
        HUD.show(.label("登录中"))
        let param = ["phone_number":phoneString, "otp":codeString];
        
        HttpTool.request(API.login(params: param as Dictionary<String, Any>)) {[weak self] json in
            let res = JSON(json)
            self!.operationBtn.isEnabled = true;
            HUD.show(.label("登录成功"))
            HUD.hide(animated: true);
            //缓存用户信息
            
            CbsLog("1")
        } failure: { code, msg in
            HUD.hide(animated: true);
            HUD.flash(.label("登录失败"), delay: 0.8)
            self.operationBtn.isEnabled = true;
        }
    }
    
    @objc func touristsClick() {
        // 游客登录
        HUD.flash(.label("登录中"))
    }
    
    @objc func intoRegisterVCClick() {
        UIApplication.shared.open(URL(string: "http://www.baidu.com")!)
    }
    
    @objc func startTimer() {
        if((countDownTimer) != nil){
            countDownTimer.invalidate()
            countDownTimer = nil;
        }
        countDownTimer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(timerFired), userInfo: nil, repeats: true)
        RunLoop.current.add(countDownTimer, forMode: .common)
    }
    
    @objc func timerFired(){
        countDownSeconds -= 1;
        if(countDownSeconds == 0){
            countDownTimer.invalidate()
            countDownTimer = nil;
            
            getMsgCodeBtn.isEnabled = true;
            getMsgCodeBtn.setTitle("点击获取", for: .normal)
            getMsgCodeBtn.setTitleColor(UIColor(red: 0.84, green: 0.26, blue: 0.23, alpha: 1), for: .normal);
            countDownSeconds = 60;
        }else{
            getMsgCodeBtn.setTitle("点击获取", for: .normal)
            getMsgCodeBtn.setTitleColor(UIColor.gray, for: .normal);
            let waitString = String(format: "重新发送(%ld)", countDownSeconds);
            getMsgCodeBtn.setTitle(waitString, for: .normal)
        }
    }
}

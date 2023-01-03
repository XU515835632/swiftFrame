//
//  APIManager.swift
//  swiftArchitecture
//
//  Created by apple on 2022/12/26.
//

import Foundation
import Moya
import SwiftyUserDefaults

let kBaseURL = Defaults[\.api_domain]

enum  API {
    //登录
    case getCode(params:Dictionary<String,Any>)
    case login(params:Dictionary<String,Any>)
}

// MARK: - 补全【MoyaConfig 3：配置TargetType协议可以一次性处理的参数】中没有处理的参数
extension API: TargetType {
    
    //0. 基础域名，整个项目只用一个，可以写在MoyaConfig中
    var baseURL: URL {
        switch self {
        case .login,
             .getCode:
            return URL(string:kBaseURL!)!
        default:
            return URL(string:kBaseURL!)!
        }
    }
    
    //1. 每个接口的相对路径
    //请求时的绝对路径是   baseURL + path
    var path: String {
        switch self {
        case .getCode:
            return "/verification_codes"
        case .login:
            return "/auth/signin_or_signup"
        }
    }
    
    //2. 每个接口要使用的请求方式
    var method: Moya.Method {
        switch self {
//        case
//            return .get
        case .login,
             .getCode:
            return .post
        }
    }
    
    //3. Task是一个枚举值，根据后台需要的数据，选择不同的http task。
    var task: Task {
        let params: [String: Any] = [:]
        switch self {
        case .login(let bodyParameters):
            return .requestParameters(parameters: bodyParameters, encoding: JSONEncoding.default)
        case .getCode(let bodyParameters):
            return .requestParameters(parameters: bodyParameters, encoding: JSONEncoding.default)
        default:
            //不需要传参数的接口走这里
            return .requestPlain
        }
        return .requestParameters(parameters: params, encoding: URLEncoding.default)
    }
    
}

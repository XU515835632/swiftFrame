//
//  DefaultManager.swift
//  swiftArchitecture
//
//  Created by apple on 2022/12/29.
//

import Foundation
import SwiftyUserDefaults

extension DefaultsKeys {
    var api_domain: DefaultsKey<String?> {.init("api_domain")}
    var web_domain: DefaultsKey<String?> {.init("web_domain")}
    var h5_domain: DefaultsKey<String?> {.init("h5_domain")}
}

//
//  UserDefaultsHelper.swift
//  FootballAppSwiftUI
//
//  Created by piotr koscielny on 12/5/25.
//

import Foundation

struct UserDefaultsHelper {
    static let userKey = "UserKeyForFirstLaunch"
    
    var isFirstLaunch: Bool {
        get { UserDefaults.standard.object(forKey: Self.userKey) == nil }
        set { UserDefaults.standard.set(newValue, forKey: Self.userKey) }
    }
}

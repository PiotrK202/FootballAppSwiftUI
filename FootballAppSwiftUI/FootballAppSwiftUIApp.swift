//
//  FootballAppSwiftUIApp.swift
//  FootballAppSwiftUI
//
//  Created by piotr koscielny on 12/5/25.
//

import SwiftUI

@main
struct FootballAppSwiftUIApp: App {
    private let userDefaults = UserDefaultsHelper()
    var body: some Scene {
        WindowGroup {
            if userDefaults.isFirstLaunch {
                WelcomeView()
            } else {
                LeaguesListView()
            }
        }
    }
}

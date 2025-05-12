//
//  FootballAppSwiftUIApp.swift
//  FootballAppSwiftUI
//
//  Created by piotr koscielny on 12/5/25.
//

import SwiftUI

@main
struct FootballAppSwiftUIApp: App {

    @AppStorage(AppStorageKeysHelper.firstLaunch) private var firstLaunch = false
    
    var body: some Scene {
        WindowGroup {
            if firstLaunch {
                LeaguesListView()
            } else {
                WelcomeView()
            }
        }
    }
}

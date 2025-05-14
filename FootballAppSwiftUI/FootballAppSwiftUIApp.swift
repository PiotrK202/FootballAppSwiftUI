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
    
    init() {
        if CommandLine.arguments.contains("--uitest") {
            UserDefaults.standard.set(false, forKey: AppStorageKeysHelper.firstLaunch)
        }
    }
    
    var body: some Scene {
        WindowGroup {
            if firstLaunch {
                LeaguesListView(viewModel: LeaguesViewModel(repository: Repository(dataService: DataService(session: URLSessionHelper.session))))
            } else {
                WelcomeView()
            }
        }
    }
}

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
    let session = URLSession(configuration: .default)
    
    var body: some Scene {
        WindowGroup {
            if firstLaunch {
                LeaguesListView(viewModel: LeaguesViewModel(repository: Repository(dataService: DataService(session: session))))
            } else {
                WelcomeView()
            }
        }
    }
}

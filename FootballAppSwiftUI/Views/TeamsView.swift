//
//  TeamsView.swift
//  FootballAppSwiftUI
//
//  Created by piotr koscielny on 12/5/25.
//

import SwiftUI

struct TeamsView: View {
    
    let viewModel: TeamsViewModel
    let leaguesCode: String
    
    var body: some View {
        NavigationStack {
            Text("hello")
        }
    }
}

#Preview {
    let code = ""
    TeamsView(viewModel: TeamsViewModel(repository: Repository(dataService: DataService(session: URLSessionHelper.session))), leaguesCode: code)
}

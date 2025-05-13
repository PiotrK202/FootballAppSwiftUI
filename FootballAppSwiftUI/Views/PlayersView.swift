//
//  PlayersView.swift
//  FootballAppSwiftUI
//
//  Created by piotr koscielny on 12/5/25.
//

import SwiftUI

struct PlayersView: View {
    
    @State private var showAlert = false
    let teamID: Int
    let viewModel: PlayersViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.groupedPlayers.keys.sorted(),id: \.self) { position in
                    Section(header: Text(position)) {
                        ForEach(viewModel.groupedPlayers[position] ?? []) { player in
                            NavigationLink(destination: PlayersDetailView(viewModel: PlayersDetailViewModel(repository: Repository(dataService: DataService(session: URLSessionHelper.session))), playerID: player.id)) {
                                VStack(alignment: .leading, spacing: 8) {
                                    HStack {
                                        Text(player.name)
                                            .font(.headline)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle(viewModel.viewTitle)
            .navigationBarTitleDisplayMode(.inline)
            .alert(isPresented: $showAlert) {
                Alert(title: Text(viewModel.alertTitle), primaryButton: .default(Text(viewModel.buttonAlertTitle), action: fetchPlayers), secondaryButton: .cancel())
            }
            .onAppear {
                fetchPlayers()
            }
        }
    }
}

extension PlayersView {
    
    private func fetchPlayers() {
        Task {
            do {
                try await viewModel.fetchPlayers(teamId: teamID)
            } catch {
                showAlert = true
            }
        }
    }
}

#Preview {
    let teamID = 1
    PlayersView(teamID: teamID, viewModel: PlayersViewModel(repository: Repository(dataService: DataService(session: URLSessionHelper.session))))
}

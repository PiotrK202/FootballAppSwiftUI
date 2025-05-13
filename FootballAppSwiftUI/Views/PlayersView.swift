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
    
    private var groupedPlayers: [String: [PlayerModel]] {
        Dictionary(grouping: viewModel.models) { player in
            player.position ?? "Unknown"
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(groupedPlayers.keys.sorted(),id: \.self) { position in
                    Section(header: Text(position)) {
                        ForEach(groupedPlayers[position] ?? []) { player in
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

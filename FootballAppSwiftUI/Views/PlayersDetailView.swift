//
//  PlayersDetailView.swift
//  FootballAppSwiftUI
//
//  Created by piotr koscielny on 12/5/25.
//

import SwiftUI

struct PlayersDetailView: View {
    
    @State private var showAlert = false
    let viewModel: PlayersDetailViewModel
    let playerID: Int
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.blue)
                    .padding(.top, 40)
                
                Text(viewModel.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading, spacing: 12) {
                    
                    Text("\(viewModel.dateOfBirth)")
                    
                    Text("\(viewModel.nationality)")
                    
                    Text("\(viewModel.position)")
                    
                    Text("\(viewModel.shirtNumber)")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .padding(.horizontal)
                
                Spacer()
            }
            .navigationTitle(viewModel.viewTitle)
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                fetchPlayer()
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text(viewModel.errorTitle), dismissButton: .cancel())
            }
        }
    }
}

extension PlayersDetailView {
    
    private func fetchPlayer() {
        Task {
            do {
                try await viewModel.fetchPlayers(playerId: playerID)
            } catch {
                showAlert = true
            }
        }
    }
}

//
//  TeamsView.swift
//  FootballAppSwiftUI
//
//  Created by piotr koscielny on 12/5/25.
//

import SwiftUI

struct TeamsView: View {
    
    @State private var showAlert = false
    let leaguesCode: String
    let viewModel: TeamsViewModel
    
    private let columns = [ GridItem(.flexible()), GridItem(.flexible())]
    private let unknown = "unknown"
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 8) {
                    ForEach(viewModel.models) { team in
                        NavigationLink {
                            PlayersView(teamID: team.id, viewModel: PlayersViewModel(repository: Repository(dataService: DataService(session: URLSessionHelper.session))))
                        } label: {
                            VStack(spacing: 8) {
                                Text(team.shortName ?? unknown)
                                    .font(.headline)
                                    .multilineTextAlignment(.center)
                                
                                AsyncImage(url: team.crest) { phase in
                                    switch phase {
                                    case .empty:
                                        ProgressView()
                                            .frame(width: 60, height: 60)
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 60, height: 60)
                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                    case .failure:
                                        Image(systemName: "photo")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 60, height: 60)
                                            .foregroundColor(.gray)
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                                
                                Text(team.name)
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                                    .multilineTextAlignment(.center)
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 140)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(Color(.systemGray6))
                                    )
                            )
                            .shadow(color: Color.black.opacity(0.6), radius: 4, x: 0, y: 2)
                        }
                    }
                    .padding()
                }
            }
            .onAppear(perform: {
                fetchTeams()
            })
            
            .alert(isPresented:$showAlert) {
                Alert(title: Text(viewModel.alertTitle), primaryButton: .default(Text(viewModel.alertButtonTitle), action: fetchTeams), secondaryButton: .cancel())
            }
        }
    }
}

extension TeamsView {
    
    private func fetchTeams() {
        Task {
            do {
                try await viewModel.fetchTeams(leagueCode: leaguesCode)
            } catch {
                showAlert = true
            }
        }
    }
}

#Preview {
    let code = ""
    TeamsView(leaguesCode: code, viewModel: TeamsViewModel(repository: Repository(dataService: DataService(session: URLSessionHelper.session))))
}


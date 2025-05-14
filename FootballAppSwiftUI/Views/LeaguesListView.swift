//
//  LeaguesListView.swift
//  FootballAppSwiftUI
//
//  Created by piotr koscielny on 12/5/25.
//

import SwiftUI

struct LeaguesListView: View {
    
    @State private var showAlert = false
    let viewModel: LeaguesViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.sortedSectionTitles, id: \.self) { letter in
                    Section(header: Text(letter)) {
                        ForEach(viewModel.groupedLeagues[letter] ?? []) { model in
                            NavigationLink(destination: TeamsView(viewModel: TeamsViewModel(repository: Repository(dataService: DataService(session: URLSessionHelper.session))), leaguesCode: model.code)) {
                                HStack(spacing: 16) {
                                    
                                    AsyncImage(url: model.emblem) { phase in
                                        switch phase {
                                        case .empty:
                                            ProgressView()
                                                .frame(width: 50, height: 50)
                                        case .success(let image):
                                            image
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 50, height: 50)
                                                .presentationCornerRadius(6)
                                        case .failure:
                                            Image(systemName: "photo")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 50, height: 50)
                                                .foregroundColor(.gray)
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }
                                    
                                    Text(model.name)
                                        .font(.headline)
                                        .foregroundStyle(.primary)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle(viewModel.viewTitle)
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                fetchLeagues()
            }
        }
        .alert(isPresented:$showAlert) {
            Alert(title: Text(viewModel.alertTitle),message: Text(viewModel.alertMessage) ,primaryButton: .default(Text(viewModel.alertButtonTitle), action: fetchLeagues), secondaryButton: .cancel())
        }
    }
}

extension LeaguesListView {
    
    private func fetchLeagues() {
        Task {
            do {
                try await viewModel.fetchLeagues()
            } catch {
                showAlert = true
            }
        }
    }
}

#Preview {
    let session = URLSession(configuration: .default)
    LeaguesListView(viewModel: LeaguesViewModel(repository: Repository(dataService: DataService(session: session))))
}

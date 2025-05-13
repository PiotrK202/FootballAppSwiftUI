//
//  PlayersViewModel.swift
//  FootballAppSwiftUI
//
//  Created by piotr koscielny on 12/5/25.
//

import Foundation

@Observable
final class PlayersViewModel {
    private let repository: RepositoryProtocol
    private(set) var models = [PlayerModel]()
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
    }
    
    var alertTitle: String {
        NSLocalizedString("PlayersViewModel_AlertTitle", comment: "title")
    }
    
    var buttonAlertTitle: String {
        NSLocalizedString("LeaguesView_AlertButtonTitle", comment: "button title")
    }
    
    func fetchPlayers(teamId: Int) async throws {
        do {
            models = try await repository.fetchPlayers(in: teamId)
        } catch {
            throw error
        }
    }
}

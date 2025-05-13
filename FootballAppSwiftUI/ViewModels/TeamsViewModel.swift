//
//  TeamsViewModel.swift
//  FootballAppSwiftUI
//
//  Created by piotr koscielny on 12/5/25.
//

import Foundation

@Observable
final class TeamsViewModel {
    
    private let repository: RepositoryProtocol
    private(set) var models = [TeamModel]()
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchTeams(leagueCode: String) async throws {
        do {
            models = try await repository.fetchTeams(in: leagueCode)
        } catch {
            throw error
        }
    }
    
}

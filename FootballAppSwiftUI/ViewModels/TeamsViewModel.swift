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
    
    var viewTitle: String {
        NSLocalizedString("TeamsView_ViewTitle", comment: "title")
    }
    
    var alertButtonTitle: String {
        NSLocalizedString("LeaguesView_AlertButtonTitle" , comment: "primary button")
    }
    
    var alertTitle: String {
        NSLocalizedString("TeamsView_AlertTitle", comment: "title")
    }
    
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

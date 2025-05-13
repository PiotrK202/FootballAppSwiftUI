//
//  LeaguesViewModel.swift
//  FootballAppSwiftUI
//
//  Created by piotr koscielny on 12/5/25.
//

import Foundation

@Observable
final class LeaguesViewModel {
    private let repository: RepositoryProtocol
    private var models = [LeaguesModel]()
    
    var groupedLeagues: [String: [LeaguesModel]] {
        let gruped = Dictionary(grouping: models) { league in
            String(league.name.prefix(1)).uppercased()
        }
        return gruped.mapValues { $0.sorted { $0.name < $1.name }}
    }
    
    var sortedSectionTitles: [String] {
        groupedLeagues.keys.sorted()
    }
    
    var viewTitle: String {
        NSLocalizedString("LeaguesView_Title", comment: "view title")
    }
    
    var alertMessage: String {
        NSLocalizedString("LeaguesView_AlertMessage", comment: "alert message")
    }
    
    var alertTitle: String {
        NSLocalizedString("LeaguesView_AlertTitle", comment: "alert")
    }
    
    var alertButtonTitle: String {
        NSLocalizedString("LeaguesView_AlertButtonTitle" , comment: "primary button")
    }
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchLeagues() async throws {
        do {
            models = try await repository.fetchLeagues()
        } catch {
            throw error
        }
    }
}

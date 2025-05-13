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
    private(set) var models = [LeaguesModel]()
    
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

//
//  PlayersDetailViewModel.swift
//  FootballAppSwiftUI
//
//  Created by piotr koscielny on 12/5/25.
//

import Foundation

@Observable
final class PlayersDetailViewModel {
    private let repository: RepositoryProtocol
    private let unknownValue = NSLocalizedString("Unknown", comment: "unknown value")
    private var model: PlayerDetailModel?
        
    init(repository: RepositoryProtocol) {
        self.repository = repository
    }
    
    var viewTitle: String {
        NSLocalizedString("PlayersDetailView_Title", comment: "title")
    }
    
    var name: String {
        model?.name ?? unknownValue
    }
    
    var position: String {
        model?.position ?? unknownValue
    }
    
    var dateOfBirth: String {
        model?.dateOfBirth ?? unknownValue
    }
    
    var nationality: String {
        model?.nationality ?? unknownValue
    }
    
    var shirtNumber: String {
          guard let number = model?.shirtNumber else { return unknownValue }
          return "\(number)"
      }
    
    func fetchPlayers(playerId: Int) async throws {
        do {
            model = try await repository.fetchPlayerDetails(playerId: playerId)
        } catch {
            throw error
        }
    }
}

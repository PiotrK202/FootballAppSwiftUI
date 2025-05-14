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
    
    var errorTitle: String {
        NSLocalizedString("PlayerDetailView_ErrorTitle", comment: "error title")
    }
    
    var name: String {
        model?.name ?? unknownValue
    }
    
    var position: String {
       "\(positionText): \(model?.position ?? unknownValue)"
    }
    
    var dateOfBirth: String {
        "\(dateOfBirthTexst): \(model?.dateOfBirth ?? unknownValue)"
    }
    
    var nationality: String {
        "\(nationalityText): \(model?.nationality ?? unknownValue)"
    }
    
    var shirtNumber: String {
        guard let number = model?.shirtNumber else { return unknownValue }
        return "\(shirtNumberText): \(number)"
    }
    
    private var shirtNumberText: String {
        NSLocalizedString("PlayersDetailView_ShirtNumber", comment: "before shirt number")
    }
    
    private var dateOfBirthTexst: String {
        NSLocalizedString("PlayersDetailView_BirthDay", comment: "before date of birth")
    }
    
    private var nationalityText: String {
        NSLocalizedString("PlayersDetailView_Nationality", comment: "before nationality")
    }
    
    private var positionText: String {
        NSLocalizedString("PlayersDetailView_Position", comment: "before position")
    }
    
    func fetchPlayers(playerId: Int) async throws {
        do {
            model = try await repository.fetchPlayerDetails(playerId: playerId)
        } catch {
            throw error
        }
    }
}

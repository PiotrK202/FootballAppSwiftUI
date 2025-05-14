//
//  RepositoryMock.swift
//  FootballAppSwiftUITests
//
//  Created by piotr koscielny on 14/5/25.
//

import Foundation
@testable import FootballAppSwiftUI

enum MockErrors: Error {
    case networkError
}

struct RepositoryMock: RepositoryProtocol {
    
    var error = false
    
    func fetchLeagues() async throws -> [LeaguesModel] {
        guard !error else {
            throw MockErrors.networkError
        }
        let area = AreaModel(id: 1, name: "area1", code: "code1", flag: nil)
        let leagueModel = [LeaguesModel(id: 1, name: "poland", code: "code1", type: "football", area: area, emblem: nil)]
        return leagueModel
    }
    
    func fetchTeams(in leagueCode: String) async throws -> [TeamModel] {
        guard !error else {
            throw MockErrors.networkError
        }
        let team = [TeamModel(id: 1, name: "team1", shortName: "tea", tla: "tla", crest: nil)]
        return team
    }
    
    func fetchPlayers(in teamId: Int) async throws -> [PlayerModel] {
        guard !error else {
            throw MockErrors.networkError
        }
        let player = [PlayerModel(id: 1, name: "player1", position: "position1", dateOfBirth: nil, nationality: "poland", shirtNumber: nil)]
        return player
    }
    
    func fetchPlayerDetails(playerId: Int) async throws -> PlayerDetailModel {
        guard !error else {
            throw MockErrors.networkError
        }
        let playerDetail = PlayerDetailModel(id: 1, name: "name1", firstName: "asa", lastName: "dsa", dateOfBirth: "1", nationality: "poland",position: "gk", shirtNumber: 1, lastUpdated: nil)
        return playerDetail
    }
}

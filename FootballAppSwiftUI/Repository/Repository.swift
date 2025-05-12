//
//  Repository.swift
//  FootballAppSwiftUI
//
//  Created by piotr koscielny on 12/5/25.
//

import Foundation

protocol RepositoryProtocol {
    func fetchLeagues() async throws -> [LeaguesModel]
    func fetchTeams(in leagueCode: String) async throws -> [TeamModel]
    func fetchPlayers(in teamId: Int) async throws -> [PlayerModel]
    func fetchPlayerDetails(playerId: Int) async throws -> PlayerDetailModel
}

final class Repository: RepositoryProtocol {
    let dataService: DataServiceProtocol
    
    init(dataService: DataServiceProtocol) {
        self.dataService = dataService
    }
    
    func fetchLeagues() async throws -> [LeaguesModel] {
        let response: LeaguesResponse = try await dataService.fetchData(endpoint: .leagues)
        return response.competitions
    }
    
    func fetchTeams(in leagueCode: String) async throws -> [TeamModel] {
        let response: TeamsResponse = try await dataService.fetchData(endpoint: .teamsInLeague(leagueCode))
        return response.teams
    }
    
    func fetchPlayers(in teamId: Int) async throws -> [PlayerModel] {
        let response: TeamDetail = try await dataService.fetchData(endpoint: .playersInTeam(teamId))
        return response.squad
    }
    
    func fetchPlayerDetails(playerId: Int) async throws -> PlayerDetailModel {
        try await dataService.fetchData(endpoint: .playerDetails(playerId))
    }
}

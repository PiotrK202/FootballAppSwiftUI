//
//  PlayersViewModelTests.swift
//  UnitTests
//
//  Created by piotr koscielny on 14/5/25.
//

import Testing
@testable import FootballAppSwiftUI

struct PlayersViewModelTests {
    
    @Test func fetchPlayersWithExpectetionToReturnPlayer() async throws {
        let repository = RepositoryMock()
        let viewModel = PlayersViewModel(repository: repository)
        try await viewModel.fetchPlayers(teamId: 1)
        let player = viewModel.groupedPlayers.first!
        #expect(player.value.first!.name == "player1")
    }
    
    @Test func fetchLeaguesWithExpectetionToReturnError() async throws {
        var repository = RepositoryMock()
        repository.error = true
        let viewModel = PlayersViewModel(repository: repository)
        await #expect(throws: Error.self) {
            _ = try await viewModel.fetchPlayers(teamId: 1)
        }
    }
}

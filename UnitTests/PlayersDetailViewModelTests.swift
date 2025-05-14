//
//  PlayersDetailViewModelTests.swift
//  UnitTests
//
//  Created by piotr koscielny on 14/5/25.
//

import Testing
@testable import FootballAppSwiftUI
struct PlayersDetailViewModelTests {
    
    @Test func fetchPlayerDetailsWithExpectetionToReturnDetail() async throws {
        let repository = RepositoryMock()
        let viewModel = PlayersDetailViewModel(repository: repository)
        try await viewModel.fetchPlayers(playerId: 1)
        #expect(viewModel.name == "name1")
    }
    
    @Test func fetchPlayerDetailsWithExpectetionToFail() async throws {
        var repository = RepositoryMock()
        repository.error = true
        let viewModel = PlayersDetailViewModel(repository: repository)
        await #expect(throws: Error.self) {
            _ = try await viewModel.fetchPlayers(playerId: 1)
        }
    }
}

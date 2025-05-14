//
//  TeamsViewModelTests.swift
//  UnitTests
//
//  Created by piotr koscielny on 14/5/25.
//

import Testing
@testable import FootballAppSwiftUI

struct TeamsViewModelTests {

    @Test func fetchTeamssWithExpectetionToReturnTeams() async throws {
        let repository = RepositoryMock()
        let viewModel = TeamsViewModel(repository: repository)
        try await viewModel.fetchTeams(leagueCode: "wq")
        let player = viewModel.filtredTeams
        #expect(player.contains(where: { $0.id == 1 }))
    }
    
    @Test func fetchTeamsWithExpectetionToReturnError() async throws {
        var repository = RepositoryMock()
        repository.error = true
        let viewModel = TeamsViewModel(repository: repository)
        await #expect(throws: Error.self) {
            _ = try await viewModel.fetchTeams(leagueCode: "asd")
        }
    }
}

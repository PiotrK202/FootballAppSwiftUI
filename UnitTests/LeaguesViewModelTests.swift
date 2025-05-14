//
//  LeaguesViewModelTests.swift
//  UnitTests
//
//  Created by piotr koscielny on 14/5/25.
//

import Testing
@testable import FootballAppSwiftUI

struct LeaguesViewModelTests {
    @Test func fetchLeaguesWithExpectetionToReturnLeague() async throws {
        let repository = RepositoryMock()
        let viewModel = LeaguesViewModel(repository: repository)
        try await viewModel.fetchLeagues()
        let league = viewModel.groupedLeagues.first!
        #expect(league.value.first!.name == "poland")
    }
    
    @Test func fetchLeaguesWithExpectetionToReturnError() async throws {
        var repository = RepositoryMock()
        repository.error = true
        let viewModel = LeaguesViewModel(repository: repository)
        await #expect(throws: Error.self, performing: viewModel.fetchLeagues)
    }
}

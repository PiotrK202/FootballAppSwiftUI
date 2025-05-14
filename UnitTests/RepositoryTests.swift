//
//  RepositoryTests.swift
//  UnitTests
//
//  Created by piotr koscielny on 14/5/25.
//

import Testing
@testable import FootballAppSwiftUI

struct RepositoryMockTests {
    
    let repository = RepositoryMock()

    @Test func testFetchLeagues() async throws {
        let result = try await repository.fetchLeagues()
        #expect(result.count == 1)
        #expect(result[0].name == "poland")
        #expect(result[0].area.name == "area1")
    }
    
    @Test func testFetchTeams() async throws {
        let result = try await repository.fetchTeams(in: "Pl")
        #expect(result.count == 1)
        #expect(result[0].name == "team1")
    }
    
    @Test func testFetchPlayers() async throws {
        let result = try await repository.fetchPlayers(in: 1)
        #expect(result.count == 1)
        #expect(result[0].name == "player1")
        #expect(result[0].nationality == "poland")
    }
    
    @Test func fetchPlayerDetails() async throws {
        let result = try await repository.fetchPlayerDetails(playerId: 1)
        #expect(result.name == "name1")
        #expect(result.position == "gk")
        #expect(result.shirtNumber == 1)
    }
}

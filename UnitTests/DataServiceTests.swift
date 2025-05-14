//
//  DataServiceTests.swift
//  UnitTests
//
//  Created by piotr koscielny on 14/5/25.
//

import Foundation
import Testing
@testable import FootballAppSwiftUI


struct DataServiceMockTests {
    
    struct TestModel: Codable, Equatable {
        let name: String
        let age: Int
    }
    
    private func makeSession(data: Data, statusCode: Int) -> URLSession {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLSessionMock.self]
        URLSessionMock.requestHandler = { request in
            let response = HTTPURLResponse(url: request.url!,statusCode: statusCode,httpVersion: nil,headerFields: nil)!
            return (response, data)
        }
        return URLSession(configuration: config)
    }
    
    @Test func testFetchDataSuccess() async throws {
        let expected = TestModel(name: "name", age: 20)
        let jsonData = try JSONEncoder().encode(expected)
        let session = makeSession(data: jsonData, statusCode: 200)
        let dataService = DataService(session: session)
        let result: TestModel = try await dataService.fetchData(endpoint: .leagues)
        #expect(result == expected)
    }
    
    @Test func testFetchDataFailure() async throws {
        let session = makeSession(data: Data(), statusCode: 404)
        let dataService = DataService(session: session)
        
        do {
            let _: TestModel = try await dataService.fetchData(endpoint: .leagues)
        } catch let error as URLError {
            #expect(error.code == .badServerResponse)
        }
    }
}

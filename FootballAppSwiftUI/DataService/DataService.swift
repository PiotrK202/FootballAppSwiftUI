//
//  DataService.swift
//  FootballAppSwiftUI
//
//  Created by piotr koscielny on 12/5/25.
//

import Foundation


protocol DataServiceProtocol {
    func fetchData<T:Decodable>(endpoint:Endpoint) async throws -> T
}

final class DataService: DataServiceProtocol {
    private let token = "f7465eb471ad4ed49ffa71469ea6dd06"
    private let baseUrl = "https://api.football-data.org/v4"
    private let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func fetchData<T>(endpoint: Endpoint) async throws -> T where T: Decodable {
        session.configuration.timeoutIntervalForRequest = 10
        
        guard let url = URL(string: baseUrl + endpoint.path) else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.setValue(token, forHTTPHeaderField: "X-Auth-Token")
        
        do {
            let (data,response) = try await session.data(for: request)
            try httpResponse(response: response)
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            throw error
        }
    }
    
    private func httpResponse(response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse,
              (200..<300).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
    }
}

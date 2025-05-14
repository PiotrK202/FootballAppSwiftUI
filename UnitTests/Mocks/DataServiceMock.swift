//
//  DataServiceMock.swift
//  FootballAppSwiftUITests
//
//  Created by piotr koscielny on 14/5/25.
//

import Foundation
@testable import FootballAppSwiftUI

struct DataServiceMock: DataServiceProtocol {
    private let data: Data
   
    init(data: Data) {
        self.data = data
    }
    func fetchData<T>(endpoint: Endpoint) async throws -> T where T: Decodable {
        return try JSONDecoder().decode(T.self, from: data)
    }
}

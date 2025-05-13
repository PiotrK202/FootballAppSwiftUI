//
//  LeaguesModel.swift
//  FootballAppSwiftUI
//
//  Created by piotr koscielny on 12/5/25.
//

import Foundation

struct LeaguesResponse: Codable {
    let count: Int
    let competitions: [LeaguesModel]
}

struct LeaguesModel: Codable, Identifiable {
    let id: Int
    let name: String
    let code: String
    let type: String?
    let area: AreaModel
    let emblem: URL?
}

struct AreaModel: Codable {
    let id: Int
    let name: String
    let code: String?
    let flag: URL?
}


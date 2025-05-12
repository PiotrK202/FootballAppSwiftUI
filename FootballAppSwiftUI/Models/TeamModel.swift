//
//  TeamModel.swift
//  FootballAppSwiftUI
//
//  Created by piotr koscielny on 12/5/25.
//

import Foundation

struct TeamsResponse: Codable {
    let count: Int
    let teams: [TeamModel]
}

struct TeamModel: Codable, Identifiable {
    let id: Int
    let name: String
    let shortName: String?
    let tla: String?
    let crest: URL?
}

struct TeamDetail: Codable {
    let id: Int
    let name: String
    let crest: URL?
    let venue: String?
    let squad: [PlayerModel]
}

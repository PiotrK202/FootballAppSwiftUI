//
//  PlayerModel.swift
//  FootballAppSwiftUI
//
//  Created by piotr koscielny on 12/5/25.
//

import Foundation

struct PlayerModel: Codable, Identifiable {
    let id: Int
    let name: String
    let position: String?
    let dateOfBirth: String?
    let nationality: String?
    let shirtNumber: Int?
}

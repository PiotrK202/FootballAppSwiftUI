//
//  PlayerDetailModel.swift
//  FootballAppSwiftUI
//
//  Created by piotr koscielny on 12/5/25.
//

import Foundation

struct PlayerDetailModel: Codable, Identifiable {
    let id: Int
    let name: String
    let firstName: String?
    let lastName: String?
    let dateOfBirth: String?
    let nationality: String?
    let position: String?
    let shirtNumber: Int?
    let lastUpdated: String?
}

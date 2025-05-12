//
//  NetworkLayer.swift
//  FootballAppSwiftUI
//
//  Created by piotr koscielny on 12/5/25.
//

import Foundation

enum Endpoint {
    case leagues
    case teamsInLeague(String)
    case playersInTeam(Int)
    case playerDetails(Int)
    
    var path: String {
        switch self {
        case .leagues:
            return "/competitions"
        case .teamsInLeague(let code):
            return "/competitions/\(code)/teams"
        case .playersInTeam(let teamId):
            return "/teams/\(teamId)"
        case .playerDetails(let personId):
            return "/persons/\(personId)"
        }
    }
}

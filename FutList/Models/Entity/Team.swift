//
//  Game.swift
//  FutList
//
//  Created by Mateus Nobre on 19/08/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//
// swiftlint:disable identifier_name

import Foundation

struct SearchTeamsResponse: Codable {
    var teams: [Team]
}

struct Team: Codable {
    var team_id: Int
    var name: String
    var logo: String
}

struct TeamResponse: Codable {
    var api: API
}

struct API: Codable {
    var results: Int
    var teams: [Team]
}

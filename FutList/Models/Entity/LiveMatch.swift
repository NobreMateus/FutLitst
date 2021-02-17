//
//  LiveMatch.swift
//  FutList
//
//  Created by Mateus Nobre on 05/02/21.
//  Copyright © 2021 Mateus Nobre. All rights reserved.
//

import Foundation

struct LiveMatchesResponse: Codable {
    var response: [LiveMatchResponse]
}

struct LiveMatchResponse: Codable {
    var fixture: LiveMatch
    var teams: Teams
    var goals: GoalsV3
}

struct LiveMatch: Codable {
    var id: Int
    var referee: String?
    var timezone: String
    var date: String
    
}

struct Teams: Codable {
    var home: TeamV3
    var away: TeamV3
}

struct GoalsV3: Codable {
    var home: Int
    var away: Int
}

struct TeamV3: Codable {
    var id: Int
    var name: String
    var logo: String
}

//
//  Match.swift
//  FutList
//
//  Created by Mateus Nobre on 22/08/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//
// swiftlint:disable identifier_name

import Foundation

struct MatchTeam: Decodable {
    let team_id: Int
    let team_name: String
    let logo: String
}

struct Match: Decodable {
    let fixture_id: Int
    let league_id: Int
    let event_date: String
    let statusShort: String
    let elapsed: Int
    let venue: String?
    let referee: String?
    let homeTeam: MatchTeam
    let awayTeam: MatchTeam
    let goalsHomeTeam: Int?
    let goalsAwayTeam: Int?
}

struct ApiMatch: Decodable {
    let results: Int
    let fixtures: [Match]
}

struct MatchResponse: Decodable {
    let api: ApiMatch
}

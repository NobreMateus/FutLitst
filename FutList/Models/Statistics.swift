//
//  StatisticsRequest.swift
//  FutList
//
//  Created by Mateus Nobre on 21/08/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import Foundation

struct Statistics: Decodable {

    let matchs: MatchsInfo
    let goals: Goals
}

struct MatchsInfo: Decodable {

    let matchsPlayed: MatchsResults
    let wins: MatchsResults
    let draws: MatchsResults
    let loses: MatchsResults
}

struct Goals: Decodable {

    let goalsFor: MatchsResults
    let goalsAgainst: MatchsResults
}

struct MatchsResults: Decodable {

    let home: Int
    let away: Int
    let total: Int
}

struct ApiStatics: Decodable {

    let results: Int
    let statistics: Statistics
}

struct StatisticResponse: Decodable {
    let api: ApiStatics
}

//
//  StatisticsRequest.swift
//  FutList
//
//  Created by Mateus Nobre on 21/08/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import Foundation

struct Statistics: Codable {

    let matchs: MatchsInfo
    let goals: Goals
}

struct MatchsInfo: Codable {

    let matchsPlayed: MatchsResults
    let wins: MatchsResults
    let draws: MatchsResults
    let loses: MatchsResults
}

struct Goals: Codable, Equatable {

    let goalsFor: MatchsResults
    let goalsAgainst: MatchsResults
}

struct MatchsResults: Codable, Equatable {

    let home: Int
    let away: Int
    let total: Int
}

struct ApiStatics: Codable {

    let results: Int
    let statistics: Statistics

}

struct StatisticResponse: Codable {
    let api: ApiStatics
}

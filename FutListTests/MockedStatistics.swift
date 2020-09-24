//
//  MockedStatistics.swift
//  FutListTests
//
//  Created by Mateus Nobre on 24/09/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import Foundation
@testable import FutList

struct MockedStatistics {

    let data = StatisticResponse(
        api: ApiStatics(results: 1,
                        statistics:
                            Statistics(matchs:
                                        MatchsInfo(
                                            matchsPlayed: MatchsResults(home: 1, away: 2, total: 3),
                                            wins: MatchsResults(home: 1, away: 2, total: 3),
                                            draws: MatchsResults(home: 1, away: 2, total: 3),
                                            loses: MatchsResults(home: 1, away: 2, total: 3)),
                                       goals: Goals(
                                        goalsFor:
                                            MatchsResults(home: 1, away: 2, total: 3),
                                        goalsAgainst:
                                            MatchsResults(home: 1, away: 2, total: 3)
                                       )
                            )
        )
    )

}

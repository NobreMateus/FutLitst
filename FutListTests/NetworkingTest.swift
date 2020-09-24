//
//  NetworkingTest.swift
//  FutListTests
//
//  Created by Mateus Nobre on 24/09/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import XCTest
@testable import FutList

class NetworkingTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_statistics_networking() throws {

        let teamId = 1
        let leagueId = 1

        let url = URL(string: "https://v2.api-football.com/statistics/\(leagueId)/\(teamId)")

        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolMock.self]

        let session = URLSession(configuration: config)

        let expectedData = MockedStatistics().data

        let mockedData = try JSONEncoder().encode(expectedData)

        URLProtocolMock.testURLs = [url: mockedData]

        let statisticRequest = StatisticsRequest(teamId: teamId, leagueId: leagueId)

        statisticRequest.getTeamStatisticsFromLeague(session: session) { statistics in
            print(statistics)
            XCTAssertEqual(statistics.goals, Goals(goalsFor: MatchsResults(home: 1, away: 2, total: 3),
                                                   goalsAgainst: MatchsResults(home: 1, away: 2, total: 3)))
        }
    }

    func test_teamsRequest_networking() throws {
        let textSearch = "Flamengo"

        let url = URL(string: "https://v2.api-football.com/teams/search/\(textSearch)")

        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolMock.self]

        let session = URLSession(configuration: config)

        let expectedData: TeamResponse = TeamResponse(
            api: API(results: 1, teams: [Team(team_id: 1, name: "Flamengo", logo: "")]))

        let mockedData = try JSONEncoder().encode(expectedData)

        URLProtocolMock.testURLs = [url: mockedData]

        let teamsRequest = TeamsRequest(textSearch: textSearch)
        teamsRequest.getSearchedTeams(session: session ) { teams in
            XCTAssertEqual(teams.count, 1)
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

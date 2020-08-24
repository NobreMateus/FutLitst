//
//  ValidationServiceTests.swift
//  FutListTests
//
//  Created by Mateus Nobre on 23/08/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//
// swiftlint:disable trailing_whitespace line_length

@testable import FutList
import XCTest

class FilterServiceTests: XCTestCase {

    var filter: FilterService!
    var allGames: [Match]!
    var filteredNextGames: [Match]!
    var filteredCompletedAndCurrentGames: [Match]!
    let matchHomeTeam = MatchTeam(team_id: 1, team_name: "Home", logo: "")
    let matchAwayTeam = MatchTeam(team_id: 2, team_name: "Away", logo: "")
    
    override func setUp() {
        super.setUp()
        filter = FilterService()
        allGames = [
            Match(fixture_id: 1, league_id: 1, event_date: "", statusShort: "TBD", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
            Match(fixture_id: 1, league_id: 1, event_date: "", statusShort: "NS", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
            Match(fixture_id: 1, league_id: 1, event_date: "2020-08-08T22:30:00+00:00", statusShort: "1H", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
            Match(fixture_id: 1, league_id: 1, event_date: "2020-08-08T22:30:00+00:00", statusShort: "HT", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
            Match(fixture_id: 1, league_id: 1, event_date: "2020-08-09T00:00:00+00:00", statusShort: "2H", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
            Match(fixture_id: 1, league_id: 1, event_date: "2020-08-09T00:00:00+00:00", statusShort: "ET", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
            Match(fixture_id: 1, league_id: 1, event_date: "2020-08-09T00:00:00+00:00", statusShort: "P", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
            Match(fixture_id: 1, league_id: 1, event_date: "", statusShort: "FT", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
            Match(fixture_id: 1, league_id: 1, event_date: "", statusShort: "AET", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
            Match(fixture_id: 1, league_id: 1, event_date: "", statusShort: "PEN", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
            Match(fixture_id: 1, league_id: 1, event_date: "", statusShort: "BT", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
            Match(fixture_id: 1, league_id: 1, event_date: "", statusShort: "SUSP", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
            Match(fixture_id: 1, league_id: 1, event_date: "", statusShort: "INT", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
            Match(fixture_id: 1, league_id: 1, event_date: "", statusShort: "PST", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
            Match(fixture_id: 1, league_id: 1, event_date: "", statusShort: "CANC", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
            Match(fixture_id: 1, league_id: 1, event_date: "", statusShort: "ABD", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
            Match(fixture_id: 1, league_id: 1, event_date: "", statusShort: "AWD", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
            Match(fixture_id: 1, league_id: 1, event_date: "", statusShort: "WO", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil)
        ]
        
        filteredNextGames = [
            Match(fixture_id: 1, league_id: 1, event_date: "", statusShort: "TBD", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
            Match(fixture_id: 1, league_id: 1, event_date: "", statusShort: "NS", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
            Match(fixture_id: 1, league_id: 1, event_date: "", statusShort: "SUSP", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
            Match(fixture_id: 1, league_id: 1, event_date: "", statusShort: "PST", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil)
        ]
        
        filteredCompletedAndCurrentGames = [
           Match(fixture_id: 1, league_id: 1, event_date: "2020-08-08T22:30:00+00:00", statusShort: "1H", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
           Match(fixture_id: 1, league_id: 1, event_date: "2020-08-08T22:30:00+00:00", statusShort: "HT", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
           Match(fixture_id: 1, league_id: 1, event_date: "2020-08-09T00:00:00+00:00", statusShort: "2H", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
           Match(fixture_id: 1, league_id: 1, event_date: "2020-08-09T00:00:00+00:00", statusShort: "ET", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
           Match(fixture_id: 1, league_id: 1, event_date: "2020-08-09T00:00:00+00:00", statusShort: "P", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
           Match(fixture_id: 1, league_id: 1, event_date: "", statusShort: "FT", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
           Match(fixture_id: 1, league_id: 1, event_date: "", statusShort: "AET", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
           Match(fixture_id: 1, league_id: 1, event_date: "", statusShort: "PEN", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
           Match(fixture_id: 1, league_id: 1, event_date: "", statusShort: "BT", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
           Match(fixture_id: 1, league_id: 1, event_date: "", statusShort: "INT", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
           Match(fixture_id: 1, league_id: 1, event_date: "", statusShort: "ABD", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
           Match(fixture_id: 1, league_id: 1, event_date: "", statusShort: "AWD", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
           Match(fixture_id: 1, league_id: 1, event_date: "", statusShort: "WO", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil)
        ]
    }

    override func tearDown() {
        filter = nil
        super.tearDown()
    }
    
    func test_is_getting_next_games() {
        XCTAssertEqual(filter.filterNextGames(matches: allGames).count, filteredNextGames.count)
    }
    
    func test_is_getting_completed_and_current_games() {
        XCTAssertEqual(filter.filterFinishedGames(matches: allGames).count, filteredCompletedAndCurrentGames.count)
    }
    
    func test_is_mounting_date_tuple_corect() {
        
        let separatedMatchesByDateTuple = filter.separateMatchesByDate(matches: filteredCompletedAndCurrentGames)
        
        XCTAssertTrue(separatedMatchesByDateTuple.1.count == 2)
        
        XCTAssertNotNil(separatedMatchesByDateTuple.0["08-08-2020"])
        XCTAssertNotNil(separatedMatchesByDateTuple.0["09-08-2020"])
        
        XCTAssertTrue(separatedMatchesByDateTuple.0["08-08-2020"]?.count == 2)
        XCTAssertTrue(separatedMatchesByDateTuple.0["09-08-2020"]?.count == 3)
    }
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}

//
//  ValidationServiceTests.swift
//  FutListTests
//
//  Created by Mateus Nobre on 23/08/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//
// swiftlint:disable trailing_whitespace line_length identifier_name

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
            putStatusOnMatch(statusShort: "TBD"),
            putStatusOnMatch(statusShort: "NS"),
            putStatusOnMatch(statusShort: "1H"),
            putStatusOnMatch(statusShort: "HT"),
            putStatusOnMatch(statusShort: "2H"),
            putStatusOnMatch(statusShort: "ET"),
            putStatusOnMatch(statusShort: "P"),
            putStatusOnMatch(statusShort: "FT"),
            putStatusOnMatch(statusShort: "AET"),
            putStatusOnMatch(statusShort: "PEN"),
            putStatusOnMatch(statusShort: "BT"),
            putStatusOnMatch(statusShort: "SUSP"),
            putStatusOnMatch(statusShort: "INT"),
            putStatusOnMatch(statusShort: "PST"),
            putStatusOnMatch(statusShort: "CANC"),
            putStatusOnMatch(statusShort: "ABD"),
            putStatusOnMatch(statusShort: "AWD"),
            putStatusOnMatch(statusShort: "WO")
        ]
        
        filteredNextGames = [
            putStatusOnMatch(statusShort: "TBD"),
            putStatusOnMatch(statusShort: "NS"),
            putStatusOnMatch(statusShort: "SUSP"),
            putStatusOnMatch(statusShort: "PST")
        ]
        
        filteredCompletedAndCurrentGames = [
           putStatusOnMatchAndDate(event_date: "2020-08-08T22:30:00+00:00", statusShort: "1H"),
           putStatusOnMatchAndDate(event_date: "2020-08-08T22:30:00+00:00", statusShort: "HT"),
           putStatusOnMatchAndDate(event_date: "2020-08-09T00:00:00+00:00", statusShort: "2H"),
           putStatusOnMatchAndDate(event_date: "2020-08-09T00:00:00+00:00", statusShort: "ET"),
           putStatusOnMatchAndDate(event_date: "2020-08-09T00:00:00+00:00", statusShort: "P"),
           putStatusOnMatch(statusShort: "FT"),
           putStatusOnMatch(statusShort: "AET"),
           putStatusOnMatch(statusShort: "PEN"),
           putStatusOnMatch(statusShort: "BT"),
           putStatusOnMatch(statusShort: "INT"),
           putStatusOnMatch(statusShort: "ABD"),
           putStatusOnMatch(statusShort: "AWD"),
           putStatusOnMatch(statusShort: "WO")
        ]
    }
    
    func putStatusOnMatch(statusShort: String) -> Match {
        return Match(fixture_id: 1, league_id: 1, event_date: "", statusShort: statusShort, elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil)
    }
    
    func putStatusOnMatchAndDate(event_date: String, statusShort: String) -> Match {
        return Match(fixture_id: 1, league_id: 1, event_date: event_date, statusShort: statusShort, elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil)
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

}

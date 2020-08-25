//
//  GamesViewControllerTests.swift
//  FutListTests
//
//  Created by Mateus Nobre on 24/08/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//swiftlint:disable line_length

@testable import FutList
import XCTest

class GamesViewControllerTests: XCTestCase {

    let jogosViewController = JogosViewController()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_computed_properties() {

        let matchTeam = MatchTeam(team_id: 1, team_name: "", logo: "")
        let match = Match(fixture_id: 1, league_id: 1, event_date: "", statusShort: "", elapsed: 1, venue: nil, referee: nil, homeTeam: matchTeam, awayTeam: matchTeam, goalsHomeTeam: nil, goalsAwayTeam: nil)

        XCTAssertTrue(jogosViewController.finishedGames.1 == [] )
        XCTAssertTrue(jogosViewController.tableGames.1 == [] )

        jogosViewController.finishedGames = (["01-01-2020": [match, match]], ["01-01-2020", "01-01-2020"])
        jogosViewController.nextGames = (["01-01-2020": [match, match]], ["01-01-2020", "01-01-2020"])

        XCTAssertTrue(jogosViewController.gamesSegmentedControl.selectedSegmentIndex == 0)
        XCTAssertTrue(jogosViewController.tableGames.1 == ["01-01-2020", "01-01-2020"])
        XCTAssertTrue(jogosViewController.tableGames.0["01-01-2020"]?.count == 2)

    }

}

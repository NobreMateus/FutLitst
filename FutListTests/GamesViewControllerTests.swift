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
    let mockedMatches = MockedMatches()

    override func setUp() {

        //jogosViewController.tableGames = (mockedMatches.matchesDictionary, mockedMatches.keys)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_computed_properties_finished_matches() {

        jogosViewController.tableGames = ([:], [])

        XCTAssertTrue(jogosViewController.finishedGames.1 == [] )
        XCTAssertTrue(jogosViewController.tableGames.1 == [] )

        jogosViewController.finishedGames = (mockedMatches.finishedMatches, mockedMatches.keys)
        jogosViewController.nextGames = (mockedMatches.finishedMatches, mockedMatches.keys)

        XCTAssertTrue(jogosViewController.selectedSegmented == 0)
        XCTAssertTrue(jogosViewController.tableGames.1 == mockedMatches.keys)
        XCTAssertTrue(jogosViewController.tableGames.0[mockedMatches.keys[0]]?.count == 7)
        XCTAssertTrue(jogosViewController.tableGames.0[mockedMatches.keys[1]]?.count == 5)

    }

    func test_computed_properties_next_matches() {
        jogosViewController.tableGames = ([:], [])
        jogosViewController.selectedSegmented = 1

        XCTAssertTrue(jogosViewController.nextGames.1 == [] )
        XCTAssertTrue(jogosViewController.tableGames.1 == [] )

        jogosViewController.finishedGames = (mockedMatches.nextMatches, mockedMatches.keys)
        jogosViewController.nextGames = (mockedMatches.nextMatches, mockedMatches.keys)

        let firstSectionMockedGamesCount = mockedMatches.nextMatches[mockedMatches.keys[0]]?.count
        let secondsSectionMockedGamesCount = mockedMatches.nextMatches[mockedMatches.keys[1]]?.count

        XCTAssertTrue(jogosViewController.selectedSegmented == 1)
        XCTAssertTrue(jogosViewController.tableGames.1 == mockedMatches.keys)
        XCTAssertTrue(jogosViewController.tableGames.0[mockedMatches.keys[0]]?.count == firstSectionMockedGamesCount)
        XCTAssertTrue(jogosViewController.tableGames.0[mockedMatches.keys[1]]?.count == secondsSectionMockedGamesCount)
    }

    func test_cell_heigth() {

        let itemHeigth = jogosViewController.tableView(UITableView(), heightForRowAt: IndexPath(item: 1, section: 1))

        XCTAssertTrue(itemHeigth == 180)
    }

    func test_title_header() {

        jogosViewController.tableGames = (mockedMatches.finishedMatches, mockedMatches.keys)

        guard let firstTitleHeader = jogosViewController.tableView(UITableView(), titleForHeaderInSection: 0) else {
            XCTAssertTrue(false)
            return
        }
        XCTAssertTrue(firstTitleHeader == mockedMatches.keys[0])

        guard let secondTitleHeader = jogosViewController.tableView(UITableView(), titleForHeaderInSection: 1) else {
            XCTAssertTrue(false)
            return
        }
        XCTAssertTrue(secondTitleHeader == mockedMatches.keys[1])

    }

    func test_number_of_rows_in_section() {

        jogosViewController.tableGames = (mockedMatches.finishedMatches, mockedMatches.keys)

        let rowsNumberSection0 = jogosViewController.tableView(UITableView(), numberOfRowsInSection: 0)

        XCTAssertTrue(rowsNumberSection0 == mockedMatches.finishedMatches[mockedMatches.keys[0]]?.count)

    }

    func test_number_of_sections() {
        jogosViewController.tableGames = (mockedMatches.finishedMatches, mockedMatches.keys)

        let numberOfSections = jogosViewController.numberOfSections(in: UITableView())

        XCTAssertTrue(numberOfSections == mockedMatches.keys.count)
    }

}

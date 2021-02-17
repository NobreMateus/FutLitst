//
//  DescobrirViewControllerTests.swift
//  FutListTests
//
//  Created by Mateus Nobre on 26/08/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

@testable import FutList
import XCTest

class DescobrirViewControllerTests: XCTestCase {

    let descobrirViewController = DescobrirViewController()

    let mockedTeams: [Team] = [
        Team(team_id: 1, name: "Flamengo", logo: ""),
        Team(team_id: 2, name: "Fortaleza", logo: ""),
        Team(team_id: 3, name: "Ceara", logo: ""),
        Team(team_id: 4, name: "Guarani", logo: "")
    ]

    override func setUp() {
        descobrirViewController.teamsList = mockedTeams
    }

    func test_number_of_lines_in_section() {

        let linesNumber = descobrirViewController.tableView(UITableView(), numberOfRowsInSection: 0)

        XCTAssertTrue(linesNumber == mockedTeams.count)
    }

    func test_header_title() {

//        let sectionTiltle = descobrirViewController.tableView(UITableView(), titleForHeaderInSection: 0)
//
//        XCTAssertTrue(sectionTiltle == "Resultados: \(mockedTeams.count)")
    }

    func test_line_heigth() {

        let lineHeigth = descobrirViewController.tableView(UITableView(), heightForRowAt: IndexPath(row: 0, section: 0))

        XCTAssertTrue(lineHeigth == 100)
    }
}

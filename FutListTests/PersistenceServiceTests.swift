//
//  PersistenceServiceTests.swift
//  FutListTests
//
//  Created by Mateus Nobre on 23/08/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

@testable import FutList
import XCTest

class PersistenceServiceTests: XCTestCase {

    let defaults = UserDefaults.standard
    let persistenceService = PersistenceService()
    let newTeamId = -10

    func test_saving_new_team_id() {
        persistenceService.saveFollowedTeam(teamId: newTeamId)

        let teamsIds = defaults.object(forKey: "followedTeamsIdArray") as? [Int]

        XCTAssertNotNil(teamsIds)

        if let teamsIdsIntArray = teamsIds {
            XCTAssertTrue(teamsIdsIntArray.contains(newTeamId))
        }
    }

    override func tearDown() {

        let teamsIds = defaults.object(forKey: "followedTeamsIdArray") as? [Int]

         XCTAssertNotNil(teamsIds)

        if let teamsIdsIntArray = teamsIds {
            var sortedTeamsIds = teamsIdsIntArray.sorted()
            sortedTeamsIds.remove(at: 0)
            defaults.set(sortedTeamsIds, forKey: "followedTeamsIdArray")
        }

        super.tearDown()
    }

}

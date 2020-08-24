//
//  PersistenceService.swift
//  FutList
//
//  Created by Mateus Nobre on 23/08/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import Foundation

struct PersistenceService {

    let defaults = UserDefaults.standard

    func saveFollowedTeam(teamId: Int) {

        let teamsIds = defaults.object(forKey: "followedTeamsIdArray") as? [Int]

        if var teamsIdsIntArray = teamsIds {
            teamsIdsIntArray.append(teamId)
            defaults.set(teamsIdsIntArray, forKey: "followedTeamsIdArray")
        } else {
            defaults.set([teamId], forKey: "followedTeamsIdArray")
        }
    }
}

//
//  DataFilter.swift
//  FutList
//
//  Created by Mateus Nobre on 10/02/21.
//  Copyright © 2021 Mateus Nobre. All rights reserved.
//swiftlint:disable force_cast

import Foundation
import UIKit
import CoreData

class DataFilter {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func followingTeamContain(teamId: Int) -> Bool {
        let request = FollowingTeams.fetchRequest() as NSFetchRequest
        let pred = NSPredicate(format: "teamId = %@", String(teamId))
        request.predicate = pred
        do {
            let item = try context.fetch(request)
            return item.count >= 1
        } catch {
            return false
        }
    }
    
    func getFirstTeamById(teamId: Int) -> FollowingTeams? {
        let request = FollowingTeams.fetchRequest() as NSFetchRequest
        let pred = NSPredicate(format: "teamId = %@", String(teamId))
        request.predicate = pred
        do {
            let item = try context.fetch(request)
            return item[0]
        } catch {
            return nil
        }
    }
    
}

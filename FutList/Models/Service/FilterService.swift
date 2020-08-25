//
//  FilterService.swift
//  FutList
//
//  Created by Mateus Nobre on 23/08/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//
// swiftlint:disable cyclomatic_complexity
import Foundation

struct FilterService {
    func filterNextGames(matches: [Match]) -> [Match] {

        var nextGames: [Match] = []

        for match in matches where isNextGame(status: match.statusShort ) {
                nextGames.append(match)
        }
        return nextGames
    }

    func filterFinishedGames(matches: [Match]) -> [Match] {

        var finishedGames: [Match] = []

        for match in matches where isFinishedOrCurrentGame(status: match.statusShort ) {
                finishedGames.append(match)
        }
        return finishedGames
    }

    func isFinishedOrCurrentGame(status: String) -> Bool {

        switch status {
        case "1H":
            return true
        case "HT":
            return true
        case "2H":
            return true
        case "ET":
            return true
        case "P":
            return true
        case "FT":
            return true
        case "AET":
            return true
        case "PEN":
            return true
        case "BT":
            return true
        case "INT":
            return true
        case "ABD":
            return true
        case "AWD":
            return true
        case "WO":
            return true
        default:
            return false
        }
    }

    func isNextGame(status: String) -> Bool {
        switch status {
        case "TBD":
            return true
        case "NS":
            return true
        case "SUSP":
            return true
        case "PST":
            return true
        default:
            return false
        }
    }

    func separateMatchesByDate(matches: [Match]) -> ([String:[Match]], [String]) {

        var matchesByDate = [String:[Match]]()
        var keys:[String] = []

        let inputDateFormatter = DateFormatter()
        inputDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'+'ss:SS"

        let outputDateFormatter = DateFormatter()
        outputDateFormatter.dateFormat = "dd-MM-yyyy"

        for match in matches {

            if let matchDate = inputDateFormatter.date(from:match.event_date) {
                let matchDateString = outputDateFormatter.string(from: matchDate)
                print(matchDateString)
                if var tempArray = matchesByDate[matchDateString] {
                    tempArray.append(match)
                    matchesByDate[matchDateString] = tempArray
                } else {
                    matchesByDate[matchDateString] = [match]
                    keys.append(matchDateString)
                }
            }
        }

        return (matchesByDate, keys)
    }
}

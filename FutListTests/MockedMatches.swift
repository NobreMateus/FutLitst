//
//  MockedMatches.swift
//  FutListTests
//
//  Created by Mateus Nobre on 25/08/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//
// swiftlint:disable line_length function_body_length

import Foundation
@testable import FutList

class MockedMatches {

    let allMatches: [Match]
    let matchHomeTeam = MatchTeam(team_id: 1, team_name: "Home", logo: "")
    let matchAwayTeam = MatchTeam(team_id: 2, team_name: "Away", logo: "")
    let keys: [String]
    let matchesDictionary: [String: [Match]]
    let finishedMatches: [String: [Match]]
    let nextMatches: [String: [Match]]

    init() {
        allMatches = [
            Match(fixture_id: 1, league_id: 1, event_date: "1997-03-01T22:30:00+00:00", statusShort: "TBD", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
            Match(fixture_id: 1, league_id: 1, event_date: "1997-03-01T22:30:00+00:00", statusShort: "NS", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
            Match(fixture_id: 1, league_id: 1, event_date: "1997-03-01T22:30:00+00:00", statusShort: "1H", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
            Match(fixture_id: 1, league_id: 1, event_date: "1997-03-01T22:30:00+00:00", statusShort: "HT", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
            Match(fixture_id: 1, league_id: 1, event_date: "1997-03-01T22:30:00+00:00", statusShort: "2H", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
            Match(fixture_id: 1, league_id: 1, event_date: "1997-03-01T22:30:00+00:00", statusShort: "ET", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
            Match(fixture_id: 1, league_id: 1, event_date: "1997-03-01T22:30:00+00:00", statusShort: "P", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
            Match(fixture_id: 1, league_id: 1, event_date: "1997-03-01T22:30:00+00:00", statusShort: "FT", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
            Match(fixture_id: 1, league_id: 1, event_date: "1997-03-01T22:30:00+00:00", statusShort: "AET", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
            Match(fixture_id: 1, league_id: 1, event_date: "1997-03-02T22:30:00+00:00", statusShort: "PEN", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
            Match(fixture_id: 1, league_id: 1, event_date: "1997-03-02T22:30:00+00:00", statusShort: "BT", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
            Match(fixture_id: 1, league_id: 1, event_date: "1997-03-02T22:30:00+00:00", statusShort: "SUSP", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
            Match(fixture_id: 1, league_id: 1, event_date: "1997-03-02T22:30:00+00:00", statusShort: "INT", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
            Match(fixture_id: 1, league_id: 1, event_date: "1997-03-02T22:30:00+00:00", statusShort: "PST", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
            Match(fixture_id: 1, league_id: 1, event_date: "1997-03-02T22:30:00+00:00", statusShort: "CANC", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
            Match(fixture_id: 1, league_id: 1, event_date: "1997-03-02T22:30:00+00:00", statusShort: "ABD", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
            Match(fixture_id: 1, league_id: 1, event_date: "1997-03-02T22:30:00+00:00", statusShort: "AWD", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil),
            Match(fixture_id: 1, league_id: 1, event_date: "1997-03-02T22:30:00+00:00", statusShort: "WO", elapsed: 1, venue: nil, referee: nil, homeTeam: matchHomeTeam, awayTeam: matchAwayTeam, goalsHomeTeam: nil, goalsAwayTeam: nil)
        ]

        keys = ["01-03-1997", "02-03-1997"]

        matchesDictionary = [
            "01-03-1997": [
                allMatches[0],
                allMatches[1],
                allMatches[2],
                allMatches[3],
                allMatches[4],
                allMatches[5],
                allMatches[6],
                allMatches[7],
                allMatches[8]
            ],
            "02-03-1997": [
                allMatches[9],
                allMatches[10],
                allMatches[11],
                allMatches[12],
                allMatches[13],
                allMatches[15],
                allMatches[16],
                allMatches[17]
            ]
        ]

        finishedMatches = [
            keys[0]: [
                allMatches[2],
                allMatches[3],
                allMatches[4],
                allMatches[5],
                allMatches[6],
                allMatches[7],
                allMatches[8]],
            keys[1]: [
                allMatches[9],
                allMatches[10],
                allMatches[12],
                allMatches[15],
                allMatches[16]]
        ]

        nextMatches = [
            keys[0]: [
                allMatches[0],
                allMatches[1]],
            keys[1]: [
                allMatches[11],
                allMatches[13]]
        ]
    }
}

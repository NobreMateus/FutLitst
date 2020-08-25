//
//  League.swift
//  FutList
//
//  Created by Mateus Nobre on 21/08/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//
// swiftlint:disable identifier_name
//

import Foundation

struct League: Decodable {
    let league_id: Int
    let name: String
}

struct ApiLeague: Decodable {
    var results: Int
    var leagues: [League]
}

struct ResponseLeague: Decodable {
    var api: ApiLeague
}

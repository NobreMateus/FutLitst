//
//  LeaguesRequest.swift
//  FutList
//
//  Created by Mateus Nobre on 21/08/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//
//swiftlint:disable identifier_name

import Foundation

enum LeaguesError: Error {
    case NoData
    case CanNotProcessData
}

struct LeaguesRequest {
    let resourceURL: URL
    let API_KEY = "1af6798dcd3baeedb5836a3518b73c56"

    init(teamId: Int) {

        let resourceString =  "https://v2.api-football.com/leagues/team/\(teamId)/2020"
        guard let resourceURL = URL(string: resourceString) else { fatalError() }
        self.resourceURL = resourceURL
    }

    func getTeamLeagues(completion: @escaping(Result<[League], LeaguesError>) -> Void) {

        var request = URLRequest(url: resourceURL)
        request.httpMethod = "POST"
        request.setValue(API_KEY, forHTTPHeaderField: "X-RapidAPI-Key")

        let dataTask = URLSession.shared.dataTask(with: request) {data, _, _ in

            guard let jsonData = data else {
                completion(.failure(.NoData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let leaguesResponse = try decoder.decode(ResponseLeague.self, from: jsonData)
                let leaguesFound = leaguesResponse.api.leagues
                completion(.success(leaguesFound))
            } catch {
                completion(.failure(.CanNotProcessData))
            }

        }
        dataTask.resume()
    }
}

//
//  MatchRequest.swift
//  FutList
//
//  Created by Mateus Nobre on 22/08/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//
// swiftlint:disable identifier_name

import Foundation

enum MatchsError: Error {
    case NoData
    case CanNotProcessData
}

struct MatchRequest {

    let resourceURL: URL
    let API_KEY = "1af6798dcd3baeedb5836a3518b73c56"

    init(leagueId: Int) {
        let resourceString = "https://v2.api-football.com/fixtures/league/\(leagueId)"
        guard let resourceURL = URL(string: resourceString) else { fatalError() }
        self.resourceURL = resourceURL
    }

    func getMatchsFromLeague(completion: @escaping (Result<[Match], MatchsError>) -> Void) {

        var request = URLRequest(url: self.resourceURL)
        request.httpMethod = "POST"
        request.addValue(self.API_KEY, forHTTPHeaderField: "X-RapidAPI-Key")

        let data = URLSession.shared.dataTask(with: request) { data, _, _ in

            guard let jsonData = data else {
                completion(.failure(.NoData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let matchsResponse = try decoder.decode(MatchResponse.self, from: jsonData)
                let matchsFound = matchsResponse.api.fixtures
                completion(.success(matchsFound))
            } catch {
                completion(.failure(.CanNotProcessData))
            }
        }
        data.resume()
    }

}

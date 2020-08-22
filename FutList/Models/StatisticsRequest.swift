//
//  StatisticsRequest.swift
//  FutList
//
//  Created by Mateus Nobre on 21/08/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//
// swiftlint:disable identifier_name
//

import Foundation

enum StatisticsError: Error {
    case NoData
    case CanNotProcessData
}

struct StatisticsRequest {

    let resourceURL: URL
    let API_KEY = "1af6798dcd3baeedb5836a3518b73c56"

    init(teamId: Int, leagueId: Int) {

        let resourceString = "https://v2.api-football.com/statistics/\(leagueId)/\(teamId)"
        guard let resourceURL = URL(string: resourceString) else { fatalError() }

        self.resourceURL = resourceURL
    }

    func getTeamStatisticsFromLeague( completion: @escaping (Result<Statistics, StatisticsError>) -> Void ) {

        var request = URLRequest(url: self.resourceURL)
        request.httpMethod = "POST"
        request.setValue(API_KEY, forHTTPHeaderField: "X-RapidAPI-Key")

        let dataTask = URLSession.shared.dataTask(with: request) { data, _, _ in

            guard let jsonData = data else {
                completion(.failure(.NoData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let statisticsResponse = try decoder.decode(StatisticResponse.self, from: jsonData)
                let statisticsFound = statisticsResponse.api.statistics
                completion(.success(statisticsFound))
            } catch {
                completion(.failure(.CanNotProcessData))
            }

        }
        dataTask.resume()
    }
}

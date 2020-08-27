//
//  StatisticsRequest.swift
//  FutList
//
//  Created by Mateus Nobre on 21/08/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//
//

import Foundation

struct StatisticsRequest {
    let resourceURL: URL
    let request = Request<StatisticResponse>()
    
    init(teamId: Int, leagueId: Int) {

        let resourceString = "https://v2.api-football.com/statistics/\(leagueId)/\(teamId)"
        guard let resourceURL = URL(string: resourceString) else { fatalError() }
        self.resourceURL = resourceURL
    }

    func getTeamStatisticsFromLeague( completion: @escaping (Statistics) -> Void ) {

        request.doRequest(resource: resourceURL) { result in
            switch result {
            case .success(let statistic):
                completion(statistic.api.statistics)
            case .failure(let error):
                print(error)
            }
        }
    }
}

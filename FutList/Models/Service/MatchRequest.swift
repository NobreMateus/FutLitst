//
//  MatchRequest.swift
//  FutList
//
//  Created by Mateus Nobre on 22/08/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//
//

import Foundation

struct MatchRequest {
    let resourceURL: URL
    let request = Request<MatchResponse>()
    
    init(leagueId: Int) {
        let resourceString = "https://v2.api-football.com/fixtures/league/\(leagueId)"
        guard let resourceURL = URL(string: resourceString) else { fatalError() }
        self.resourceURL = resourceURL
    }

    func getMatchsFromLeague(completion: @escaping ([Match]) -> Void) {

        request.doRequest(resource: self.resourceURL) { result in
                
            switch result {
            case .success(let matchResponse):
                completion(matchResponse.api.fixtures)
            case .failure(let error):
                print(error)
                completion([])
            }

        }
    }
}

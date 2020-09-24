//
//  LeaguesRequest.swift
//  FutList
//
//  Created by Mateus Nobre on 21/08/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import Foundation

struct LeaguesRequest {
    let resourceURL: URL
    let request = Request<ResponseLeague>()
    
    init(teamId: Int) {

        let resourceString =  "https://v2.api-football.com/leagues/team/\(teamId)/2020"
        guard let resourceURL = URL(string: resourceString) else { fatalError() }
        self.resourceURL = resourceURL
    }

    func getTeamLeagues(completion: @escaping([League]) -> Void) {

        request.doRequest(resource: resourceURL, session: URLSession.shared, completion: { result in
            switch result {
            case .success(let leaguesResponse):
                completion(leaguesResponse.api.leagues)
            case .failure(let error):
                print(error)
            }
        })
    }
}

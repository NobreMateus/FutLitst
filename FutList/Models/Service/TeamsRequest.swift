//
//  TeamsRequest.swift
//  FutList
//
//  Created by Mateus Nobre on 19/08/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import Foundation

struct TeamsRequest {
    let resourceURL: URL
    let request = Request<TeamResponse>()
    
    init(textSearch:String) {

        let resourceString =  "https://v2.api-football.com/teams/search/\(textSearch)"
        guard let resourceURL = URL(string: resourceString) else { fatalError() }
        self.resourceURL = resourceURL
    }

    func getSearchedTeams(completion: @escaping([Team]) -> Void) {

        request.doRequest(resource: resourceURL) { result in
            switch result {
            case .success(let teamResponse):
                completion(teamResponse.api.teams)
            case .failure(let error):
                print(error)
            }
        }
    }
}

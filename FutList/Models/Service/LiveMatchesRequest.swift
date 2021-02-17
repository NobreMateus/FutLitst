//
//  LiveMatchesRequest.swift
//  FutList
//
//  Created by Mateus Nobre on 05/02/21.
//  Copyright © 2021 Mateus Nobre. All rights reserved.
//

import Foundation

struct LivesMatchesRequest {
    let resourceURL: URL
    let request = Request<LiveMatchesResponse>()
    
    init() {

        let resourceString =  "https://v3.football.api-sports.io/fixtures?live=all"
        guard let resourceURL = URL(string: resourceString) else { fatalError() }
        self.resourceURL = resourceURL
    }

    func getLiveMatches(session: URLSession, completion: @escaping([LiveMatchResponse]) -> Void) {

        request.doRequest(resource: resourceURL, session: session) { result in
            
            switch result {
            case .success(let liveMatchesResponse):
                completion(liveMatchesResponse.response)
            case .failure(let error):
                print(error)
            }
        }
    }
}

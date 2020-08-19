//
//  TeamsRequest.swift
//  FutList
//
//  Created by Mateus Nobre on 19/08/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//
//swiftlint:disable identifier_name

import Foundation

enum TeamsError: Error {
    case NoData
    case CanNotProcessData
}

struct TeamsRequest {
    let resourceURL: URL
    let API_KEY = "1af6798dcd3baeedb5836a3518b73c56"

    init(textSearch:String) {

        let resourceString =  "https://v2.api-football.com/teams/search/\(textSearch)"
        guard let resourceURL = URL(string: resourceString) else { fatalError() }
        self.resourceURL = resourceURL
    }

    func getSearchedTeams(completion: @escaping(Result<[Team], TeamsError>) -> Void) {

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
                let teamsResponse = try decoder.decode(Response.self, from: jsonData)
                let teamsFound = teamsResponse.api.teams
                completion(.success(teamsFound))
            } catch {
                completion(.failure(.CanNotProcessData))
            }

        }
        dataTask.resume()
    }
}

//
//  Request.swift
//  FutList
//
//  Created by Mateus Nobre on 26/08/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//
// swiftlint:disable trailing_whitespace identifier_name

import Foundation

struct Request<T: Decodable> {
    
    let API_KEY = "1af6798dcd3baeedb5836a3518b73c56"
    
    func doRequest(resource: URL, completion: @escaping (Result<T, RequestError>) -> Void) {

        var request = URLRequest(url: resource)
        request.httpMethod = "POST"
        request.addValue(self.API_KEY, forHTTPHeaderField: "X-RapidAPI-Key")

        let data = URLSession.shared.dataTask(with: request) { data, _, _ in

            guard let jsonData = data else {
                completion(.failure(.NoData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(T.self, from: jsonData)
                completion(.success(response))
            } catch {
                completion(.failure(.CanNotProcessData))
            }
        }
        data.resume()
    }
}

enum RequestError: Error {
    case NoData
    case CanNotProcessData
}

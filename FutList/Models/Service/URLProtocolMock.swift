//
//  URLProtocolMock.swift
//  FutList
//
//  Created by Mateus Nobre on 24/09/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import UIKit

class URLProtocolMock: URLProtocol {
    
    // this dictionary maps URLs to test data
    static var testURLs = [URL?: Data]()
    
    // say we want to handle all types of request
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    // ignore this method; just send back what we were given
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
    // if we have a valid URL…
    if let url = request.url {
        // …and if we have test data for that URL…
        if let data = URLProtocolMock.testURLs[url] {
            // …load it immediately.
            self.client?.urlProtocol(self, didLoad: data)
        }
    }

    // mark that we've finished
    self.client?.urlProtocolDidFinishLoading(self)
    
    }
    
    // this method is required but doesn't need to do anything
    override func stopLoading() { }
    
}

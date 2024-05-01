//
//  MockURLSessionProtocol.swift
//  Team0418PokemonTests
//
//  Created by jinwoong Kim on 5/1/24.
//

import Foundation

final class MockURLSessionProtocol: URLProtocol {
    static var loadingHandler: ((URLRequest) -> (HTTPURLResponse, Data?))?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func stopLoading() {
        guard let handler = MockURLSessionProtocol.loadingHandler else { return }
        let (response, data) = handler(request)
        
        client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
        if let data {
            client?.urlProtocol(self, didLoad: data)
        }
        client?.urlProtocolDidFinishLoading(self)
    }
}

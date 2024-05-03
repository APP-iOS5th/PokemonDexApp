//
//  Requestable.swift
//  Team0418Pokemon
//
//  Created by jinwoong Kim on 4/30/24.
//

import Foundation

protocol Requestable {
    var baseURL: String { get }
    var path: String { get }
}

extension Requestable {
    private func url() throws -> URL {
        guard let url = URL(string: baseURL) else {
            throw URLError(.badURL)
        }
        return url.appending(path: path)
    }
    
    func buildRequest() throws -> URLRequest {
        let url = try url()
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        return request
    }
}

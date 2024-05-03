//
//  Endpoint.swift
//  Team0418Pokemon
//
//  Created by jinwoong Kim on 4/30/24.
//

import Foundation

struct Endpoint<R: Decodable>: Requestable, Responsable {
    typealias Response = R
    
    var baseURL: String
    var path: String
    
    init(baseURL: String, path: String) {
        self.baseURL = baseURL
        self.path = path
    }
    
    init(urlString: String) {
        self.baseURL = urlString
        self.path = ""
    }
}

//
//  PokemonAPIService.swift
//  Team0418Pokemon
//
//  Created by jinwoong Kim on 4/30/24.
//

import Foundation

final class PokemonAPIService: APIService {
    var session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
}

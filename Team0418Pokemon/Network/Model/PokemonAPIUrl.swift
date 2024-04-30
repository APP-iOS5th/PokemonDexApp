//
//  PokemonAPIUrl.swift
//  Team0418Pokemon
//
//  Created by jinwoong Kim on 4/30/24.
//

import Foundation

enum PokemonAPIUrl {
    case list(offset: Int, limit: Int)
    case detail(Int)
    case species(Int)
    
    var apiUrl: String {
        switch self {
            case let .list(offset, limit):
                return "https://pokeapi.co/api/v2/pokemon?limit=\(offset)&offset=\(limit)"
            case let .detail(id):
                return "https://pokeapi.co/api/v2/pokemon/\(id)"
            case let .species(id):
                return "https://pokeapi.co/api/v2/pokemon-species/\(id)"
        }
    }
}


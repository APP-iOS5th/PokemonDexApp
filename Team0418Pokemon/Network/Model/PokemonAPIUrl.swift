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
    case detailString(String)
    case species(Int)
    case rawUrl(String)
    
    var apiUrl: String {
        switch self {
            case let .list(offset, limit):
                return "https://pokeapi.co/api/v2/pokemon?limit=\(limit)&offset=\(offset)"
            case let .detail(id):
                return "https://pokeapi.co/api/v2/pokemon/\(id)"
            case let .detailString(name):
                return "https://pokeapi.co/api/v2/pokemon/\(name)"
            case let .species(id):
                return "https://pokeapi.co/api/v2/pokemon-species/\(id)"
            case let .rawUrl(urlString):
                return urlString
        }
    }
}


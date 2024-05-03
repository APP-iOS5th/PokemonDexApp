//
//  PokemonStatsDTO.swift
//  Team0418Pokemon
//
//  Created by jinwoong Kim on 5/2/24.
//

import Foundation

struct PokemonStatsDTO: Decodable {
    let baseStat: Int
    let effort: Int
    let stat: PokemonStatDTO
    
    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort
        case stat
    }
}

struct PokemonStatDTO: Decodable {
    let name: String
    let url: String
}

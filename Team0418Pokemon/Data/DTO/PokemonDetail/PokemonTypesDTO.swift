//
//  PokemonTypesDTO.swift
//  Team0418Pokemon
//
//  Created by jinwoong Kim on 5/2/24.
//

import Foundation

struct PokemonTypesDTO: Decodable {
    let slot: Int
    let type: PokemonTypeDTO
}

struct PokemonTypeDTO: Decodable {
    let name: String
    let url: String
}

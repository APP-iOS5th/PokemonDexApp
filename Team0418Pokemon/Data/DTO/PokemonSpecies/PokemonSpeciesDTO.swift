//
//  PokemonSpeciesDTO.swift
//  Team0418Pokemon
//
//  Created by jinwoong Kim on 4/30/24.
//

import Foundation

struct PokemonSpeciesDTO: Decodable {
    let id: Int
    let name: String
    let genera: [PokemonGenera]
}

struct PokemonGenera: Decodable {
    let genus: String
    let language: Language
}

struct Language: Decodable {
    let name: String
    let url: String
}

//
//  PokemonDetailDTO.swift
//  Team0418Pokemon
//
//  Created by jinwoong Kim on 4/30/24.
//

import Foundation

struct PokemonDetailDTO: Decodable {
    let id: Int
    let name: String
    let sprites: PokemonSprite
    let types: [PokemonTypesDTO]
}

struct PokemonSprite: Decodable {
    let frontDefault: String
    let backDefault: String?
    let frontShiny: String?
    let backShiny: String?
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case backDefault = "back_default"
        case frontShiny = "front_shiny"
        case backShiny = "back_shiny"
    }
}

struct PokemonTypesDTO: Decodable {
    let slot: Int
    let type: PokemonTypeDTO
}

struct PokemonTypeDTO: Decodable {
    let name: String
    let url: String
}

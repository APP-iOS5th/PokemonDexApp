//
//  PokemonSprite.swift
//  Team0418Pokemon
//
//  Created by jinwoong Kim on 5/2/24.
//

import Foundation

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

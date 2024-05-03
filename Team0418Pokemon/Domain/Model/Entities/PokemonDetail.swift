//
//  PokemonDetail.swift
//  Team0418Pokemon
//
//  Created by jinwoong Kim on 4/30/24.
//

import Foundation

struct PokemonDetail: Identifiable {
    let id: Int
    let type: PokemonType
    let name: String
    let imageUrlString: String
    let stat: PokemonStat
    let genus: String
}

struct PokemonStat {
    let hp: Int
    let attack: Int
    let defense: Int
    let specialAttack: Int
    let specialDefense: Int
    let speed: Int
}

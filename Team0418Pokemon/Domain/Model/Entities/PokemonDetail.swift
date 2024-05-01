//
//  PokemonDetail.swift
//  Team0418Pokemon
//
//  Created by jinwoong Kim on 4/30/24.
//

import Foundation

struct PokemonDetail: Identifiable {
    let id: Int
    let type: PokemonType //타입
    let name: String
    let imageUrlString: String
    let stat: PokemonStat//상태
    let genus: String
}

struct PokemonStat {
    let hp: Int
    let attack: Int
    let defense: Int
    let specialAttack: Int
    let specialDefense: Int
    let speed: Int
    
//    func getPokemonState ->  {
//        
//    }
}
struct PokemonStats {
    let hp: String
    let attack: String
    let defense: String
    let specialAttack: String
    let specialDefense: String
    let speed: String
}

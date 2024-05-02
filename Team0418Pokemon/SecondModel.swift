//
//  SecondModel.swift
//  Team0418Pokemon
//
//  Created by 차지용 on 5/2/24.
//

import Foundation

let pkmStats = [
    PokemonStat(hp: 100, attack: 80, defense: 70, specialAttack: 90, specialDefense: 80, speed: 110),
]

func getWidt(for index: Int) ->CGFloat {

    
    switch (index) {
    case 0:
        return CGFloat(pkmStats[0].hp)
    case 1:
        return CGFloat(pkmStats[0].attack)
    case 2:
        return CGFloat(pkmStats[0].defense)
    case 3:
        return CGFloat(pkmStats[0].specialAttack)
    case 4:
        return CGFloat(pkmStats[0].specialDefense)
    case 5:
        return CGFloat(pkmStats[0].speed)
    default :
        return 50
    }
}

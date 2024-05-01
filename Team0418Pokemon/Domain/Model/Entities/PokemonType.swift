//
//  PokemonType.swift
//  Team0418Pokemon
//
//  Created by jinwoong Kim on 4/30/24.
//

import Foundation

enum PokemonType: String, CaseIterable {
    case all = "All"
    case normal = "Normal"
    case fire = "Fire"
    case water = "Water"
    case grass = "Grass"
    case electric = "Electric"
    case ice = "Ice"
    case fighting = "Fighting"
    case poison = "Poison"
    case ground = "Ground"
    case flying = "Flying"
    case psychic = "Psychic"
    case bug = "Bug"
    case rock = "Rock"
    case ghost = "Ghost"
    case dragon = "Dragon"
    case dark = "Dark"
    case steel = "Steel"
    case fairy = "Fairy"
}

 extension PokemonType{
    func DisplayColorName() -> String{
        switch self {
        case .all:
            return "000000"
        case .normal:
            return "808080"
        case .fire:
            return "FF0000"
        case .water:
            return "0000FF"
        case .grass:
            return "008000"
        case .electric:
            return "FFFF00"
        case .ice:
            return "00BFFF"
        case .fighting:
            return "FFA500"
        case .poison:
            return "800080"
        case .ground:
            return "A52A2A"
        case .flying:
            return "87CEEB"
        case .psychic:
            return "800080"
        case .bug:
            return "008000"
        case .rock:
            return "A52A2A"
        case .ghost:
            return "800080"
        case .dragon:
            return "800080"
        case .dark:
            return "000000"
        case .steel:
            return "808080"
        case .fairy:
            return "FFC0CB"
        }
    }
     
     
}



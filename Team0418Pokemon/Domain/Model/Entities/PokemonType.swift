//
//  PokemonType.swift
//  Team0418Pokemon
//
//  Created by jinwoong Kim on 4/30/24.
//

import Foundation

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
     var DisplayColorName : String{
        switch self {
        case .all:
            return "000000"
        case .normal:
            return "808080"
        case .fire:
            return "FF0000"
        case .water:
            return "1e90ff"
        case .grass:
            return "#9acd32"
        case .electric:
            return "ffd700"
        case .ice:
            return "00BFFF"
        case .fighting:
            return "FFA500"
        case .poison:
            return "800080"
        case .ground:
            return "b8860b"
        case .flying:
            return "87CEEB"
        case .psychic:
            return "ff1493"
        case .bug:
            return "bdb76b"
        case .rock:
            return "eee8aa"
        case .ghost:
            return "663399"
        case .dragon:
            return "4169e1"
        case .dark:
            return "000000"
        case .steel:
            return "778899"
        case .fairy:
            return "FFC0CB"
        }
    }
}

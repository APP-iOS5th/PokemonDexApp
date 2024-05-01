//
//  SearchViewModel.swift
//  Team0418Pokemon
//
//  Created by Heeji Jung on 4/30/24.
//

import Foundation

@Observable
final class SearchViewModel {
    
    let pokemonData: [Pokemon] = [
        Pokemon(id: 1, name: "Pikachu", imageUrlString: "bolt.fill"),
        Pokemon(id: 2, name: "Bulbasaur", imageUrlString: "leaf.fill"),
        Pokemon(id: 3, name: "Charmander", imageUrlString: "flame.fill"),
    ]
}

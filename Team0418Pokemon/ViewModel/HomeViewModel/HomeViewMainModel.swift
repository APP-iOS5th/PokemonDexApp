//
//  HomeViewMainModel.swift
//  Team0418Pokemon
//
//  Created by SungWoonLee on 5/1/24.
//

import SwiftUI

@Observable
final class HomeViewModel {
    struct PokemonGenerationRange: Hashable {
        let startNumber: Int
        let endNumber: Int
    }
    struct HomeViewCellModel: Identifiable {
        let id: UUID = UUID()
        let generationRange: PokemonGenerationRange
        let pokemonImageString: String
    }
    
    private let service: HomeUseCase
    private(set) var homeViewCellModels: [HomeViewCellModel] = []
    private let pokemonGenerationRanges = [
        PokemonGenerationRange(startNumber: 1, endNumber: 151),
        PokemonGenerationRange(startNumber: 152, endNumber: 251),
        PokemonGenerationRange(startNumber: 252, endNumber: 386),
        PokemonGenerationRange(startNumber: 387, endNumber: 493),
        PokemonGenerationRange(startNumber: 494, endNumber: 649),
        PokemonGenerationRange(startNumber: 650, endNumber: 721),
        PokemonGenerationRange(startNumber: 722, endNumber: 809),
        PokemonGenerationRange(startNumber: 810, endNumber: 905),
        PokemonGenerationRange(startNumber: 906, endNumber: 1025),
    ]
    
    
    init(service: HomeUseCase) {
        self.service = service
    }
    
    func loadHomeViewCellData() async {
        let pokemons = await service.request()
        homeViewCellModels = zip(pokemons, pokemonGenerationRanges)
            .map { pokemon, generationRange in
                HomeViewCellModel(
                    generationRange: generationRange,
                    pokemonImageString: pokemon.imageUrlString
                )
            }
    }
}

final class FakeNetServ: HomeUseCase {
    func request() async -> [Pokemon] {
        return [  Pokemon(id: 1, name: "0001-0151", imageUrlString: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png"),
                  Pokemon(id: 2, name: "0152-0251", imageUrlString: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png"),
                  Pokemon(id: 3, name: "0252-0386", imageUrlString: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png"),
                  Pokemon(id: 4, name: "0387-0493", imageUrlString: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png"),
                  Pokemon(id: 5, name: "0494-0649", imageUrlString: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/5.png"),
                  Pokemon(id: 6, name: "0650-0721", imageUrlString: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/6.png"),
                  Pokemon(id: 7, name: "0722-0809", imageUrlString: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/7.png"),
                  Pokemon(id: 8, name: "0810-0905", imageUrlString: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/8.png"),
                  Pokemon(id: 9, name: "0906-1025", imageUrlString: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/9.png")
        ]
    }
}

//
//  Team0418PokemonApp.swift
//  Team0418Pokemon
//
//  Created by jinwoong Kim on 4/29/24.
//

import SwiftUI

@main
struct Team0418PokemonApp: App {
    private let homeViewModel: HomeViewModel
    private let pokemonListViewModel: ListViewModel
    private let pokemonDetailViewModel: DetailViewModel
    
    init() {
        let service = PokemonAPIService()
        self.homeViewModel = HomeViewModel(service: service)
        self.pokemonListViewModel = ListViewModel(service: service)
        self.pokemonDetailViewModel = DetailViewModel(service: service)
    }
    
    var body: some Scene {
        WindowGroup {
            TapBarView()
                .environment(homeViewModel)
                .environment(pokemonListViewModel)
                .environment(pokemonDetailViewModel)
        }
    }
}

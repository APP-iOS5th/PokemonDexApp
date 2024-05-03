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
    
    init() {
        let service = PokemonAPIService()
        self.homeViewModel = HomeViewModel(service: service)
    }
    
    var body: some Scene {
        WindowGroup {
            TapBarView()
                .environment(homeViewModel)
        }
    }
}

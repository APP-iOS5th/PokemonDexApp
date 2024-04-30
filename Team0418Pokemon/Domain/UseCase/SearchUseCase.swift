//
//  SearchUseCase.swift
//  Team0418Pokemon
//
//  Created by jinwoong Kim on 4/30/24.
//

import SwiftUI

protocol SearchUseCase {
    func request(
        with pokemonName: String,
        _ pokemonType: PokemonType
    ) -> [Pokemon]
}

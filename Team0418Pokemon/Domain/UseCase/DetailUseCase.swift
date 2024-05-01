//
//  DetailUseCase.swift
//  Team0418Pokemon
//
//  Created by jinwoong Kim on 4/30/24.
//

import Foundation

protocol DetailUseCase {
    func request(with pokemonId: Int) async -> PokemonDetail
}

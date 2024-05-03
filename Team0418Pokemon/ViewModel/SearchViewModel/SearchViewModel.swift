//
//  SearchViewModel.swift
//  Team0418Pokemon
//
//  Created by Heeji Jung on 4/30/24.
//

import SwiftUI

final class FakeSearchService: SearchUseCase {
    
    //테스트
    let pokemonList: [SearchedPokemon] = [
        SearchedPokemon(id: 1, name: "bulbasaur",imageUrlString: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png",type: .grass),
        SearchedPokemon(id: 2, name: "ivysaur", imageUrlString: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png", type: .grass),
        SearchedPokemon(id: 3, name: "vensaur", imageUrlString:"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png", type: .grass),
        SearchedPokemon(id: 4, name: "charmander",  imageUrlString: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png", type: .fire),
       ]
    
    func request(with pokemonName: String, _ pokemonType: PokemonType) async -> [SearchedPokemon] {
        
        return pokemonList
    }
}

@Observable
final class SearchViewModel{
    
    private let searchUseService: SearchUseCase
    // 필터 포켓몬 목록
    private(set) var filteredPokemonList: [SearchedPokemon] = []
    
    private(set) var pokeomn: [SearchedPokemon]?
    
    init(searchUseService:SearchUseCase ) {
        self.searchUseService = searchUseService
        self.pokeomn = []
    }
    
    
    //검색 함수
    func searchPokemon(with inputSearch: String, _ tag: PokemonType) async {
        if inputSearch.isEmpty {
            //filteredPokemonList = pokeomn
        } else {
            
            /// This code does not nessesary, since request method of the service sends to you
            /// `SearchedPokemon` type data already.
//            let pokemonlist = await searchUseService.request(with: inputSearch.lowercased(), isSelectedTag ?? .all)
//            let searchedPokemons = pokemonlist.map { pokemon in
//                return SearchedPokemon(id: pokemon.id, name: pokemon.name, imageUrlString: pokemon.imageUrlString, type: pokemon.type)
//                
//            }
//            DispatchQueue.main.async{
//                self.filteredPokemonList = searchedPokemons
//            }
            
            filteredPokemonList = await searchUseService.request(with: inputSearch.lowercased(), tag)
            print("return: \(filteredPokemonList)")
        }
    }
}

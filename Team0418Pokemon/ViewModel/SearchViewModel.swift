//
//  SearchViewModel.swift
//  Team0418Pokemon
//
//  Created by Heeji Jung on 4/30/24.
//

import Foundation

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


class SearchViewModel: ObservableObject{
    
    private let searchUseService: SearchUseCase
    //검색어
    @Published var inputSearch = ""
    //선택 타입 태그
    @Published  var isSelectedTag: PokemonType? = .all
    // 필터 포켓몬 목록
    @Published  var filteredPokemonList: [SearchedPokemon] = []
    
    private(set) var pokeomn: [SearchedPokemon]?
    
    init(searchUseService:SearchUseCase ) {
        self.searchUseService = searchUseService
        self.pokeomn = []
    }
    
    
    //검색 함수
    func searchPokemon() async {
        if inputSearch.isEmpty {
            //filteredPokemonList = pokeomn
        } else {
            
            let pokemonlist = await searchUseService.request(with: inputSearch.lowercased(), isSelectedTag ?? .all)
            let searchedPokemons = pokemonlist.map { pokemon in
                return SearchedPokemon(id: pokemon.id, name: pokemon.name, imageUrlString: pokemon.imageUrlString, type: pokemon.type)
                
            }
            DispatchQueue.main.async{
                self.filteredPokemonList = searchedPokemons
            }
        }
    }
    
    
    //버튼 클릭 이벤트
    func selectBtnClick(_ selctag: PokemonType)
    {
        inputSearch = selctag.rawValue
        
    }
    
}

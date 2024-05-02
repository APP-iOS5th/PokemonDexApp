//
//  SearchViewModel.swift
//  Team0418Pokemon
//
//  Created by Heeji Jung on 4/30/24.
//

import Foundation

final class FakeSearchService: SearchUseCase {
    
    //테스트
    let pokemonList: [Pokemon] = [
           Pokemon(id: 1, name: "Bulbasaur", imageUrlString: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png"),
           Pokemon(id: 2, name: "ivysaur", imageUrlString: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png"),
           Pokemon(id: 3, name: "vensaur", imageUrlString:"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png"),
           Pokemon(id: 4, name: "charmander", imageUrlString: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png"),
       ]
    
    func request(with pokemonName: String, _ pokemonType: PokemonType) async -> [Pokemon] {
        
        return pokemonList
    }
    /Users/heejijung/workspace/Pr_pokemon_0418/PokemonDexApp/Team0418Pokemon/Domain/Model/Entities/Pokemon.swift
    func retrieveType(of pokemon: Pokemon) async -> PokemonType {
        // 구현
        return .all
    }
}

                                
class SearchViewModel: ObservableObject{
    
    private let searchUseService: SearchUseCase
    //검색어
    @Published var inputSearch = ""
    //선택 타입 태그
    private(set)  var isSelectedTag: PokemonType? = nil
    // 필터 포켓몬 목록
    private(set)  var filteredPokemonList: [Pokemon] = []
    
    private(set) var pokeomn: [Pokemon]?
    
    init(searchUseService:SearchUseCase ) {
        self.searchUseService = searchUseService
    }

    
    //검색 함수
    func searchPokemon() {
        if inputSearch.isEmpty {
            //filteredPokemonList = pokemonList
        } else {
            
            let pokemonList = await searchUseService.request(with: inputSearch.lowercased(), PokemonType: isSelectedTag ?? nil)
            filteredPokemonList = pokemonList.filter { $0.name.lowercased().contains(inputSearch.lowercased()) }
        }
    }
    
    
    //버튼 클릭 이벤트
    func selectBtnClick(_ selctag: PokemonType)
    {
        //inputSearch = selctag.rawValue

    }
    
}

//
//  SearchViewModel.swift
//  Team0418Pokemon
//
//  Created by Heeji Jung on 4/30/24.
//

import Foundation

class SearchViewModel: ObservableObject{
    
    //테스트
    let pokemonList: [Pokemon] = [
           Pokemon(id: 1, name: "Pikachu", imageUrlString: "bolt.fill"),
           Pokemon(id: 2, name: "Bulbasaur", imageUrlString: "leaf.fill"),
           Pokemon(id: 3, name: "Charmander", imageUrlString: "flame.fill"),
       ]
    
    //검색어
    @Published var inputSearch = ""
    //선택 타입 태그
    @Published  var isSelectedTag: PokemonType? = nil
    // 필터 포켓몬 목록
    @Published var filteredPokemonList: [Pokemon] = []
    
    init() {
        filteredPokemonList = pokemonList
        }
    
    //검색 함수
    func search() {
        if inputSearch.isEmpty {
            //filteredPokemonList = pokemonList
        } else {
            filteredPokemonList = pokemonList.filter { $0.name.lowercased().contains(inputSearch.lowercased()) }
        }
    }
    
    
    //버튼 클릭 이벤트
    func selectBtnClick(_ selctag: PokemonType)
    {
        inputSearch = selctag.rawValue

    }
    
}

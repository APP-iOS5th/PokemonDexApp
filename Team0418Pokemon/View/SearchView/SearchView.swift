//
//  SearchView.swift
//  Team0418Pokemon
//
//  Created by Heeji Jung on 4/30/24.
//

import SwiftUI

struct SearchView: View {
    @Environment(SearchViewModel.self) private var searchVM
    @State private var inputString: String = ""
    @State private var selectedTag: PokemonType = .all

    var body: some View {
        NavigationView {
            VStack{
                FilterTagsView(selectedTag: $selectedTag)
                SearchListView(searchedPokemons: searchVM.filteredPokemonList)
            }
            .navigationBarTitle("Who's that pokemon?")
            .searchable(text: $inputString, placement: .navigationBarDrawer, prompt: "Find a Pokemon")
            .onSubmit(of: .search) {
                Task {
                    await searchVM.searchPokemon(with: inputString, selectedTag)
                }
            }
        }
    }
}

#Preview {
    SearchView()
        .environment(SearchViewModel(searchUseService: FakeSearchService()))
}

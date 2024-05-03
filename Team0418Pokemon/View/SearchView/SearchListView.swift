//
//  SearchListView.swift
//  Team0418Pokemon
//
//  Created by Heeji Jung on 5/3/24.
//

import SwiftUI

struct SearchListView: View {
   
    @EnvironmentObject var searchVM: SearchViewModel
    
    var body: some View {
        ScrollView(.vertical) {
            VStack() {
                ForEach(searchVM.filteredPokemonList,  id: \.id){ pokemons in
                    NavigationLink{
                        Text("\(pokemons.id)\(pokemons.name)")
                    } label: {
                        SearchListRowView(pokemon: pokemons)
                    }
                }
            }
        }
    }
}

//#Preview {
//    SearchListView()
//}

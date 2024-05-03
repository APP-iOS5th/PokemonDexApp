//
//  SearchView.swift
//  Team0418Pokemon
//
//  Created by Heeji Jung on 4/30/24.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject var searchVM: SearchViewModel = .init(searchUseService: FakeSearchService())

    var body: some View {
        NavigationView {
            VStack{
                FilterTagsView()
                    .environmentObject(searchVM)
                SearchListView()
                    .environmentObject(searchVM)
            }
            .navigationBarTitle("Who's that pokemon?")
            .searchable(text: $searchVM.inputSearch, placement: .navigationBarDrawer, prompt: "Find a Pokemon")
            .onSubmit(of: .search) {
                Task {
                    await searchVM.searchPokemon()
                }
            }
        }
    }
}

#Preview {
    SearchView()
}

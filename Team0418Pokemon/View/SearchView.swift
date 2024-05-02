//
//  SearchView.swift
//  Team0418Pokemon
//
//  Created by Heeji Jung on 4/30/24.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject private var searchVM = SearchViewModel(searchUseService: FakeSearchService())
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(PokemonType.allCases, id: \.self) { tag in
                            Button(action:{
                                
                                searchVM.selectBtnClick(tag)
                                
                            }) {
                                Text(tag.rawValue)
                                    .font(.caption)
                                    .foregroundStyle(Color.white)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 5)
                                    .frame(width:60)
                                    .background {
                                        Capsule()
                                            .fill(Color.stringToColor(tag.DisplayColorName))
                                    }
                            }
                        }
                    }
                }
                
                ScrollView(.vertical) {
                    VStack() {
                        ForEach(searchVM.filteredPokemonList,  id: \.id){ pokemons in
                            HStack(spacing: 5){
                                VStack(alignment: .leading, spacing: 5){
                                    HStack{
                                        //이름
                                        Text("#\(String(pokemons.id))")
                                            .font(.title3.bold())
                                            .foregroundStyle(Color.white)
                                            .frame(width:80)
                                            .background{
                                                Capsule()
                                                    .fill(Color.black)
                                            }
                                        //타입
                                        Text("\(pokemons.type)")
                                            .font(.caption)
                                            .foregroundStyle(Color.white)
                                            .frame(width:50)
                                            .background{
                                                Capsule()
                                                    .fill(Color.stringToColor(pokemons.type.DisplayColorName))
                                            }
                                    }
                                    //이름
                                    Text(pokemons.name)
                                        .font(.system(size: 25))
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                }
                                Spacer()
                                AsyncImage(url: URL(string: pokemons.imageUrlString)) { image in
                                    image.resizable()
                                }placeholder: {
                                    ZStack{
                                        Circle()
                                            .foregroundColor(Color.stringToColor(pokemons.type.DisplayColorName))
                                            .blur(radius: 4)
                                            .scaleEffect(y:0.15,anchor: .bottom)
                                            .scaleEffect(x:1.2, anchor: .bottom)
                                        ProgressView()
                                    }
                                }
                                .frame(width: 120, height: 90)
                                
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Who's that pokemon?")
            .searchable(text: $searchVM.inputSearch,placement: .navigationBarDrawer,prompt: "Find a Pokemon")
            .onSubmit(of: .search) {
                Task{
                    await searchVM.searchPokemon()
                }
            }
        }
    }
    
}




#Preview {
    SearchView()
}

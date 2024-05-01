//
//  SearchView.swift
//  Team0418Pokemon
//
//  Created by Heeji Jung on 4/30/24.
//

import SwiftUI

struct SearchView: View {
    
    let pokemonList: [Pokemon] = [
           Pokemon(id: 1, name: "Pikachu", imageUrlString: "bolt.fill"),
           Pokemon(id: 2, name: "Bulbasaur", imageUrlString: "leaf.fill"),
           Pokemon(id: 3, name: "Charmander", imageUrlString: "flame.fill"),
           // 필요한 만큼 추가할 수 있습니다.
       ]
    
    
    @State private var inputSearch = ""
    @State private var  isSelectedTag: PokemonType? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(PokemonType.allCases, id: \.self) { tag in
                            Button(action:{
                                selectBtnClick(tag)
                            }) {
                                Text(tag.rawValue)
                                    .font(.caption)
                                    .foregroundStyle(Color.white)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 5)
                                    .frame(width:60)
                                    .background {
                                        Capsule()
                                            .fill(Color.black)
                                    }
                            }
                        }
                    }
                }
                
                ScrollView(.vertical) {
                    VStack {
                        ForEach(pokemonList){ pokemons in
                            //PokemonSearchRow(pokemons: pokemons)
                        }
                    }
                }
            }
            .navigationBarTitle("Who's that pokemon?")
            .searchable(
                text: $inputSearch,placement: .navigationBarDrawer,prompt: "Find a Pokemon")
            //.onChange(of: inputSearch){ newInputSearch in
            //    searchvm.search(with: newInputSearch )
            //}
            .onAppear(){
            //    searchvm.search()
            }
        }
    }
    
    
    //버튼 클릭 이벤트
    func selectBtnClick(_ selctag: PokemonType)
    {
        //inputsearch = selctag.rawValue
    }
}
    
struct PokemonSearchRow: View{
    
    var body: some View{
        HStack{
            
        }
    }
}



#Preview {
    SearchView()
}

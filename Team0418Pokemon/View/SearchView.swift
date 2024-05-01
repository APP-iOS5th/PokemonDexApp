//
//  SearchView.swift
//  Team0418Pokemon
//
//  Created by Heeji Jung on 4/30/24.
//

import SwiftUI

struct SearchView: View {
    
    //테스트용
    let pokemonList: [Pokemon] = [
           Pokemon(id: 1, name: "Pikachu", imageUrlString: "bolt.fill"),
           Pokemon(id: 2, name: "Bulbasaur", imageUrlString: "leaf.fill"),
           Pokemon(id: 3, name: "Charmander", imageUrlString: "flame.fill"),
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
                    VStack() {
                        ForEach(pokemonList,  id: \.id){ pokemons in
                            HStack(spacing: 5){
                                
                                VStack(alignment: .leading, spacing: 5){
                                    //이름
                                    Text("#\(String(pokemons.id))")
                                        .font(.title3.bold())
                                        .foregroundStyle(Color.white)
                                        .frame(width:80)
                                        .background{
                                            Capsule()
                                                .fill(Color.black)
                                        }
                                    //이름
                                    Text(pokemons.name)
                                        .font(.system(size: 25))
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    
                                    //타입
                                    //ForEach()
                                }
                                Spacer()
                                AsyncImage(url: URL(string: pokemons.imageUrlString)) { image in
                                    image.resizable()
                                }placeholder: {
                                    ZStack{
                                        Circle()
                                            .foregroundColor(Color.black)
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
            .searchable(
                text: $inputSearch,placement: .navigationBarDrawer,prompt: "Find a Pokemon")
            .onAppear(){
            }
        }
    }
    
    
    //버튼 클릭 이벤트
    func selectBtnClick(_ selctag: PokemonType)
    {
        
            inputSearch = selctag.rawValue
    }
}
    



#Preview {
    SearchView()
}

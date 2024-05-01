//
//  SearchView.swift
//  Team0418Pokemon
//
//  Created by Heeji Jung on 4/30/24.
//

import SwiftUI

struct SearchView: View {
    
    //@StateObject var vm = SearchViewModel()
    
    @State private var InputSearch = ""
    @State private var SelectTag: PokemonType = .All
    
    var body: some View {
        VStack{
            
            //포켓몬 타입
            NavigationStack{
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 10){
                        ForEach(PokemonType.allCases, id: \.self) { tag in
                            Button(action:{
                                
                            }){
                                Text(tag.rawValue)
                                    .font(.caption)
                                    .foregroundStyle(Color.white)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 5)
                                    .frame(width:60)
                                    .background(){
                                        if SelectTag == tag{
                                            Capsule()
                                                .fill(Color.primary)
                                        }else{
                                            Capsule()
                                                .fill(Color.black)
                                        }
                                        
                                    }
                            }
                        }
                    }
                }
                
                
                //포켓몬 검색목록
                ScrollView(.vertical){
                    Text("꼬부기")
//                    List(Pokemon, id: \.ID) { Pokemons in
//                        Text("")
//                    }
                    //foreach
                    //NavigationLink
                }
            }
            .searchable(
                text: $InputSearch,
                placement: .navigationBarDrawer,
                prompt: "Find a Pokemon")
            
            
            
            
            
            
            
         
           
        }
        
        
        
        
        
//        ScrollView{
//            NavigationStack{
//                LazyVStack(spacing: 10){
//                    
//                    Text("123")
//                    Text("123")
//                    Text("123")
//                    Text("123")
//                    
//                    
//                }
//            }
//        } .searchable(text: $InputSearch, prompt: "Find a person")
//        
//        Label {
//            Text("Fire")
//                .font(.caption)
//                .foregroundColor(.white)
//        } icon: {
//            RoundedRectangle(cornerRadius: 8)
//                .fill(Color.red)
//                .frame(width: 70,height: 30)
//        }
//        
        
    }
}

#Preview {
    SearchView()
}

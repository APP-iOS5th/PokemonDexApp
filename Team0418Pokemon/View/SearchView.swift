//
//  SearchView.swift
//  Team0418Pokemon
//
//  Created by Heeji Jung on 4/30/24.
//

import SwiftUI

struct SearchView: View {

    @State private var inputsearch = ""
    @State private var selectTag: PokemonType = .all
    
    var body: some View {
        VStack{
            
            //포켓몬 타입
            NavigationStack{
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 10){
                        ForEach(PokemonType.allCases, id: \.self) { tag in
                            Button(action:{
                                
                                selectBtnClick(tag)
                            }){
                                Text(tag.rawValue)
                                    .font(.caption)
                                    .foregroundStyle(Color.white)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 5)
                                    .frame(width:60)
                                    .background{
                                        Capsule()
                                            .fill(Color.black)
                                            //.fill(Color(tag.DisplayColorName()))
                                    }
                                //{
                                        //if selectTag == tag{
                                            //Capsule()
                                                //.fill(Color(tag.DisplayColor()))
                                        //}else{
                                            //Capsule()
                                               // .fill(Color(tag.DisplayColor()))
                                            
                                        //}
                                        
                                    //}
                            }
                        }
                    }
                }
                
                
                //포켓몬 검색목록
                ScrollView(.vertical){
                    List{
                        Text("test")
                        //ForEach (pokemons, id: \.id) { pokemon in
                            //Text("\(pokemon.name)")
                            //NavigationLink(destination:)){
                                
                            //}
                        }
                    }
                }
            }
            .searchable(
                text: $inputsearch,
                placement: .navigationBarDrawer,
                prompt: "Find a Pokemon")
            
        }
    }
    
    //버튼 클릭 이벤트
    func selectBtnClick(_ selctag: PokemonType)
    {
        //inputsearch = selctag.rawValue
//        switch selctag {
//          case .all:
//              inputsearch = selctag.rawValue
//          case .normal:
//              inputsearch = selctag.rawValue
//          case .fire:
//              inputsearch = selctag.rawValue
//        default:
//            break
//        }
//    }
}

#Preview {
    SearchView()
}

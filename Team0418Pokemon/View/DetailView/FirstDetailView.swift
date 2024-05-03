//
//  FirstDetailView.swift
//  Team0418Pokemon
//
//  Created by 차지용 on 5/1/24.
//first

import SwiftUI

struct FirstDetailView: View {
    let pokemonDetail: PokemonDetail
    
    var body: some View {
        VStack{
            ZStack{
                VStack{
                    HStack{
                        ZStack{
                            Capsule() //타원
                                .fill(Color.black)
                                .frame(width:90, height: 30)
                            if(pokemonDetail.id != 0) {
                                Text("No.\(pokemonDetail.id)")
                                    .foregroundStyle(.white)
                                    .font(.footnote)
                            }
                            else {
                                Text("Number Error")
                            }
                            
                        }
                        ZStack {
                            Capsule() //타원
                                .fill(Color(Color(hex: pokemonDetail.type.DisplayColorName)))
                                .frame(width:90, height: 30)
                            if(pokemonDetail.id != 0 ){
                                Text(pokemonDetail.type.rawValue).foregroundStyle(.white)
                            }
                        }
                    }
                    if(pokemonDetail.id != 0){
                        Text(pokemonDetail.name)
                            .font(.largeTitle)
                    }
                    if(pokemonDetail.id != 0){
                        Text(pokemonDetail.genus)
                            .font(.footnote)
                    }
                    
                }
                
            }
            
        }
    }
}

#Preview {
    FirstDetailView(
        pokemonDetail: DetailMockService().pomkomData
    )
}

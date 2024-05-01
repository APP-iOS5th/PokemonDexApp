//
//  SecondView.swift
//  Team0418Pokemon
//
//  Created by 차지용 on 5/1/24.
//

import SwiftUI

struct SecondView: View {
    let pkmStats = [
        PokemonStats(hp: "100", attack: "80", defense: "70", specialAttack: "90", specialDefense: "80", speed: "110"),
    ]
    let gridItem:[GridItem] = [
        GridItem(.flexible(minimum:30, maximum:300)),
        GridItem(.flexible(minimum:30, maximum:300))
    ]
    var body: some View {
        LazyVGrid(columns: gridItem) {
            ForEach(0..<pkmStats.count, id: \.self) { i in
                HStack{
                    VStack(alignment:.trailing) {
                        Text("HP: ")
                        Text("Attack: ")
                        Text("Defense: ")
                        Text("Special-Attack: ").lineLimit(nil)
                        Text("Special-Defense:")
                        Text("Speed:")
                    }
                    Spacer()
                    Spacer()
                    Spacer()
                    VStack{
                        ForEach(0..<6) { _ in
                            ZStack(alignment: .leading){
                                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                    .frame(width: 100)
                                    .foregroundColor(Color.blue)
                                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                    .frame(width:30)
                                    .foregroundColor(Color.red)
                                Text("상태")
                                    .font(.subheadline)
                                    
                            }
                        }
                    }
                }
            }
        }
        
    }
}

#Preview {
    SecondView()
}

//
//  SecondView.swift
//  Team0418Pokemon
//
//  Created by 차지용 on 5/1/24.
//

import SwiftUI

struct SecondView: View {
    let pkmStats = [
        PokemonStat(hp: 100, attack: 80, defense: 70, specialAttack: 90, specialDefense: 80, speed: 110),
    ]
    let gridItem:[GridItem] = [
        GridItem(.flexible(minimum:30, maximum:300)),
        GridItem(.flexible(minimum:30, maximum:300))
    ]
    var body: some View {
        LazyVGrid(columns: gridItem) {
            
            HStack(alignment: .center){
                VStack(alignment:.trailing) {
                    Text("HP:")
                    Text("Attack: ")
                    Text("Defense: ")
                    Text("Special-Attack: ")
                    Text("Special-Defense:")
                    Text("Speed:")
                }
                .padding(.trailing, 15)
                VStack{
                    ForEach(0..<6) { index in
                        ZStack(alignment: .center){
                            ZStack(alignment: .leading){
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 100)
                                    .foregroundColor(Color.blue)
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: getWidt(for: index))
                                    .foregroundColor(Color.red)
                                    switch (index) {
                                    case 0:
                                        Text("\(pkmStats[0].hp)")
                                    case 1:
                                        Text("\(pkmStats[0].attack)")
                                    case 2:
                                        Text("\(pkmStats[0].defense)")
                                    case 3:
                                        Text("\(pkmStats[0].specialAttack)")
                                    case 4:
                                        Text("\(pkmStats[0].specialDefense)")
                                    case 5:
                                        Text("\(pkmStats[0].speed)")
                                    default :
                                        Text("error")
                                    }
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

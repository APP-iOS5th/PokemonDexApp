//
//  SecondView.swift
//  Team0418Pokemon
//
//  Created by 차지용 on 5/1/24.
//

import SwiftUI

struct SecondView: View {
    @StateObject private var detailModel = DetailModel(service: MockService())
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
                                        Text("\(detailModel.pokeDtail.stat.hp)")
                                    case 1:
                                        Text("\(detailModel.pokeDtail.stat.attack)")
                                    case 2:
                                        Text("\(detailModel.pokeDtail.stat.defense)")
                                    case 3:
                                        Text("\(detailModel.pokeDtail.stat.specialAttack)")
                                    case 4:
                                        Text("\(detailModel.pokeDtail.stat.specialDefense)")
                                    case 5:
                                        Text("\(detailModel.pokeDtail.stat.speed)")
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

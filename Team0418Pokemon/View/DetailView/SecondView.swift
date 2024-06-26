//
//  SecondView.swift
//  Team0418Pokemon
//
//  Created by 차지용 on 5/1/24.
//

import SwiftUI

struct SecondView: View {
    @State private var detailModel = DetailViewModel(service: DetailMockService())
    let gridItem:[GridItem] = [
        GridItem(.flexible(minimum:30, maximum:400))
    ]
    var body: some View {
        LazyVGrid(columns: gridItem) {
            HStack{
                VStack(spacing: 10) {
                    Text("HP:")
                        .bold()
                    Text("Attack: ")
                        .bold()
                    Text("Defense: ")
                        .bold()
                    Text("Special-Attack: ")
                        .bold()
                    Text("Special-Defense:")
                        .bold()
                    Text("Speed:")
                        .bold()
                }
                Spacer()
                VStack{
                    ForEach(0..<6) { index in
                        ZStack{
                            ZStack(alignment: .leading){
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 170)
                                    .foregroundColor(Color.yellow)
                                    .opacity(0.3)
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: getWidt(for: index))
                                    .foregroundColor(Color.yellow)
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

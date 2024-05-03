//
//  SearchListRowView.swift
//  Team0418Pokemon
//
//  Created by Heeji Jung on 5/3/24.
//

import SwiftUI

struct SearchListRowView: View {
    
    let pokemon: SearchedPokemon
    
    var body: some View {
        HStack(spacing: 5){
            VStack(alignment: .leading, spacing: 5){
                HStack{
                    //이름
                    Text("#\(String(pokemon.id))")
                        .font(.title3.bold())
                        .foregroundStyle(Color.white)
                        .frame(width:80)
                        .background{
                            Capsule()
                                .fill(Color.black)
                        }
                    //타입
                    Text("\(pokemon.type)")
                        .font(.caption)
                        .foregroundStyle(Color.white)
                        .frame(width:50)
                        .background{
                            Capsule()
                                .fill(Color.stringToColor(pokemon.type.DisplayColorName))
                        }
                }
                //이름
                Text(pokemon.name)
                    .font(.system(size: 25))
                    .fontWeight(.bold)
            }
            Spacer()
            
            AsyncImage(url: URL(string: pokemon.imageUrlString)) { image in
                ZStack{
                    image.resizable()
                    Circle()
                        .foregroundColor(Color.stringToColor(pokemon.type.DisplayColorName))
                        .blur(radius: 4)
                        .scaleEffect(y:0.15,anchor: .bottom)
                        .scaleEffect(x:1.2, anchor: .bottom)
                }
            }placeholder: {
                ZStack{
                    ProgressView()
                }
            }
            .frame(width: 120, height: 90)
        }
    }
}

//#Preview {
//   // SearchListRowView()
//}

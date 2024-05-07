//
//  PkmImgView.swift
//  Team0418Pokemon
//
//  Created by 차지용 on 5/1/24.
//

import SwiftUI

struct PkmImgView: View {
    let pokemonDetail: PokemonDetail
    
    var body: some View {
        VStack {
            if(pokemonDetail.imageUrlString.isEmpty){
                Image(systemName: "questionmark.bubble.fill") //포켓몬 이미지 이미지가 없을 경우
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.red)
                    .clipShape(Circle())//원으로 바꿔줌
                    .frame(width: 200, height: 200)
                    .padding(50)
            } else {
                AsyncImage(url: URL(string: pokemonDetail.imageUrlString)) { jpgimg in //포켓몬 이미지
                    switch jpgimg {
                    case .empty:
                        Text("Empty")
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundStyle(.red)
                            .clipShape(Circle())//원으로 바꿔줌
                            .frame(width: 300, height: 300)
                            .padding(50)
                    case .failure(_):
                        Image(systemName: "questionmark.bubble") //포켓몬 이미지 이미지가 없을 경우
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundStyle(.red)
                            .clipShape(Circle())//원으로 바꿔줌
                            .frame(width: 300, height: 300)
                            .padding(50)
                    @unknown default:
                        fatalError()
                    }
                }
            }
        }
    }
    
}

#Preview {
    PkmImgView(
        pokemonDetail: DetailMockService().pomkomData
    )
}

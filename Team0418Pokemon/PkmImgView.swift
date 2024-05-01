//
//  PkmImgView.swift
//  Team0418Pokemon
//
//  Created by 차지용 on 5/1/24.
//

import SwiftUI

struct PkmImgView: View {
    @State private var imageUrlString = ""//이미지 불러올 변수
    var body: some View {
        VStack {
            if(imageUrlString.isEmpty){
                Image(systemName: "questionmark.bubble.fill") //포켓몬 이미지 이미지가 없을 경우
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.red)
                    .clipShape(Circle())//원으로 바꿔줌
                    .frame(width: 200, height: 200)
                    .padding(50)
            } else {
                Image(imageUrlString) //포켓몬 이미지
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())//원으로 바꿔줌
                    .padding(40)
            }
            }
        }

}

#Preview {
    PkmImgView()
}

//
//  PkmImgView.swift
//  Team0418Pokemon
//
//  Created by 차지용 on 5/1/24.
//

import SwiftUI

struct PkmImgView: View {
    //    @State private var poketmonImg = UIImage? //이미지 불러올 변수
    var body: some View {
        VStack {
            Image(systemName: "checkmark.square.fill") //포켓몬 이미지
                .resizable()
                .clipShape(Circle())//원으로 바꿔줌
                .padding(40)
        }

    }
}

#Preview {
    PkmImgView()
}

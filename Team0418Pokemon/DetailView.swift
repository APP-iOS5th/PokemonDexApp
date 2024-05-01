//
//  DetailView.swift
//  Team0418Pokemon
//
//  Created by 차지용 on 4/30/24.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        ZStack{
            Image("detailBg")
                .resizable()
                .edgesIgnoringSafeArea(.all)//Safe Area를 무시하고 이미지 전체를 화면에 채움
            ScrollView {
                PkmImgView()
                GeometryReader { geometry in
                    RoundedRectangle(cornerRadius:25)
                        .fill(Color.white)
                        .frame(height: 800)
                }
                FirstDetailView()
                    .padding(10)
                Divider()
                SecondView()
            }
        }
    }
}

#Preview {
    DetailView()
}

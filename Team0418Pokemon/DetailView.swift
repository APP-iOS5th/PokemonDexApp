//
//  DetailView.swift
//  Team0418Pokemon
//
//  Created by 차지용 on 4/30/24.
//

import SwiftUI

struct DetailView: View {
//    @State private var poketmonImg = UIImage?
    var body: some View {
        ZStack{
            Image("detailBg")
                .resizable()
                .edgesIgnoringSafeArea(.all)//Safe Area를 무시하고 이미지 전체를 화면에 채움
            ScrollView {
                VStack {
                    Image(systemName: "checkmark.square.fill") //포켓몬 이미지
                        .resizable()
                        .clipShape(Circle())//원으로 바꿔줌
                        .padding(40)
                }
                VStack{
                    ZStack{
                        GeometryReader { geometry in
                            RoundedRectangle(cornerRadius:25)
                                .fill(Color.white)
                                .frame(height: 800)
                        }
                        HStack{
                            ZStack{
                                Capsule() //타원
                                    .fill(Color.black)
                                    .frame(width:90, height: 30)
                                Text("No.number")
                                    .foregroundStyle(.white)
                            }
                            ZStack {
                                Capsule() //타원
                                    .fill(Color.black)
                                    .frame(width:90, height: 30)
                                Text("Fire")
                                    .foregroundStyle(.white)
                            }
                        }.padding(25)
                    }
                    Text("포켓몬이름")
                }.padding(25)
                Text("속성")
            }
        }
    }
    //서버에서 포켓몬 이미지를 불러옴
//    func pokemonImage() -> {
//        
//    }
}

#Preview {
    DetailView()
}

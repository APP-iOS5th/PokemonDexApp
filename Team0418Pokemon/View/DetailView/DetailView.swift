//
//  DetailView.swift
//  Team0418Pokemon
//
//  Created by 차지용 on 4/30/24.
//
//초기화
import SwiftUI

struct DetailView: View {
    @Environment(DetailViewModel.self) private var viewModel
    let pokemonId: Int
    
    var body: some View {
        ZStack{
            Image("detailBg")
                .resizable()
                .edgesIgnoringSafeArea(.all)//Safe Area를 무시하고 이미지 전체를 화면에 채움
            ScrollView {
                PkmImgView(pokemonDetail: viewModel.pokeDtail)
                    .frame(width: 200,height: 200)
                GeometryReader { geometry in
                    RoundedRectangle(cornerRadius:25)
                        .fill(Color.white)
                        .frame(height: 900)
                }
                FirstDetailView(pokemonDetail: viewModel.pokeDtail)
                    .padding(10)
                Divider()
                VStack(alignment: .leading) {
                    Text("Basic Status")
                        .font(.title)
                    SecondView()
                }
            }
        }
        .task {
            await viewModel.loadDetail(with: pokemonId)
        }
    }
}

#Preview {
    DetailView(
        pokemonId: 1
    )
    .environment(DetailViewModel(service: DetailMockService()))
}

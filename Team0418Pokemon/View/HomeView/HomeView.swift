//
//  HomeView.swift
//  Team0418Pokemon
//
//  Created by SungWoonLee on 4/30/24.
//

import SwiftUI

struct CustomButton: View {
    let cellModels: [HomeViewModel.HomeViewCellModel]
    let columns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 3)
    
    var body: some View {
        ZStack{
            Color.red.opacity(0.9).edgesIgnoringSafeArea(.all)
            
            Rectangle()
                .frame(height: 480)
                .frame(maxWidth: 360)
                .background(Color.black.opacity(0.8))
                .cornerRadius(20)
            
            LazyVGrid(columns: columns, spacing: 25) {
                ForEach(cellModels) { cellModel in
                    ZStack {
                        NavigationLink {
                            ListView(
                                min: cellModel.generationRange.startNumber - 1,
                                max: cellModel.generationRange.endNumber - 1
                            )
                        } label: {
                            VStack {
                                AsyncImage(url: URL(string: cellModel.pokemonImageString)) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(height: 90)
                                .frame(maxWidth: 90)
                                .background(.white.opacity(0.8))
                                .cornerRadius(30)
                                Text("\(cellModel.generationRange.startNumber) - \(cellModel.generationRange.endNumber)")
                                    .font(.system(size: 14))
                                    .bold()
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 40)
        }
    }
}

struct HomeView: View {
    @Environment(HomeViewModel.self) private var viewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.red.opacity(0.9).edgesIgnoringSafeArea(.all)
                ZStack{
                    Rectangle()
                        .frame(height: 550)
                        .frame(maxWidth: 370)
                        .background(.white.opacity(0.4))
                        .cornerRadius(30)
                    VStack {
                        CustomButton(cellModels: viewModel.homeViewCellModels)
                    }}
                .navigationBarTitle("Pokédex", displayMode: .inline)
            }
        }
        .task {
            await viewModel.loadHomeViewCellData()
        }
    }
}

#Preview {
    HomeView()
        .environment(HomeViewModel(service: FakeNetServ()))
}

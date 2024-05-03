//
//  HomeViewMain.swift
//  Team0418Pokemon
//
//  Created by SungWoonLee on 4/30/24.
//

import SwiftUI


struct CustomButton: View {
    @State var netServ = FakeNetServ()
    @State private var pokemons: [Pokemon] = []
    @State private var isNavigate = false
    
    let columns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 3)
    
    var body: some View {
        NavigationView {
            ZStack{
                Color.red.opacity(0.9).edgesIgnoringSafeArea(.all)
                
                Rectangle()
                    .frame(height: 480)
                    .frame(maxWidth: 360)
                    .background(Color.black.opacity(0.8))
                    .cornerRadius(20)
                
                LazyVGrid(columns: columns, spacing: 25) {
                    ForEach(pokemons) { pokemon in
                        ZStack {
                            Button(action: {
                                self.isNavigate = true
                            }) { VStack(spacing: 3) { AsyncImage(url: URL(string: pokemon.imageUrlString)) { image in image.resizable() } placeholder: {ProgressView()}
                                    .frame(height: 90)
                                    .frame(maxWidth: 90)
                                    .background(.white.opacity(0.8))
                                    .cornerRadius(30)
                                Text(buttonTapped(pokemon.id))
                                    .font(.system(size: 14))
                                    .bold()
                                    .foregroundColor(.white)
                                NavigationLink(ListView(), isActive: $isNavigate) {}
                            }
                            }
                        }
                    }
                }.task {pokemons = await netServ.request()}
                    .padding(.horizontal, 40)
                
            }
        }
    }
}

struct HomeViewMain: View {
    
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
                        CustomButton()
                    }}
                .navigationBarTitle("Pokédex", displayMode: .inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        CustomToolbar()
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        CustomToolbar2()
                    }
                }
            }
        }
    }
}

#Preview {
    HomeViewMain()
}

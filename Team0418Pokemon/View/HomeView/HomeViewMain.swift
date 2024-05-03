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
//    @State private var isNavigate = false
    @State private var selectedDestination: Destination?

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
                                self.selectedDestination = Destination(rawValue:pokemon.id)
//                                self.isNavigate = true
                            }) { VStack(spacing: 3) { AsyncImage(url: URL(string: pokemon.imageUrlString)) { image in image.resizable() } placeholder: {ProgressView()}
                                    .frame(height: 90)
                                    .frame(maxWidth: 90)
                                    .background(.white.opacity(0.8))
                                    .cornerRadius(30)
                                Text(buttonTapped(pokemon.id))
                                    .font(.system(size: 14))
                                    .bold()
                                    .foregroundColor(.white)
                                NavigationLink(ListView(viewModel: ListViewModel(limit: 151, offset: 0), startFrom: 0)), tag: Destination(rawValue: pokemon.id) ?? .destination1, selection: 1) { EmptyView() }
                                NavigationLink(ListView(viewModel: ListViewModel(limit: 100, offset: 151), startFrom: 151)), tag: Destination(rawValue: pokemon.id) ?? .destination2, selection: 2) { EmptyView() }
                                NavigationLink(ListView(viewModel: ListViewModel(limit: 135, offset: 251), startFrom: 251)), tag: Destination(rawValue: pokemon.id) ?? .destination3, selection: 3) { EmptyView() }
                                NavigationLink(ListView(viewModel: ListViewModel(limit: 107, offset: 386), startFrom: 386)), tag: Destination(rawValue: pokemon.id) ?? .destination4, selection: 4) { EmptyView() }
                                NavigationLink(ListView(viewModel: ListViewModel(limit: 156, offset: 493), startFrom: 493)), tag: Destination(rawValue: pokemon.id) ?? .destination5, selection: 5) { EmptyView() }
                                NavigationLink(ListView(viewModel: ListViewModel(limit: 72, offset: 649), startFrom: 649)), tag: Destination(rawValue: pokemon.id) ?? .destination6, selection: 6) { EmptyView() }
                                NavigationLink(ListView(viewModel: ListViewModel(limit: 88, offset: 721), startFrom: 721)), tag: Destination(rawValue: pokemon.id) ?? .destination7, selection: 7) { EmptyView() }
                                NavigationLink(ListView(viewModel: ListViewModel(limit: 96, offset: 809), startFrom: 809)), tag: Destination(rawValue: pokemon.id) ?? .destination8, selection: 8) { EmptyView() }
                                NavigationLink(ListView(viewModel: ListViewModel(limit: 120, offset: 905), startFrom: 905)), tag: Destination(rawValue: pokemon.id) ?? .destination9, selection: 9) { EmptyView() }
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

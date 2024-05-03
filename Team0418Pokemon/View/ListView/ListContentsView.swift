//
//  ListContentsView.swift
//  Team0418Pokemon
//
//  Created by 백동현 on 5/2/24.
//

import SwiftUI

struct ListContentsView: View {
  let min: Int
  let max: Int
  let pokemonList: [Pokemon]

  var body: some View {
    if pokemonList.isEmpty {
      Spacer()
      Text("포켓몬이 없습니다.")
        .font(.title)
        .fontWeight(.bold)
      Spacer()
    } else {
      NavigationStack {
        ScrollView {
          ForEach (pokemonList, id: \.id) { pokemon in
            //          NavigationLink() {
            ListItem(number: pokemon.id, name: "\(pokemon.name)", imageUrl: pokemon.imageUrlString)
              .frame(height: 100)
            //          }
          }
        }

      }.navigationTitle("\(min) - \(max)")
    }
  }
}

#Preview {
  ListContentsView(min: 1, max: 10, pokemonList: [])
}

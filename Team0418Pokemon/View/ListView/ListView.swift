//
//  ListView.swift
//  Team0418Pokemon
//
//  Created by 백동현 on 4/30/24.
//

import SwiftUI

struct ListView: View {
  let min: Int
  let max: Int

  @ObservedObject var viewModel: ListVIewModel = ListVIewModel()

  var body: some View {
    NavigationStack {
      ScrollView {
        ForEach (viewModel.pokeList, id: \.id) { pokemon in
//          NavigationLink() {
          ListItem(number: pokemon.id, name: "\(pokemon.name)", imageUrl: pokemon.imageUrlString)
              .frame(height: 100)
//          }
        }
      }
    }
    .navigationTitle("\(min+1) - \(max+1)")
  }
}

#Preview {
  ListView(
    min: 0, max: 150
  )
}

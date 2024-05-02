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
  
  @State var isLoading: Bool = false
  @State var viewModel: ListVIewModel = ListVIewModel(service: MockService())

  var body: some View {
    VStack {
      if isLoading {
        ProgressView()
      } else {
        ListContentsView(min: min, max: max, pokemonList: viewModel.pokeList)
      }

    }
    .task {
      isLoading = true
      await viewModel.loadList(with: min, limit: max - min + 1)
      isLoading = false
    }
  }
}

#Preview {
  ListView(
    min: 0, max: 150
  )
}

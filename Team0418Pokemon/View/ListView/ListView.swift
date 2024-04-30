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

  var body: some View {
    ScrollView {
      ForEach(0..<max-min+1, id: \.self) { i in
        ListItem(number: i, name: "\(i)입니다.", imageUrl: "https://example.com/image.jpg")
      }
    }
    .padding()
    .navigationTitle("\(min+1) - \(max+1)")
  }
}

#Preview {
  ListView(
    min: 0, max: 150
  )
}

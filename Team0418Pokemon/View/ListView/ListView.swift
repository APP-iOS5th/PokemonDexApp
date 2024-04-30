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
    List {
      ForEach (min..<max, id: \.self) { i in
        ListItem(number: i, name: "\(i) 입니다.", imageUrl: "https://example.com/image.jpg")
          .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
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

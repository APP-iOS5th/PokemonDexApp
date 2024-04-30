//
//  ListItem.swift
//  Team0418Pokemon
//
//  Created by 백동현 on 4/30/24.
//

import SwiftUI

struct ListItem: View {
  let number: Int
  let name: String
  let imageUrl: String
  var body: some View {
    GeometryReader { geometry in
      HStack {
        VStack(alignment: .leading, spacing: 10) {
          Text("No. \(number)")
            .font(.subheadline)
            .fontWeight(.bold)
          Text(name)
            .font(.title)
            .fontWeight(.bold)
          Spacer()
        }
        .frame(width: geometry.size.width/2, height: 100, alignment: .leading)

        VStack(alignment: .trailing, spacing: 10) {
          Spacer()
          AsyncImage(url: URL(string: imageUrl))
            .aspectRatio(contentMode: .fit)
          Spacer()
        }
        .frame(width: geometry.size.width/3, height: 100, alignment: .trailing)
//          .background(.gray)
      }
      .frame(width: geometry.size.width, height: 100)
      .background(.blue)
    }
  }
}

#Preview {
  ListItem(
    number: 1, name: "Bulbasaur", imageUrl: "https://example.com/image.jpg"
  )
}

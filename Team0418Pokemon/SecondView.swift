//
//  SecondView.swift
//  Team0418Pokemon
//
//  Created by 차지용 on 5/1/24.
//

import SwiftUI

struct SecondView: View {
    let pkmstats = [PokemonStat]()
    let gridItem:[GridItem] = [
        GridItem(.flexible(minimum:30, maximum:300)),
        GridItem(.flexible(minimum:30, maximum:300))
    ]
    var body: some View {
        VStack{
        }
    }
}

#Preview {
    SecondView()
}

//
//  FilterTagsView.swift
//  Team0418Pokemon
//
//  Created by Heeji Jung on 5/3/24.
//

import SwiftUI

struct FilterTagsView: View {
    
    @EnvironmentObject var searchVM: SearchViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(PokemonType.allCases, id: \.self) { tag in
                    Button(action:{
                        searchVM.selectBtnClick(tag)
                    }) {
                        Text(tag.rawValue)
                            .font(.caption)
                            .foregroundStyle(Color.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 5)
                            .frame(width:60)
                            .background {
                                Capsule()
//                                    .fill(Color.stringToColor(tag.DisplayColorName))
                            }
                    }
                }
            }
        }
    }
}

#Preview {
    FilterTagsView()
}

//
//  FirstDetailView.swift
//  Team0418Pokemon
//
//  Created by 차지용 on 5/1/24.
//

import SwiftUI

struct FirstDetailView: View {
    @State var id : Int = 1
    @State var pkmtype: PokemonType = .ice
    @State var genus = "Lizard Pokemon"
    @State var name = "파이리"
    var body: some View {
        VStack{
            ZStack{
                VStack{
                    HStack{
                        ZStack{
                            Capsule() //타원
                                .fill(Color.black)
                                .frame(width:90, height: 30)
                            Text("No.\(id)")
                                .foregroundStyle(.white)
                                .font(.footnote)
                        }
                        ZStack {
                            Capsule() //타원
                                .fill(Color(UIColor(hex: pkmtype.DisplayColorName())))
                                .frame(width:90, height: 30)
                            Text("\(pkmtype.rawValue)")
                                .foregroundStyle(.white)
                        }
                    }
                    Text("\(name)")
                        .font(.largeTitle)
                    Text("\(genus)")
                        .font(.footnote)
                    
                }
                
            }
                
        }
        
    }
}

#Preview {
    FirstDetailView( )
}

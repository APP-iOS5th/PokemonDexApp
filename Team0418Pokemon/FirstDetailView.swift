//
//  FirstDetailView.swift
//  Team0418Pokemon
//
//  Created by 차지용 on 5/1/24.
//

import SwiftUI

struct FirstDetailView: View {
    @State var id : Int
    @State var type = ""
    @State var genus = ""
    @State var name = ""
    var body: some View {
        VStack{
            ZStack{
                VStack{
                    HStack{
                        ZStack{
                            Capsule() //타원
                                .fill(Color.black)
                                .frame(width:90, height: 30)
                            Text("No.")
                                .foregroundStyle(.white)
                                .font(.footnote)
                        }
                        ZStack {
                            Capsule() //타원
                                .fill(Color.black)
                                .frame(width:90, height: 30)
                            Text("타입")
                                .foregroundStyle(.white)
                        }
                    }
                    Text("포켓몬이름")
                        .font(.largeTitle)
                    Text("속성")
                        .font(.footnote)
                    
                }
                
            }
                
        }
        
    }
}

#Preview {
    FirstDetailView(id: 1)
}

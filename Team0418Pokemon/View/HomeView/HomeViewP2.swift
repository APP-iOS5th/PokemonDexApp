//
//  HomeViewP2.swift
//  Team0418Pokemon
//
//  Created by SungWoonLee on 4/30/24.
//

import SwiftUI

struct HomeViewP2: View {
    let columns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 3)
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(0..<9) { number in
                ZStack {
                
                    
                    Button(action: {  print("\(number)")}) {
                        
                        
                        Image("Homeicon_\(number)")
                            .resizable()
                            .frame(height: 100)
                        
                            .frame(maxWidth: 100)
                        
                            .background(.white.opacity(0.4))
                            .cornerRadius(30)
                        
                    }
                }.frame(maxWidth: 300)
            }
            
        }
    }
}
    
#Preview {
    HomeViewP2()
}

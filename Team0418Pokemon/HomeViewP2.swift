//
//  HomeViewP2.swift
//  Team0418Pokemon
//
//  Created by SungWoonLee on 4/30/24.
//

import SwiftUI

struct HomeViewP2: View {
    var body: some View {
  
            VStack(spacing: 10) {
                Button("Button 1") {
                    
                }.customButtonStyle()
                
                
                Button("Button 2") {
                    // 버튼 2가 눌렸을 때 수행할 동작
                }.customButtonStyle()
                
                
                Button("Button 3") {
                    // 버튼 3이 눌렸을 때 수행할 동작
                }.customButtonStyle()
                
            }.padding()
        }
    }

#Preview {
    HomeViewP2()
}

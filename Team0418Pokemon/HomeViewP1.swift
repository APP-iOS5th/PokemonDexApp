//
//  HomeViewP1.swift
//  Team0418Pokemon
//
//  Created by SungWoonLee on 4/30/24.
//

import SwiftUI

struct ButtonStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(height: 190)
            .frame(maxWidth: .infinity)
            .background(Color.orange)
            .foregroundColor(.green)
            .cornerRadius(30)
    }
}
extension View {
    func customButtonStyle() -> some View {
        self.modifier(ButtonStyleModifier())
    }
}

struct HomeViewP1: View {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



#Preview {
    HomeViewP1()
}

////
////  HomeViewP1.swift
////  Team0418Pokemon
////
////  Created by SungWoonLee on 4/30/24.
////
//
//import SwiftUI
//
//struct ButtonStyleModifier: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .frame(height: 190)
//            .frame(maxWidth: .infinity)
//            .background(.red.opacity(0.9))            .foregroundColor(.green)
//            .cornerRadius(30)
//        
//    }
//}
//extension View {
//    func customButtonStyle() -> some View {
//        self.modifier(ButtonStyleModifier())
//    }
//}
//
//struct CustomButtonStyle: ButtonStyle {
//    func makeBody(configuration: Configuration) -> some View {
//        configuration.label
//            .frame(height: 175)
//            .frame(maxWidth: 345)
//            .background(Color.white.opacity(0.4)) // 배경색 설정
//            .foregroundColor(.white) // 텍스트 색상 설정
//            .cornerRadius(25) // 버튼 모서리 둥글게 처리
//    }
//}
//
//
//struct HomeViewP1: View {
//    var body: some View {
//        VStack(spacing: 10) {
//            Button("Button 1") {
//                
//            }.customButtonStyle()
//                .buttonStyle(CustomButtonStyle())
//            
//            
//            
//            Button("Button 2") {
//                // 버튼 2가 눌렸을 때 수행할 동작
//            }.customButtonStyle()
//                .buttonStyle(CustomButtonStyle())
//
//            
//            
//            Button("Button 3") {
//                // 버튼 3이 눌렸을 때 수행할 동작
//            }.customButtonStyle()
//                .buttonStyle(CustomButtonStyle())
//
//            
//        }.padding()
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//
//
//
//#Preview {
//    HomeViewP1()
//}

//
//  HomeViewMain.swift
//  Team0418Pokemon
//
//  Created by SungWoonLee on 4/30/24.
//

import SwiftUI

struct ButtonStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(height: 190)
            .frame(maxWidth: 360)
            .background(.white.opacity(0.4))
            .foregroundColor(.green)
            .cornerRadius(30)
        
    }
}
extension View {
    func customButtonStyle() -> some View {
        self.modifier(ButtonStyleModifier())
    }
}

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(height: 175)
            .frame(maxWidth: 345)
            .background(Color.white)
            .foregroundColor(.black)
            .cornerRadius(25)
    }
}


struct HomeViewMain: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.red.opacity(0.9).edgesIgnoringSafeArea(.all)
                TabView {
                    ScrollView {
                        VStack(spacing: 12) {
                            Button("Button 1") {
                                //
                            }.customButtonStyle()
                                .buttonStyle(CustomButtonStyle())
                            Button("Button 2") {
                                //
                            }.customButtonStyle()
                                .buttonStyle(CustomButtonStyle())
                            
                            Button("Button 3") {
                                //
                            }.customButtonStyle()
                                .buttonStyle(CustomButtonStyle())
                        }
                    }
                    
                    ScrollView {
                        VStack(spacing: 12) {
                            Button("Button 4") {
                                
                            }.customButtonStyle()
                                .buttonStyle(CustomButtonStyle())
                            Button("Button 5") {
                                // 버튼 2가 눌렸을 때 수행할 동작
                            }.customButtonStyle()
                                .buttonStyle(CustomButtonStyle())
                            Button("Button 6") {
                                // 버튼 3이 눌렸을 때 수행할 동작
                            }.customButtonStyle()
                            .buttonStyle(CustomButtonStyle())                    }
                    }
                    
                    ScrollView {
                        VStack(spacing: 12) {
                            Button("Button 7") {
                                //
                            }.customButtonStyle()
                                .buttonStyle(CustomButtonStyle())
                            
                            Button("Button 8") {
                                //
                            }.customButtonStyle()
                                .buttonStyle(CustomButtonStyle())
                            Button("Button 9") {
                                //
                            }.customButtonStyle()
                                .buttonStyle(CustomButtonStyle())
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .navigationBarTitle("POKEMON DOGAM", displayMode: .inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack(spacing: 4) {
                            Image(systemName: "circle.fill")
                                .font(.system(size: 17))
                            
                            //                          .symbolEffect(.bounce, value: false)
                                .foregroundColor(.red)
                                .overlay(
                                    Circle()
                                        .stroke(Color.black.opacity(0.8), lineWidth: 3))
                            Image(systemName: "circle.fill")
                                .font(.system(size: 17))
                                .foregroundColor(.yellow)
                                .overlay(
                                    Circle()
                                        .stroke(Color.black.opacity(0.8), lineWidth: 3))
                            Image(systemName: "circle.fill")
                                .font(.system(size: 17))
                                .foregroundColor(.green)
                                .overlay(
                                    Circle()
                                        .stroke(Color.black.opacity(0.8), lineWidth: 3))
                        }
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image(systemName: "circle.fill")
                            .font(.system(size: 40))
                            .foregroundColor(.blue)
                            .overlay(
                                Circle()
                                    .stroke(Color.white.opacity(0.9), lineWidth: 6)
                            )
                        
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    HomeViewMain()
}

//.replace.upUp.byLayer


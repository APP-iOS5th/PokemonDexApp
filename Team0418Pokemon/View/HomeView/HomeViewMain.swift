//
//  HomeViewMain.swift
//  Team0418Pokemon
//
//  Created by SungWoonLee on 4/30/24.
//

import SwiftUI


struct CustomButton: View {
    let columns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 3)
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 25) {
            ForEach(0..<9) { number in
                ZStack {
                    Button(action: {buttonTapped(number)}) {
                        VStack(spacing: 3) { Image("Homeicon_\(number)")
                                .resizable()
                                .frame(height: 95)
                                .frame(maxWidth: 95)
                                .background(.white.opacity(0.8))
                                .cornerRadius(30)
                            Text(buttonTapped(number))
                                .font(.system(size: 14))
                                .bold()
                                .foregroundColor(.white)
                        }
                    }
                }.frame(maxWidth: 400)
            }
        }.frame(height: 515)
            .frame(maxWidth: 330)
            .background(Color.black.opacity(0.8))
            .cornerRadius(20)

    }
    
    
    func buttonTapped(_ button: Int) -> String {
        
        switch button {
        case 0:
            return "0001-0151"
        case 1:
            return "0152-0251"
        case 2:
            return "0252-0386"
        case 3:
            return "0387-0493"
        case 4:
            return "0494-0649"
        case 5:
            return "0650-0721"
        case 6:
            return "0722-0809"
        case 7:
            return "0810-0905"
        case 8:
            return "0906-1025"
            
        default:
            return " "
        }
    }
}

struct HomeViewMain: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.red.opacity(0.9).edgesIgnoringSafeArea(.all)
                
                VStack {
                    CustomButton()
                }.customButtonStyle()
                    .navigationBarTitle("POKEMON DOGAM", displayMode: .inline)
                
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            HStack(spacing: 4) {
                                Image(systemName: "circle.fill")
                                    .font(.system(size: 17))
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
                            .padding()
                        }
                        
                        ToolbarItem(placement: .navigationBarLeading) {
                            Image(systemName: "circle.fill")
                                .font(.system(size: 40))
                                .foregroundColor(.blue)
                                .overlay(
                                    Circle()
                                        .stroke(Color.white.opacity(0.9), lineWidth: 6)
                                )
                                .padding()
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

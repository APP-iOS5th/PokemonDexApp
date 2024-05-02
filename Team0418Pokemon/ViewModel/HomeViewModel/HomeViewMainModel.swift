//
//  HomeViewMainModel.swift
//  Team0418Pokemon
//
//  Created by SungWoonLee on 5/1/24.
//

import SwiftUI

final class FakeNetServ: HomeUseCase {
    func request() async -> [Pokemon] {
        return [  Pokemon(id: 1, name: "0001-0151", imageUrlString: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png"),
                  Pokemon(id: 2, name: "0152-0251", imageUrlString: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png"),
                  Pokemon(id: 3, name: "0252-0386", imageUrlString: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png"),
                  Pokemon(id: 4, name: "0387-0493", imageUrlString: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png"),
                  Pokemon(id: 5, name: "0494-0649", imageUrlString: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/5.png"),
                  Pokemon(id: 6, name: "0650-0721", imageUrlString: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/6.png"),
                  Pokemon(id: 7, name: "0722-0809", imageUrlString: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/7.png"),
                  Pokemon(id: 8, name: "0810-0905", imageUrlString: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/8.png"),
                  Pokemon(id: 9, name: "0906-1025", imageUrlString: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/9.png")
        ]
    }
}


struct ButtonStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(height: 550)
            .frame(maxWidth: 370)
            .background(.white.opacity(0.4))
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
            .frame(height: 165)
            .frame(maxWidth: 100)
            .background(Color.white)
            .foregroundColor(.black)
            .cornerRadius(25)
    }
}


struct HomeViewMainModel: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CustomToolbar: View {
    var body: some View {
        HStack {
            
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
        .padding()
    }
}

struct CustomToolbar2: View {
    @Environment(\.dismiss) private var dismiss
    @State var isNeedBack : Bool = false
    var body: some View {

        HStack {
            Button(action: {
                dismiss()
            }) {
                Image(systemName: "circle.fill")
                    .font(.system(size: 40))
                    .foregroundColor(.blue)
                    .overlay(
                        Circle()
                            .stroke(Color.white.opacity(0.9), lineWidth: 6))
                   
                    .padding()
                
                Spacer()
            }
        }  
    }
}

func buttonTapped(_ button: String) -> String {
        
        switch button {
        case "1":
            return "0001-0151"
        case "2":
            return "0152-0251"
        case "3":
            return "0252-0386"
        case "4":
            return "0387-0493"
        case "5":
            return "0494-0649"
        case "6":
            return "0650-0721"
        case "7":
            return "0722-0809"
        case "8":
            return "0810-0905"
        case "9":
            return "0906-1025"
        default:
            return "0001-0151"
        }
    }






#Preview {
    HomeViewMainModel()
}

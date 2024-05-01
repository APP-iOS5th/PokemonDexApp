//
//  HomeViewMainModel.swift
//  Team0418Pokemon
//
//  Created by SungWoonLee on 5/1/24.
//

import SwiftUI

class HomeViewUse: HomeUseCase {
    func request() -> [Pokemon] {
        // 실제 데이터 요청 로직을 구현합니다.
        // 예시: 서버에서 포켓몬 목록을 가져와 반환
        return []
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

#Preview {
    HomeViewMainModel()
}

//
//  ContentView.swift
//  Team0418Pokemon
//
//  Created by jinwoong Kim on 4/29/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            AppleLoginView()
        }
        .frame(height: UIScreen.main.bounds.height)
        .background(Color.white)    }
}

#Preview {
    ContentView()
}

//
//  HomeViewMain.swift
//  Team0418Pokemon
//
//  Created by SungWoonLee on 4/30/24.
//

import SwiftUI

struct HomeViewMain: View {
    var body: some View {
        NavigationView {
            TabView {
                ScrollView {
                    VStack {
                        HomeViewP1()
                    }.navigationBarTitle("A View", displayMode: .inline)
                }
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("First")
                }
                ScrollView {
                    VStack {
                        HomeViewP2()
                    }.navigationBarTitle("A View", displayMode: .inline)
                }
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Second")
                }
                ScrollView {
                    VStack {
                        HomeViewP3()
                    }
                }
                .tabItem {
                    Image(systemName: "3.circle")
                    Text("Third")
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .navigationBarTitle("A View", displayMode: .inline)
            .padding()
        }
    }
}

#Preview {
    HomeViewMain()
}

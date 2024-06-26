//
//  TapView.swift
//  Team0418Pokemon
//
//  Created by SungWoonLee on 4/30/24.
//

import SwiftUI

struct TapBarView: View {
    @State var selectedTab = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                HomeView().tag(0)
                SearchView().tag(1)
                HomeViewP3().tag(2)
            }
            
            ZStack{
                HStack {
                    ForEach((TabbedItems.allCases), id: \.self) { item in
                        Button {
                            selectedTab = item.rawValue
                        } label: {
                            CustomTabItem(imageName: item.iconName, title: item.title, isActive: (selectedTab == item.rawValue))
                        }
                    }
                }.padding()
            }
            .frame(width: 370, height: 70)
            .background(.red.opacity(0.9))
            .cornerRadius(33)
            .padding(.horizontal, 26)
        }
    }
}

extension TapBarView {
    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View {
        HStack(spacing: 10) {
            Spacer()
            Image(imageName)
                .resizable()
                .frame(width: 30, height: 32)
            if isActive {
                Text(title)
                    .font(.system(size: 13)).bold()
                    .foregroundColor(.white)
            }
            Spacer()
        }
        .frame(width: isActive ? 130 : 60, height: 55)
        .background(isActive ? .black.opacity(0.8) : .clear)
        .cornerRadius(30)
    }
}

#Preview {
    TapBarView()
        .environment(HomeViewModel(service: FakeNetServ()))
}

//
//  CustomTabBar.swift
//  SwiftUIAdvanceLearning
//
//  Created by Muhammad Zeeshan on 01/10/2024.
//

import SwiftUI

// Generics
// ViewBuilder
// PrefrenceKey
// MatchedGeometryEffect

struct CustomTabBar: View {
    @State private  var selection: String = "home"
    @State private var tabSelection: TabBarItem = .home
    
    var body: some View {
        CustomTabBarContainerView(selection: $tabSelection) {
            Color.blue
                .tabBarItem(tab: .home, selection: $tabSelection)
            
            Color.red
                .tabBarItem(tab: .favourite, selection: $tabSelection)
            
            Color.green
                .tabBarItem(tab: .profile, selection: $tabSelection)
        }
    }
}

#Preview {    
    CustomTabBar()
}


extension CustomTabBar {
    private var defaultTabView: some View {
        TabView(selection: $selection) {
            Color.red
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            Color.blue
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favourite")
                }
            Color.orange
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
}

//
//  CustomTabBarContainerView.swift
//  SwiftUIAdvanceLearning
//
//  Created by Muhammad Zeeshan on 01/10/2024.
//

import SwiftUI

struct CustomTabBarContainerView<Content: View>: View {
    @Binding var selection: TabBarItem
    let content: Content
    @State private var tabs: [TabBarItem] = []
    
    init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            content
                .ignoresSafeArea()
            CustomTabBarView(tabs: tabs, selection: $selection, localSelection: selection)
        }
        
        .onPreferenceChange(TabBarItemPrefrenceKey.self) { value in
            self.tabs = value
        }
    }
}

#Preview {
    
    let tabs: [TabBarItem] = [
        .home, .favourite, .profile
    ]
    
    CustomTabBarContainerView(selection: .constant(tabs.first!)){
        Color.red
    }
}

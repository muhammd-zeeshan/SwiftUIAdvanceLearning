//
//  TabBarItemPrefrenceKey.swift
//  SwiftUIAdvanceLearning
//
//  Created by Muhammad Zeeshan on 01/10/2024.
//

import Foundation
import SwiftUI

struct TabBarItemPrefrenceKey: PreferenceKey {
    static var defaultValue: [TabBarItem] = []
    
    static func reduce(value: inout [TabBarItem], nextValue: () -> [TabBarItem]) {
        value += nextValue()
    }
}


struct TabBarViewModifier: ViewModifier {
    let tab: TabBarItem
    @Binding var selection: TabBarItem
    
    func body(content: Content) -> some View {
        content
            .opacity(selection == tab ? 1.0 : 0.0)
            .preference(key: TabBarItemPrefrenceKey.self, value: [tab])
    }
}

extension View {
    func tabBarItem(tab: TabBarItem, selection: Binding<TabBarItem>) -> some View {
       modifier(TabBarViewModifier(tab: tab, selection: selection))
    }
}


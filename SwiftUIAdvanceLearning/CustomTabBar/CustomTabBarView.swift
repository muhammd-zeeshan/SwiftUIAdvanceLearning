//
//  Custo,TabBarView.swift
//  SwiftUIAdvanceLearning
//
//  Created by Muhammad Zeeshan on 01/10/2024.
//

import SwiftUI

struct CustomTabBarView: View {
    let tabs: [TabBarItem]
    @Binding var selection: TabBarItem
    @Namespace private var nameSpace
    @State var localSelection: TabBarItem
    
    var body: some View {
        TabBarVersion2
            .onChange(of: selection) { oldValue, value in
                withAnimation(.easeInOut) {
                    localSelection = value
                }
            }
    }
}

#Preview {
    let tabs: [TabBarItem] = [
        .home, .favourite, .profile
    ]
    
    VStack {
        Spacer()
        CustomTabBarView(tabs: tabs, selection: .constant(tabs.first!), localSelection: tabs.first!)
    }
}


extension CustomTabBarView {
    
    private func tabView(tab: TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.iconName)
                .font(.subheadline)
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundStyle(localSelection == tab ? tab.color : .secondary)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(localSelection == tab ? Color(tab.color).opacity(0.2) : .clear)
        .cornerRadius(10)
    }
    
    private var TabBarVersion1: some View {
        HStack {
            ForEach(tabs, id: \.hashValue) { tab in
                tabView(tab: tab)
                    .onTapGesture {
                        switchTab(tab: tab)
                    }
            }
        }
    }
    
    private func switchTab(tab: TabBarItem) {
        selection = tab
    }
    
}


extension CustomTabBarView {
    
    private func tabView2(tab: TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.iconName)
                .font(.subheadline)
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundStyle(localSelection == tab ? tab.color : .secondary)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(
            ZStack {
                if localSelection == tab {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(tab.color.opacity(0.2))
                        .matchedGeometryEffect(id: "background", in: nameSpace)
                }
            }
            
        )
    }
    
    private var TabBarVersion2: some View {
        HStack {
            ForEach(tabs, id: \.hashValue) { tab in
                tabView2(tab: tab)
                    .onTapGesture {
                        switchTab(tab: tab)
                    }
            }
        }
        .background(Color.white.ignoresSafeArea(edges: .bottom))
        .cornerRadius(25)
        .shadow(color: Color.gray.opacity(0.5), radius: 10, x: 0, y: 5)
        .padding(.horizontal)
    }
    
}


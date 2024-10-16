//
//  CustomNavBarContainerView.swift
//  SwiftUIAdvanceLearning
//
//  Created by Muhammad Zeeshan on 02/10/2024.
//

import SwiftUI

struct CustomNavBarContainerView<Content: View>: View {
    let content: Content
    @State private var title: String = " "
    @State private var subTitle: String? = nil
    @State private var showBackButton: Bool = false
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavBarView(title: title, subTitle: subTitle, showBackButton: showBackButton)
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onPreferenceChange(CustomNavBarTitlePrefrenceKey.self) { value in
            self.title = value
        }
        .onPreferenceChange(CustomNavBarSubTitlePrefrenceKey.self) { value in
            self.subTitle = value
        }
        .onPreferenceChange(CustomNavBarBackButtonPrefrenceKey.self) { value in
            self.showBackButton = !value
        }
    }
}

#Preview {
    CustomNavBarContainerView {
        ZStack {
            Color.green.ignoresSafeArea(edges: .all)
            
                .customNavBarTitle("New Title")
                .customNavBarSubTitle(nil)
                .customNavBarBackButtonHidden(false)
        }
    }
}

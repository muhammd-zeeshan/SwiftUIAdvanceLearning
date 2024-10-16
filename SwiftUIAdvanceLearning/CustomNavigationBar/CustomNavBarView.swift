//
//  CustomNavBarView.swift
//  SwiftUIAdvanceLearning
//
//  Created by Muhammad Zeeshan on 02/10/2024.
//

import SwiftUI

struct CustomNavBarView: View {
    
    @Environment(\.dismiss) var dismiss
    let title: String
    let subTitle: String?
    let showBackButton: Bool
    
    var body: some View {
        HStack {
            if showBackButton {
                backButton
            }
            Spacer()
            
            titleSection
                
            
            Spacer()
            
            if showBackButton {
                backButton
                    .opacity(0)
            }
        }
        .padding(5)
        .tint(Color.white)
        .foregroundStyle(Color.white)
        .font(.headline)
        .background(Color.blue.ignoresSafeArea(edges: .top))
    }
}

#Preview {
    VStack{
        CustomNavBarView(title: "Title Here", subTitle: nil, showBackButton: false)
        Spacer()
    }
}


extension CustomNavBarView {
    private var backButton: some View {
        Button {
            dismiss.callAsFunction()
        } label: {
            Image(systemName: "chevron.left")
        }
    }
    
    private var titleSection: some View {
        VStack(spacing: 4) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            if let subTitle = subTitle{
                Text(subTitle)
            }
        }
    }
}

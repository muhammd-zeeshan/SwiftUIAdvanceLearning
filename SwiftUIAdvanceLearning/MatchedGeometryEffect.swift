//
//  MatchedGeometryEffect.swift
//  SwiftUIAdvanceLearning
//
//  Created by Muhammad Zeeshan on 30/09/2024.
//

import SwiftUI

struct MatchedGeometryEffect: View {
    @State private var isClicked: Bool = false
    @Namespace private var nameSpace
    
    var body: some View {
        VStack {
            if !isClicked {
                RoundedRectangle(cornerRadius: 25)
                    .matchedGeometryEffect(id: "Rectangle", in: nameSpace)
                    .frame(width: 100, height: 100)
            }
            
//                .offset(y: isClicked ? UIScreen.main.bounds.height * 0.80 : 0)
            
            Spacer()
            
            if isClicked {
                RoundedRectangle(cornerRadius: 25)
                    .matchedGeometryEffect(id: "Rectangle", in: nameSpace)
                    .frame(width: 300, height: 100)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onTapGesture {
            withAnimation(.easeInOut) {
                isClicked.toggle()
            }
        }
    }
}

#Preview {
//    MatchedGeometryEffect()
    MatchedGeometryEffect2()
}

struct MatchedGeometryEffect2: View {
    
    let categorize: [String] = ["Summary", "Wallets", "Shared"]
    @State private var selected: String = ""
    @Namespace private var nameSpace2
    
    var body: some View {
        HStack {
            ForEach(categorize, id: \.self) { category in
                ZStack(alignment: .bottom) {
                    if selected == category{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.red)
                            .matchedGeometryEffect(id: "Category", in: nameSpace2)
                            .frame(width: 35, height: 2)
                            .offset(y: 10)
                    }
            
                    Text(category)
                        .foregroundStyle(selected == category ? .red : .black)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .onTapGesture {
                    withAnimation(.spring) {
                        selected = category
                    }
                }
            }
        }
    }
}


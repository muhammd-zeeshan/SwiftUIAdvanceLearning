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
                RoundedRectangle(cornerRadius: 25.0)
                    .matchedGeometryEffect(id: "Rect", in: nameSpace)
                    .frame(width: 100, height: 100)
            }
//                .offset(y: isClicked ? UIScreen.main.bounds.height * 0.80 : 0.0)
            
            Spacer()
            
            if isClicked {
                RoundedRectangle(cornerRadius: 25)
                    .matchedGeometryEffect(id: "Rect", in: nameSpace)
                    .frame(width: 300, height: 300)
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red)
        .onTapGesture {
            withAnimation(.linear(duration: 1.0)){
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
    let categorize: [String] = ["Home", "Popular", "Saved"]
    @State private var selected: String = ""
    @Namespace private var nameSpace2
    
    var body: some View {
        HStack {
            ForEach(categorize, id: \.self) { categorize in
                ZStack(alignment: .bottom){
                    if selected == categorize{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.red)
                            .matchedGeometryEffect(id: "category_background", in: nameSpace2)
                            .frame(width: 50, height: 2)
                            .offset(y: 6)
                    }
                    
                    Text(categorize)
                        .foregroundStyle(selected == categorize ? .red : .black)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .onTapGesture {
                    withAnimation(.spring()) {
                        selected = categorize
                    }
                }
            }
        }
        .padding()
    }
}

//
//  ScrollViewOffsetPreferneceKey.swift
//  SwiftUIAdvanceLearning
//
//  Created by Muhammad Zeeshan on 03/10/2024.
//

import SwiftUI

struct ScrollViewOffsetPrefernceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

extension View {
    
    func onScrollViewOffsetChanged(perform action: @escaping (_ offset: CGFloat) -> Void) -> some View {
        self
            .background(
                GeometryReader { geo in
                    Text("")
                        .preference(key: ScrollViewOffsetPrefernceKey.self, value: geo.frame(in: .global).minY)
                }
            )
        
            .onPreferenceChange(ScrollViewOffsetPrefernceKey.self) { value in
                action(value)
            }
    }
    
}

struct ScrollViewOffsetPreferneceKey: View {
    
    @State private var title: String = "Nav Title Here"
    @State private var scrollViewOffset: CGFloat = 0
    
    var body: some View {
        ScrollView {
            VStack {
                titleLayer
                    .opacity(Double(scrollViewOffset) / 60.0)
                    .onScrollViewOffsetChanged { offset in
                        self.scrollViewOffset = offset
                    }
                
                contentLayer
            }
            .padding(.horizontal)
        }
//        List {
//            contentLayer
//        }
//        .overlay(Text("\(scrollViewOffset)"))
        .overlay(
            navBarLayer
                .opacity(scrollViewOffset < 40 ? 1.0 : 0.0 )
            ,alignment: .top
        )
    }
}

#Preview {
    ScrollViewOffsetPreferneceKey()
}


extension ScrollViewOffsetPreferneceKey {
    
    private var titleLayer: some View {
        Text(title)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var contentLayer: some View {
        ForEach(0..<30) { _ in
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.red)
                .opacity(0.3)
                .frame(width: 300, height: 200)
        }
    }
    
    private var navBarLayer: some View {
        Text(title)
            .font(.headline)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(Color.blue)
    }
    
}

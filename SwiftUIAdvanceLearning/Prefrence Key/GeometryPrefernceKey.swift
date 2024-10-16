//
//  GeometryPrefernceKey.swift
//  SwiftUIAdvanceLearning
//
//  Created by Muhammad Zeeshan on 03/10/2024.
//

import SwiftUI

struct GeometryPrefernceKey: View {
    @State private var rectSize: CGSize = .zero
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .frame(width: rectSize.width, height: rectSize.height)
                .background(Color.blue)
            
            HStack {
                Rectangle()
                GeometryReader { geometry in
                    Rectangle()
                        .updateRectangleGeometrySize(geometry.size)
                }
                Rectangle()
            }
            .frame(height: 55)
        }
        .onPreferenceChange(RectangleGeometrySizePreferenceKey.self) { value in
            self.rectSize = value
        }
    }
}

#Preview {
    GeometryPrefernceKey()
}

extension View {
    
    func updateRectangleGeometrySize(_ size: CGSize) -> some View {
        preference(key: RectangleGeometrySizePreferenceKey.self, value: size)
    }
    
}


struct RectangleGeometrySizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

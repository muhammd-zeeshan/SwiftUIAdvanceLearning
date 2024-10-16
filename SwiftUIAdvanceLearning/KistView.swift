//
//  KistView.swift
//  SwiftUIAdvanceLearning
//
//  Created by Muhammad Zeeshan on 08/10/2024.
//

import SwiftUI

struct KistView: View {
    var body: some View {
        List {
            ForEach(0..<20) { _ in
                Rectangle()
            }
        }
    }
}

#Preview {
    KistView()
}

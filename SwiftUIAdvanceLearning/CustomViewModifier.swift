//
//  ContentView.swift
//  SwiftUIContinueLearning
//
//  Created by Muhammad Zeeshan on 26/09/2024.
//

import SwiftUI

struct CustomViewModifier: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .modifier(DefaultButtonModifiers())
            Text("Hello Zeeshan")
                .modifier(DefaultButtonModifiers())
        }
        
    }
}

#Preview {
    CustomViewModifier()
}


struct DefaultButtonModifiers: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .cornerRadius(10)
            .shadow(radius: 10)
            .padding()
    }
}

//
//  CustomButtonStyle.swift
//  SwiftUIContinueLearning
//
//  Created by Muhammad Zeeshan on 26/09/2024.
//

import SwiftUI

struct ButtonPressableStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.8 : 1.0)
            .opacity(configuration.isPressed ? 0.7 : 1.0)
    }
}

extension View {
    func withpressableStyle() -> some View {
        buttonStyle(ButtonPressableStyle())
    }
}

struct CustomButtonStyle: View {
    var body: some View {
        Button {
            
        } label: {
            Text("Click me")
                .font(.headline)
                .foregroundStyle(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.accentColor)
                .cornerRadius(10)
        }
        .withpressableStyle()
        .padding(40)
    }
}

#Preview {
    CustomButtonStyle()
}

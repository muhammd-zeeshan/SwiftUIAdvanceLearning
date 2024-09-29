//
//  CustomTransition.swift
//  SwiftUIContinueLearning
//
//  Created by Muhammad Zeeshan on 26/09/2024.
//

import SwiftUI

struct RotateViewModifier: ViewModifier {
    
    let rotation: Double
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: rotation))
            .offset(
                x: rotation != 0 ? UIScreen.main.bounds.width : 0,
                y: rotation != 0 ? UIScreen.main.bounds.height : 0
            )
    }
}

extension AnyTransition {
    static var rotating: AnyTransition {
        return AnyTransition.modifier(
            active: RotateViewModifier(rotation: 180),
            identity: RotateViewModifier(rotation: 0))
    }
    
    static func rotating(rotation: Double) -> AnyTransition {
        return AnyTransition.modifier(
            active: RotateViewModifier(rotation: rotation),
            identity: RotateViewModifier(rotation: 0))
    }
    
    static var rotatingOn: AnyTransition {
        return AnyTransition.asymmetric(
            insertion: .rotating,
            removal: .move(edge: .top))
    }
}

struct CustomTransition: View {
    @State private var showshape: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            
            if showshape{
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 250, height: 350)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    .transition(.move(edge: .leading))
//                    .transition(AnyTransition.rotating.animation(.easeInOut))
//                    .transition(.rotating(rotation: 1080))
                    .transition(.rotatingOn)
            }
            
            Spacer()
            
            Text("Click Me")
                .modifier(DefaultButtonModifiers())
                .onTapGesture {
                    withAnimation(.smooth(duration: showshape ? 0.5 : 1.5)) {
                        showshape.toggle()
                    }
                }
        }
    }
}

#Preview {
    CustomTransition()
}

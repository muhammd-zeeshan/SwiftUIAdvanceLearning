//
//  AnimateCustomShapesWithAnimateableData.swift
//  SwiftUIAdvanceLearning
//
//  Created by Muhammad Zeeshan on 30/09/2024.
//

import SwiftUI

struct AnimateCustomShapesWithAnimateableData: View {
    @State private var isAnimate: Bool = false
    
    var body: some View {
        ZStack {
//            RoundedRectangle(cornerRadius: isAnimate ? 25 : 0)
//                .frame(width: 250, height: 250)
//            RectangleWithSingleCornerAnimation(cornerRadius: isAnimate ? 50 : 0)
            Pacman(move: isAnimate ? 20 : 0)
                .frame(width: 350, height: 150)
        }
        .onAppear {
            withAnimation(.easeOut(duration: 2.0).repeatForever()) {
                isAnimate.toggle()
            }
        }
    }
}

#Preview {
    AnimateCustomShapesWithAnimateableData()
}

struct RectangleWithSingleCornerAnimation:Shape {
    var cornerRadius: CGFloat
    
    var animatableData: CGFloat {
        get { cornerRadius }
        set { cornerRadius = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            
            path.move(to: .zero)
            
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - cornerRadius))
            
            path.addArc(
                center: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY - cornerRadius),
                radius: cornerRadius,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 180),
                clockwise: false)
            
            path.addLine(to: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY))
            
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }
}

struct Pacman: Shape {
    var move: CGFloat
    
    var animatableData: CGFloat {
        get { move }
        set { move = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            
            path.move(to: CGPoint(x: rect.midX, y: rect.midY))
            
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.height / 2,
                startAngle: Angle(degrees: move),
                endAngle: Angle(degrees: 360 - move),
                clockwise: false)
        }
    }
}

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
//            RoundedRectangle(cornerRadius: isAnimate ? 50 : 20)
//            RectangleWithSingleCornerAnimation(cornerRadious: isAnimate ? 60 : 0)
            Pacman(offset: isAnimate ? 20 : 0)
                .frame(width: 250, height: 250)
            
        }
        .onAppear {
            withAnimation(Animation.easeOut.repeatForever()) {
//                isAnimate.toggle()
            }
        }
    }
}

#Preview {
    AnimateCustomShapesWithAnimateableData()
}


struct RectangleWithSingleCornerAnimation: Shape {
    var cornerRadious: CGFloat
    
    var animatableData: CGFloat {
        get { cornerRadious }
        set { cornerRadious = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .zero)
            
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - cornerRadious))
            
            path.addArc(
                center: CGPoint(x: rect.maxX - cornerRadious, y: rect.maxY - cornerRadious),
                radius: cornerRadious,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 360),
                clockwise: false)
            
            path.addLine(to: CGPoint(x:rect.maxX - cornerRadious, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }
}


struct Pacman: Shape {
    var offset: Double
    
    var animatableData: Double {
        get { offset }
        set { offset = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.minY),
                radius: rect.height / 2,
                startAngle: Angle(degrees: offset),
                endAngle: Angle(degrees: 360 - offset),
                clockwise: false)
        }
    }
}

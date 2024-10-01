//
//  CustomShapes.swift
//  SwiftUIAdvanceLearning
//
//  Created by Muhammad Zeeshan on 30/09/2024.
//

import SwiftUI

struct CustomShapes: View {
    var body: some View {
        ZStack {
            
//            Triangle()
//            Diamond()
            Trapezoid()
//                .trim(from: 0.0, to: 0.5)
//                .stroke(style: StrokeStyle(lineWidth: 5, dash: [150, 100], dashPhase: 50))
//                .rotationEffect(Angle(degrees: 180))
                .frame(width: 300, height: 100)
            
        }
    }
}

#Preview {
    CustomShapes()
}


struct Triangle: Shape {
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
    
}

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let horizontalOfffset: CGFloat = rect.width * 0.2
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX - horizontalOfffset, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX + horizontalOfffset, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
}


struct Trapezoid: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let horizontalOffset: CGFloat = rect.width * 0.2
            
            path.move(to: CGPoint(x: rect.minX + horizontalOffset, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX - horizontalOffset, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX + horizontalOffset, y: rect.minY))
            
        }
    }
}

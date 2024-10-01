//
//  CustomShapeswithArcs-Quad-Curves.swift
//  SwiftUIAdvanceLearning
//
//  Created by Muhammad Zeeshan on 30/09/2024.
//

import SwiftUI

struct CustomShapeswithArcs_Quad_Curves: View {
    var body: some View {
        //        ArcSample()
        //        ShapeWithArc()
        //        QuadSample()
        WaterShape()
            .fill(Color(.systemBlue))
        //            .stroke(style: StrokeStyle(lineWidth: 10))
        //            .frame(width: 200, height: 200)
        //            .rotationEffect(Angle(degrees: 90))
            .ignoresSafeArea()
    }
}

#Preview {
    CustomShapeswithArcs_Quad_Curves()
}


struct ArcSample: Shape {
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.midY))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.height / 2,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 40),
                clockwise: true)
        }
    }
}


struct ShapeWithArc: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            // top left
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            
            // top Right
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            
            // mid Right
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            
            // bottom
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.height / 2,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 180),
                clockwise: false)
            
            //            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            
            
            // mid Left
            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        }
    }
}


struct QuadSample: Shape {
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .zero)
            
            path.addQuadCurve(
                to: CGPoint(x: rect.midX, y: rect.midY),
                control: CGPoint(x: rect.maxX - 50, y: rect.minY - 100))
            
        }
    }
}


struct WaterShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.midY))
            
            path.addQuadCurve(
                to: CGPoint(x: rect.midX, y: rect.midY),
                control: CGPoint(x: rect.width * 0.25, y: rect.height * 0.40))
            
            path.addQuadCurve(
                to: CGPoint(x: rect.maxX, y: rect.midY),
                control: CGPoint(x: rect.width * 0.75, y: rect.height * 0.60))
            
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }
}

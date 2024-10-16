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
        ShapeWithArc()
//        QuadSample()
//        WaterShape()
//            .stroke(lineWidth: 5)
            .frame(width: 200, height: 200)
//            .rotationEffect(Angle(degrees: 90))
//            .fill(.blue)
//            .ignoresSafeArea()
    }
}

#Preview {
    CustomShapeswithArcs_Quad_Curves()
}


struct ArcSample: Shape {
     func path(in rect: CGRect) -> Path {
         Path { path in
             path.move(to: CGPoint(x: rect.maxX, y: rect.midY))
             
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
            // top Left where line is move
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            
            // top right where line is ended
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            
            // this is start from top right and end on mid right
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            
             //Bottom
//            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            
            //Use Arc to add curve on bottom
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.height / 2,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 180),
                clockwise: false)
            
            //mid Left
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
                control: CGPoint(x: rect.maxX - 50, y: rect.minY - 50))
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

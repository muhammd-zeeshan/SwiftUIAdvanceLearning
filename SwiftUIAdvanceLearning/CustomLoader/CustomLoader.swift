//
//  CustomLoader.swift
//  SwiftUIAdvanceLearning
//
//  Created by Muhammad Zeeshan on 12/10/2024.
//

import SwiftUI

struct CustomLoader: View {
    @State private var isAnimating: Bool = false
    @State var circleStart: CGFloat = 0.1
    @State var circleEnd: CGFloat = 0.325
    @State var rotationDegree: Angle = .degrees(0)
    @State var opacity: Double = 1.0
    
    let circleTrackgradient = LinearGradient(colors: [Color.cyan, Color.blue], startPoint: .top, endPoint: .bottom)
    let circleFillGradient = LinearGradient(colors: [Color.green], startPoint: .topLeading, endPoint: .trailing)
    
    let trackRotation: Double = 2
    let animationDuration: Double = 0.75
    
    var body: some View {
        ZStack {
//            Color.gray.ignoresSafeArea()
            
            ZStack {
//                Circle()
//                    .stroke(lineWidth: 20)
//                    .fill(circleTrackgradient)
//                    .shadow(color: Color.blue, radius: 5, x: 1, y: 1)
                
                Circle()
                    .trim(from: circleStart, to: circleEnd)
                    .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round))
                    .fill(circleFillGradient)
                    .rotationEffect(rotationDegree)
            }
            .frame(width: 100, height: 100)
            .onAppear {
                animateLoader()
            }
        }
    }
    func rotationAngle() -> Angle {
        return
            .degrees(360 * trackRotation)
    }
    
    func animateLoader() {
        withAnimation(.spring(response: animationDuration * 5)) {
            rotationDegree = .degrees(-57.5)
            circleEnd = 0.325
        }
        
        Timer.scheduledTimer(withTimeInterval: animationDuration, repeats: false) { _ in
            withAnimation(.easeInOut(duration: trackRotation * animationDuration)) {
                self.rotationDegree = self.rotationAngle()
            }
        }
        
        Timer.scheduledTimer(withTimeInterval: animationDuration * 1.25, repeats: false) { _ in
            withAnimation(.easeInOut(duration: (trackRotation * animationDuration))) {
                circleEnd = 1
            }
        }
//        
////        reset
        Timer.scheduledTimer(withTimeInterval: trackRotation * animationDuration, repeats: false) { _ in
            rotationDegree = .degrees(50)
            withAnimation(.easeInOut(duration: animationDuration)) {
                circleEnd = 0
            }
        }
    }
}

#Preview {
    CustomLoader()
}

//
//  CustomLoader2.swift
//  SwiftUIAdvanceLearning
//
//  Created by Muhammad Zeeshan on 12/10/2024.
//

import SwiftUI

struct CustomLoader2: View {
    let rotationTime: Double = 0.75
    let animationTime: Double = 1.9
    let fullrotation: Angle = .degrees(360)
    static let initialDegree: Angle = .degrees(270)
    
    @State var spinnerStart: CGFloat = 0.0
    @State var spinnerEndS1: CGFloat = 0.03
    @State var spinnerEnd2S3: CGFloat = 0.03
    
    @State var rotationDegreeS1 = initialDegree
    @State var rotationDegreeS2 = initialDegree
    @State var rotationDegreeS3 = initialDegree
    
    var body: some View {
        ZStack {
            CircleShape(start: spinnerStart, end: spinnerEndS1, rotation: rotationDegreeS1, color: .green)
            Image(systemName: "checkmark")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.green)
        }
        .frame(width: 50, height: 50)
        .onAppear() {
            self.animationSpinner()
            Timer.scheduledTimer(withTimeInterval: animationTime, repeats: false) { _ in
                self.animationSpinner()
            }
        }
    }
    
    func animationSpinner(with duration: Double, completion: @escaping( () -> Void)) {
        Timer.scheduledTimer(withTimeInterval: duration, repeats: false) { _ in
            withAnimation(.easeInOut(duration: self.rotationTime + 1)) {
                completion()
            }
        }
    }
    
    func animationSpinner() {
        animationSpinner(with: rotationTime) { self.spinnerEndS1 = 1.0 }
        animationSpinner(with: (rotationTime * 2) - 0.025) {
            self.rotationDegreeS1 += fullrotation
            self.spinnerEnd2S3 = 0.8
        }
        
//        animationSpinner(with: (rotationTime * 2)) {
//            self.spinnerEndS1 = 0.03
//            self.spinnerEnd2S3 = 0.03
//        }
//        animationSpinner(with: (rotationTime * 2) + 0.0525) {
//            self.rotationDegreeS2 += fullrotation
//        }
//        animationSpinner(with: (rotationTime * 2) + 0.225) {
//            self.rotationDegreeS3 += fullrotation
//        }
    }
}


struct CircleShape: View {
    
    let start: Double
    let end: Double
    let rotation: Angle
    let color: Color
    
    var body: some View {
        Circle()
            .trim(from: start, to: end)
            .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round))
            .fill(color)
            .rotationEffect(rotation)
    }
}



#Preview {
    CustomLoader2()
}


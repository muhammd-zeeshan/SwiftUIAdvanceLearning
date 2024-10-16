//
//  UseProtocol.swift
//  SwiftUIAdvanceLearning
//
//  Created by Muhammad Zeeshan on 04/10/2024.
//

import SwiftUI

struct DefaultColorTheme: ColorThemeProtocol {
    let primary: Color = .blue
    let secondary: Color = .white
    let tertiary: Color = .gray
}

struct AlternativeColorTheme: ColorThemeProtocol {
    let primary: Color = .red
    let secondary: Color = .white
    let tertiary: Color = .green
}

protocol ColorThemeProtocol {
    var primary: Color { get }
    var secondary: Color { get }
    var tertiary: Color { get }
}

protocol ButtonTextProtocol {
    var buttonText: String { get }
}

protocol ButtonPressed {
    func buttonPressed()
}

class DefaultDataSource: ButtonTextProtocol, ButtonPressed {
    var buttonText: String = "Protocols are awsome"
    
    func buttonPressed() {
        print("Button was pressed")
    }
}

class AlternativeDataSource: ButtonTextProtocol {
       
    var buttonText: String = "Protocols are lame"

}

struct UseProtocol: View {
//    let colorTheme: DefaultColorTheme = DefaultColorTheme()
//    let colorTheme: AlternativeColorTheme = AlternativeColorTheme()
    let colorTheme: ColorThemeProtocol
    let dataSource: ButtonTextProtocol
    let dataSource2: ButtonPressed
    
    var body: some View {
        ZStack {
            colorTheme.tertiary
                .ignoresSafeArea()
            
            Text(dataSource.buttonText)
                .font(.headline)
                .foregroundStyle(colorTheme.secondary)
                .padding()
                .background(colorTheme.primary)
                .cornerRadius(10)
                .onTapGesture {
                    dataSource2.buttonPressed()
                }
        }
    }
}

#Preview {
    UseProtocol(colorTheme: DefaultColorTheme(), dataSource: DefaultDataSource(), dataSource2: DefaultDataSource())
}

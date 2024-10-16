//
//  UsePrefrenceKey.swift
//  SwiftUIAdvanceLearning
//
//  Created by Muhammad Zeeshan on 01/10/2024.
//

import SwiftUI

struct UsePrefrenceKey: View {
    @State private var text: String = "Hello world"
    
    var body: some View {
        NavigationView {
            VStack {
                SecondaryScreen(text: text)
                    .navigationTitle("Navigation Title")
            }
        }
        .onPreferenceChange(CustomTitlePrefrenceKeyfile.self) { value in
            self.text = value
        }
    }
}

#Preview {
    UsePrefrenceKey()
}


extension View {
    
    func customTitle(_ text : String) -> some View {
        self
            .preference(key: CustomTitlePrefrenceKeyfile.self, value: text)
    }
    
}


struct SecondaryScreen: View {
    let text: String
    @State private var newValue: String = ""
    
    var body: some View {
        Text(text)
            .onAppear(perform: getDataFromBase)
            .customTitle(newValue)
    }
    
    func getDataFromBase() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.newValue = "New value From Database"
        }
    }
}


struct CustomTitlePrefrenceKeyfile: PreferenceKey {
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}


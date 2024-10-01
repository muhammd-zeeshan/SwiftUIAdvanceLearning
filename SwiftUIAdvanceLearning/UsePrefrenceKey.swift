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
        NavigationStack {
            VStack {
                SecondaryScreen(text: text)
                    .navigationTitle("Navigation Title")
                    .customTitle("NEW VALUE")
            }
        }
        .onPreferenceChange(CustomTitlePrefrenceKey.self) { value in
            self.text = value
        }
    }
}

extension View {
    func customTitle(_ text: String) -> some View {
        preference(key: CustomTitlePrefrenceKey.self, value: text)
    }
}

#Preview {
    UsePrefrenceKey()
}


struct SecondaryScreen: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
}


struct CustomTitlePrefrenceKey: PreferenceKey {
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}


// MARK: Skip for now

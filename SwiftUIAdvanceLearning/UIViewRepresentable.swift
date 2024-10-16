//
//  UIViewRepresentable.swift
//  SwiftUIAdvanceLearning
//
//  Created by Muhammad Zeeshan on 04/10/2024.
//

import SwiftUI

struct UIViewRepresentableBootCamp: View {
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            Text(text)
            
            HStack {
                Text("SwiftUi View")
                TextField("Type Here...", text: $text)
                    .frame(height: 55)
                    .padding(.leading, 5)
                    .background(Color.gray.opacity(0.5))
            }
            
            HStack {
                Text("UiKit View")
                UiTextFieldViewRepresentable(text: $text)
                    .frame(height: 55)
                    .padding(.leading, 5)
                    .background(Color.gray.opacity(0.5))
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    UIViewRepresentableBootCamp()
}


struct UiTextFieldViewRepresentable: UIViewRepresentable {
    @Binding var text: String
    
    func makeUIView(context: Context) -> UITextField {
        let textField = getTextField()
        textField.delegate = context.coordinator
        return textField
    }
    
    // MARK: Used for send Data from SwiftUI to UIKit
//    func updateUIView(_ uiView: UIViewType, context: Context) {
//        
//    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    func getTextField() -> UITextField {
        let textField = UITextField(frame: .zero)
        let placeHolder = NSAttributedString(
            string: "Type Here...",
            attributes: [
                .foregroundColor : UIColor.black
            ])
        textField.attributedPlaceholder = placeHolder
        return textField
    }
    
    // MARK: Used for send Data from UIKit to SwiftUI
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var text: String
        
        init(text: Binding<String>) {
            self._text = text
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            self.text = textField.text ?? ""
        }
    }
    
}



struct BasicUIViewRepresentable: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        view.backgroundColor = .red
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
}



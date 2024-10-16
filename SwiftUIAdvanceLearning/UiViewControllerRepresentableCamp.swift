//
//  UiViewControllerRepresentableCamp.swift
//  SwiftUIAdvanceLearning
//
//  Created by Muhammad Zeeshan on 04/10/2024.
//

import SwiftUI

struct UiViewControllerRepresentableCamp: View {
    
    @State private var showScreen: Bool = false
    @State private var image: UIImage? = nil
    
    var body: some View {
        VStack {
            Text("Hello, World!")
            
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
            
            Button {
                showScreen.toggle()
            } label: {
                Text("Click Here!")
            }
            .sheet(isPresented: $showScreen) {
//                BasicUiViewControllerRepresentable(labelText: "Hello Zeeshan")
                UiImagePickerControllerRepresentable(image: $image, showScreen: $showScreen)
            }
        }
    }
}

#Preview {
    UiViewControllerRepresentableCamp()
}


struct UiImagePickerControllerRepresentable: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Binding var showScreen: Bool
    
    func makeUIViewController(context: Context) -> some UIImagePickerController {
        let vc = UIImagePickerController()
        vc.allowsEditing = false
        vc.delegate = context.coordinator
        return vc
    }
    // Used to send Data from SwiftUi to Uikit
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    // Used to send Data from UiKit to swiftUi
    func makeCoordinator() -> Coordinator {
        return Coordinator(image: $image, showScreen: $showScreen)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        @Binding var image: UIImage?
        @Binding var showScreen: Bool
        
        init(image: Binding<UIImage?>, showScreen: Binding<Bool>) {
            self._image = image
            self._showScreen = showScreen
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let newImage = info[.originalImage] as? UIImage else { return }
            
            self.image = newImage
            self.showScreen = false
        }
    }
}


struct BasicUiViewControllerRepresentable: UIViewControllerRepresentable {
    let labelText: String
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let vc = MyFirstViewController()
        vc.labelText = labelText
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    class MyFirstViewController: UIViewController {
        var labelText: String = "Starting Value"
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            view.backgroundColor = .blue
            
            let lable = UILabel()
            lable.text = labelText
            lable.textColor = .white
            
            view.addSubview(lable)
            lable.frame = view.frame
        }
        
    }
    
}

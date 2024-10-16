//
//  UITestingView.swift
//  SwiftUIAdvanceLearning
//
//  Created by Muhammad Zeeshan on 06/10/2024.
//

import SwiftUI

class UiTestingViewModel: ObservableObject {
    let placeholder: String = "Add your name..."
    
    @Published var textFieldText: String = ""
    @Published var currentUserSignedIn: Bool = false
    
    func signUpButtPressed() {
        guard !textFieldText.isEmpty else { return }
        currentUserSignedIn = true
    }
}

struct UITestingView: View {
    @StateObject private var vm = UiTestingViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.blue, Color.black], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            ZStack {
                if vm.currentUserSignedIn {
                    SignedInHomeView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .transition(.move(edge: .trailing))
                }
                
                if !vm.currentUserSignedIn {
                    signUpLayer
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .transition(.move(edge: .leading))
                }
            }
        }
    }
}

#Preview { 
    UITestingView()
}


extension UITestingView {
    private var signUpLayer: some View {
        VStack {
            TextField(vm.placeholder, text: $vm.textFieldText)
                .font(.headline)
                .padding()
                .background(Color.white)
                .cornerRadius(20)
            
            Button {
                withAnimation(.spring) {
                    vm.signUpButtPressed()
                }
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(Color.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}


struct SignedInHomeView: View {
    @State private var showAlert: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Button {
                    showAlert.toggle()
                } label: {
                    Text("Show Welcome Alert")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(Color.white)
                        .background(Color.red)
                        .cornerRadius(10)
                }
                .alert("Wellcome to the App!", isPresented: $showAlert) {
                    Button {
                        showAlert.toggle()
                    } label: {
                        Text("Ok")
                    }
                }
                
                NavigationLink {
                    Text("Destination")
                } label: {
                    Text("Navigate")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(Color.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }

            }
            .padding()
            .navigationTitle("WellCome Screee")
        }
    }
}

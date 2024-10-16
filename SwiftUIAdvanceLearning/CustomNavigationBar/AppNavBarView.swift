//
//  AppNavBarView.swift
//  SwiftUIAdvanceLearning
//
//  Created by Muhammad Zeeshan on 02/10/2024.
//

import SwiftUI

struct AppNavBarView: View {
    
    
    var body: some View {
        CustomNavView {
            ZStack {
                Color.yellow.ignoresSafeArea()
                
                NavigationLink {
                    Text("Destination")
                } label: {
                    Text("Navigate")
                }
            }
        }
    }
}
    
    #Preview {
        AppNavBarView()
    }


extension AppNavBarView {
    private var defaultnavView: some View {
        NavigationStack {
            ZStack {
                Color.green.ignoresSafeArea()
                
                NavigationLink {
                    Text("Destination")
                } label: {
                    Text("Navigate")
                }

            }
            .navigationTitle("Nav Title Here")
        }

    }
}

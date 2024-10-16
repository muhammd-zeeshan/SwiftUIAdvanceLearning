//
//  UseViewBuilder.swift
//  SwiftUIAdvanceLearning
//
//  Created by Muhammad Zeeshan on 01/10/2024.
//

import SwiftUI

struct HeaderViewRegular: View {
    let title: String
    let description: String?
    let iconName: String?
    
    var body: some View {
        VStack(alignment: .leading){
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            if let description = description{
                Text(description)
                    .font(.callout)
            }
            
            if let icon = iconName {
                Image(systemName: icon)
            }
            
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}


struct HeaderViewGeneric<Content: View>: View {
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: ()-> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            content
            
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct UseViewBuilder: View {
    var body: some View {
        VStack {
            HeaderViewRegular(title: "Title", description: "Description", iconName: "heart.fill")
            HeaderViewRegular(title: "Another Title", description: nil, iconName: nil)
            
            HeaderViewGeneric(title: "Generic Title") {
//                Text("Hello")
//                Image(systemName: "heart.fill")
                
                HStack {
                    Text("Description")
                    Image(systemName: "heart.fill")
                }
            }
           
            Spacer()
        }
    }
}

#Preview {
    UseViewBuilder()
//    LocalViewbuilder(type: .Three)
}


struct LocalViewbuilder: View {
    
    enum ViewType {
        case one, Two, Three
    }
    
    let type : ViewType
    
    var body: some View {
        headerView
    }
    
    @ViewBuilder private var headerView: some View {
        switch type {
        case .one:
            ViewOne
        case .Two:
            ViewTwo
        case .Three:
            ViewThree
        }
    }
    
    private var ViewOne: some View {
        Text("One")
    }
    
    private var ViewTwo: some View {
        HStack {
            Text("Two")
            
            Image(systemName: "heart.fill")
        }
    }
    
    private var ViewThree: some View {
        VStack {
            Text("View Three")
            Image(systemName: "house.fill")
        }
    }
}

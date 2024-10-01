//
//  TabBarItem.swift
//  SwiftUIAdvanceLearning
//
//  Created by Muhammad Zeeshan on 01/10/2024.
//

import Foundation
import SwiftUI


enum TabBarItem: Hashable {
    case home, favourite, profile
    
    var iconName: String {
        switch self {
        case .home: return "house.fill"
        case .favourite: return "star.fill"
        case .profile: return "person"
        }
    }
    
    var title: String {
        switch self {
        case .home : return "Home"
        case .favourite: return "Favourite"
        case .profile: return "Profile"
        }
    }
    
    var color: Color {
        switch self {
        case .home: return .blue
        case .favourite: return .red
        case .profile: return .green
        }
    }
}

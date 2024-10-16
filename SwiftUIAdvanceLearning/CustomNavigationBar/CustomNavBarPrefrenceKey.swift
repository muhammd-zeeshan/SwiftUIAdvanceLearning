//
//  CustomNavBarPrefrenceKey.swift
//  SwiftUIAdvanceLearning
//
//  Created by Muhammad Zeeshan on 02/10/2024.
//

import Foundation
import SwiftUI


struct CustomNavBarTitlePrefrenceKey: PreferenceKey {
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}


struct CustomNavBarSubTitlePrefrenceKey: PreferenceKey {
    static var defaultValue: String? = nil
    
    static func reduce(value: inout String?, nextValue: () -> String?) {
        value = nextValue()
    }
}

struct CustomNavBarBackButtonPrefrenceKey: PreferenceKey {
    static var defaultValue: Bool = false
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}


extension View {
    
    func customNavBarTitle(_ title: String) -> some View {
        preference(key: CustomNavBarTitlePrefrenceKey.self, value: title)
    }
    
    func customNavBarSubTitle(_ subTitle: String?) -> some View {
        preference(key: CustomNavBarSubTitlePrefrenceKey.self, value: subTitle)
    }
    
    func customNavBarBackButtonHidden(_ hidden: Bool) -> some View {
        self
            .preference(key: CustomNavBarBackButtonPrefrenceKey.self, value: hidden)
    }
    
    func customNavBarItems(title: String = "", subTitle: String? = nil, backButtonHidden: Bool = false) -> some View {
        self
            .customNavBarTitle(title)
            .customNavBarSubTitle(subTitle)
            .customNavBarBackButtonHidden(backButtonHidden)
    }
    
}

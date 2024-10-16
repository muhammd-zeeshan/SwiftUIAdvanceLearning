//
//  UnitTestingView.swift
//  SwiftUIAdvanceLearning
//
//  Created by Muhammad Zeeshan on 05/10/2024.
//

import SwiftUI

struct UnitTestingView: View {
    @StateObject var vm: UnitTestingViewModel
    
    init(isPremium: Bool) {
        _vm = StateObject(wrappedValue: UnitTestingViewModel(isPremium: isPremium))
    }
    
    var body: some View {
        Text(vm.isPremium.description)
    }
}

#Preview {
    UnitTestingView(isPremium: true)
}

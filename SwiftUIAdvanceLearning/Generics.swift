//
//  Generics.swift
//  SwiftUIAdvanceLearning
//
//  Created by Muhammad Zeeshan on 30/09/2024.
//

import SwiftUI

struct Stringmodel {
    let info: String?
    
    func removeInfo() -> Stringmodel {
        Stringmodel(info: nil)
    }
}

struct BoolModel {
    let info: Bool?
    
    func removeInfo() -> BoolModel {
        BoolModel(info: nil)
    }
}

// MARK: Single Generic Model that hold and perform action on any type
struct GenericModel<CustomType> {
    let info: CustomType?
    
    func removeInfo() -> GenericModel {
        GenericModel(info: nil)
    }
}

class GenericsViewModel: ObservableObject {
   
    @Published var stringModel = Stringmodel(info: "hello World")
    @Published var boolModel = BoolModel(info: true)
    
    @Published var genericStringInfo = GenericModel(info: "Its a Generic")
    @Published var genericBoolInfo = GenericModel(info: true)
    
    func removeData() {
        stringModel = stringModel.removeInfo()
        boolModel = boolModel.removeInfo()
        
        genericStringInfo = genericStringInfo.removeInfo()
        genericBoolInfo = genericBoolInfo.removeInfo()
    }
}

// MARK: Also we able to create Generic View to add another view when i use this view
struct GenericView<T:View> : View {
    
    let title: String
    let content: T
    
    var body: some View {
        VStack {
            Text(title)
            
            content
        }
    }
}

struct Generics: View {
    @StateObject private var vm = GenericsViewModel()
    
    var body: some View {
        VStack {
            GenericView(title: "Custom view!", content: Text("This is custom View content"))
            
            Text(vm.stringModel.info ?? "no data")
            Text(vm.boolModel.info?.description ?? "no Data")
            
            Text(vm.genericStringInfo.info ?? "no data")
            Text(vm.genericBoolInfo.info?.description ?? "no Data")
               
        }
        .onTapGesture {
            vm.removeData()
        }
    }
}

#Preview {
    Generics()
}

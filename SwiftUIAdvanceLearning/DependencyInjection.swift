//
//  DependencyInjection.swift
//  SwiftUIAdvanceLearning
//
//  Created by Muhammad Zeeshan on 05/10/2024.
//

import SwiftUI
import Combine

// MARK: Problems With Singleton
// 1. Singletons are global
// 2. Cant Customize the init!
// 3. Cant Swap out service

struct PostModel: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

protocol DataService {
    func getData() -> AnyPublisher<[PostModel], Error>
}

class ProductionDataService: DataService {
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func getData() -> AnyPublisher<[PostModel], Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map({ $0.data })
            .decode(type: [PostModel].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

class MockDataService: DataService {
    
    let testData: [PostModel] = [
        PostModel(userId: 1, id: 1, title: "one", body: "one"),
        PostModel(userId: 2, id: 2, title: "Two", body: "Two"),
    ]
    
    func getData() -> AnyPublisher<[PostModel], any Error> {
        Just(testData)
            .tryMap({ $0 })
            .eraseToAnyPublisher()
    }
    
    
}


class DependencyInjectionViewModel: ObservableObject {
    
    @Published var dataArray: [PostModel] = []
    var cancelable = Set<AnyCancellable>()
    let dataService: DataService
    
    init(dataService: DataService) {
        self.dataService = dataService
        loadPosts()
    }
    
    func loadPosts() {
        dataService.getData()
            .sink { _ in
                
            } receiveValue: { [weak self] returndePosts in
                self?.dataArray = returndePosts
            }
            .store(in: &cancelable)
    }
}

struct DependencyInjection: View {
    
    @StateObject private var vm: DependencyInjectionViewModel
    
    init(dataService: DataService) {
        _vm = StateObject(wrappedValue: DependencyInjectionViewModel(dataService: dataService))
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(vm.dataArray) { post in
                    Text(post.title)
                }
            }
        }
    }
}

#Preview {
//    let dataService = ProductionDataService(url: URL(string: "https://jsonplaceholder.typicode.com/posts")!)
    let dependencyDataService = MockDataService()
    
    DependencyInjection(dataService: dependencyDataService)
}

//
//  MockDataServices.swift
//  SwiftUIAdvanceLearning
//
//  Created by Muhammad Zeeshan on 06/10/2024.
//

import Foundation
import SwiftUI
import Combine


protocol NewDataServiceProtocol {
    
    func downloadItemWithEscaping(completion: @escaping (_ items: [String]) -> Void)
    func downloadItemsWithCombine() -> AnyPublisher<[String], Error>
}

class NewMockDataService: NewDataServiceProtocol {
    
    let items: [String]
    
    init(items: [String]?) {
        self.items = items ?? [
            "One", "Two", "Three"
        ]
    }
    
    func downloadItemWithEscaping(completion: @escaping (_ items: [String]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            completion(self.items)
        }
    }
    
    func downloadItemsWithCombine() -> AnyPublisher<[String], Error> {
        Just(items)
            .tryMap({ publishedItem in
                guard !publishedItem.isEmpty else {
                    throw URLError(.badServerResponse)
                }
                return publishedItem
            })
            .eraseToAnyPublisher()
    }
    
}

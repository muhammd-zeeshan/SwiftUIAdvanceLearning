//
//  NewMockDataService_Test.swift
//  SwiftUIAdvanceLearning_Tests
//
//  Created by Muhammad Zeeshan on 06/10/2024.
//

import XCTest
import Combine
@testable import SwiftUIAdvanceLearning

class NewMockDataService_Test: XCTestCase {
    
    var cancelable = Set<AnyCancellable>()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        cancelable.removeAll()
    }

    func test_NewMockDataService_init_doesSetValueCorrectly() {
        //Given
        let items: [String]? = nil
        //When
        let dataService = NewMockDataService(items: items)
        
        //Then
        XCTAssertFalse(dataService.items.isEmpty)
    }
    
    func test_NewMockDataService_downloadItemsWithEscaping_doesReturnValueCorrectly() {
        //Given
        let dataService = NewMockDataService(items: nil)
        
        //When
        var returnitems: [String] = []
        let expectation = XCTestExpectation()
        dataService.downloadItemWithEscaping { items in
            returnitems = items
            expectation.fulfill()
        }
        
        //Then
        wait(for: [expectation], timeout: 5)
        XCTAssertEqual(returnitems.count, dataService.items.count)
    }
    
    func test_NewMockDataService_downloadItemsWithCombine_doesReturnValueCorrectly() {
        //Given
        let dataService = NewMockDataService(items: nil)
        
        //When
        var returnitems: [String] = []
        let expectation = XCTestExpectation()
        dataService.downloadItemsWithCombine()
            .sink { comp in
                switch comp {
                case .finished:
                    expectation.fulfill()
                case .failure:
                    XCTFail()
                }
            } receiveValue: { items in
                returnitems = items
            }
            .store(in: &cancelable)

        
        //Then
        wait(for: [expectation], timeout: 5)
        XCTAssertEqual(returnitems.count, dataService.items.count)
    }
    
    func test_NewMockDataService_downloadItemsWithCombine_doesFail() {
        //Given
        let dataService = NewMockDataService(items: [])
        
        //When
        var returnitems: [String] = []
        let expectation = XCTestExpectation()
        dataService.downloadItemsWithCombine()
            .sink { comp in
                switch comp {
                case .finished:
                    XCTFail()
                case .failure:
                    expectation.fulfill()
                }
            } receiveValue: { items in
                returnitems = items
            }
            .store(in: &cancelable)

        
        //Then
        wait(for: [expectation], timeout: 5)
        XCTAssertEqual(returnitems.count, dataService.items.count)
    }

}

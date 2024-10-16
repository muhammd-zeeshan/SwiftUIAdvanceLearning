//
//  UnitTestingViewModel_Test.swift
//  SwiftUIAdvanceLearning_Tests
//
//  Created by Muhammad Zeeshan on 05/10/2024.
//

import XCTest
@testable import SwiftUIAdvanceLearning
import Combine

// Naming Structure: test_UnitOfWork_StateUnderTest_ExpectedBehavior
// Naming Structure: test_[struch or class]_[variable or function]_[expected result]

// Testing Structure: Given, When, Then

class UnitTestingViewModel_Test: XCTestCase {
    
    var viewModel: UnitTestingViewModel?
    var cancelable = Set<AnyCancellable>()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = UnitTestingViewModel(isPremium: Bool.random())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }

    func test_UnitTestingViewModel_isPremium_shouldBeTrue() {
        
        // Given
        let userIsPremium = true
        // When
        let vm = UnitTestingViewModel(isPremium: userIsPremium)
        // Then
        XCTAssertTrue(vm.isPremium)
    }
    
    func test_UnitTestingViewModel_isPremium_shouldBeFalse() {
        //Give
        let userIsPremium = false
        
        //When
        let vm = UnitTestingViewModel(isPremium: userIsPremium)
        
        //Then
        XCTAssertFalse(vm.isPremium)
    }
    
    func test_UnitTestingViewModel_isPremium_shouldBeInjectedValue() {
        //Give
        let userIsPremium = Bool.random()
        
        //When
        let vm = UnitTestingViewModel(isPremium: userIsPremium)
        
        //Then
        XCTAssertEqual(vm.isPremium, userIsPremium)
    }
    
    func test_UnitTestingViewModel_isPremium_shouldBeInjectedValue_stress() {
        for _ in 0..<10 {
            //Give
            let userIsPremium = false
            
            //When
            let vm = UnitTestingViewModel(isPremium: userIsPremium)
            
            //Then
            XCTAssertFalse(vm.isPremium)
        }
    }
    
    func test_UnitTestingViewModel_dataArray_shouldBeEmpty() {
        
        // Give
        
        // When
        let vm = UnitTestingViewModel(isPremium: Bool.random())
        //Then
        XCTAssertTrue(vm.dataArray.isEmpty)
        XCTAssertEqual(vm.dataArray.count,0)
    }
    
    func test_UnitTestingViewModel_dataArray_shouldBeAddItem() {
        
        // Give
        let vm = UnitTestingViewModel(isPremium: Bool.random())
        // When
        vm.addItem(item: "Hello")
        //Then
        XCTAssertTrue(!vm.dataArray.isEmpty)
        XCTAssertFalse(vm.dataArray.isEmpty)
        XCTAssertEqual(vm.dataArray.count, 1)
        XCTAssertNotEqual(vm.dataArray.count, 0)
        XCTAssertGreaterThan(vm.dataArray.count, 0)
    }
    
    func test_UnitTestingViewModel_selectedItem_shouldStartAsNill() {
        //Given
        
        //When
        let vm = UnitTestingViewModel(isPremium: Bool.random())
        
        //Then
        XCTAssertTrue(vm.selected == nil)
        XCTAssertNil(vm.selected)
    }
    
    func test_UnitTestingViewModel_selectedItem_shouldBeNillWhenSelectionInvalidItem() {
        //Given
        let vm = UnitTestingViewModel(isPremium: Bool.random())
        //When
        vm.selectItem(item: UUID().uuidString)
        
        //Then
        XCTAssertNil(vm.selected)
    }
    
    func test_UnitTestingViewModel_selectedItem_shouldBeSelected() {
        //Given
        let vm = UnitTestingViewModel(isPremium: Bool.random())
        //When
        let newItem = UUID().uuidString
        vm.dataArray.append(newItem)
        vm.selectItem(item: newItem)
        
        //Then
        XCTAssertNotNil(vm.selected)
        XCTAssertEqual(vm.selected, newItem)
    }
    
    func test_UnitTestingViewModel_selectedItem_shouldBeSelected_stress() {
        //Given
        let vm = UnitTestingViewModel(isPremium: Bool.random())
        
        //When
        let loopCount: Int = Int.random(in: 1..<100)
        var itemsArray: [String] = []
        
        for _ in 0..<loopCount {
            let newItem = UUID().uuidString
            vm.dataArray.append(newItem)
            itemsArray.append(newItem)
        }
        
        let randomItem = itemsArray.randomElement() ?? ""
        vm.selectItem(item: randomItem)
        
        //Then
        XCTAssertNotNil(vm.selected)
        XCTAssertEqual(vm.selected, randomItem)
    }
    
    func test_UnitTestingViewModel_saveedItem_shouldThrowErroe_itemNotFound() {
        //Given
        let vm = UnitTestingViewModel(isPremium: Bool.random())
        
        //When
        let loopCount: Int = Int.random(in: 1..<100)
        
        for _ in 0..<loopCount {
            vm.addItem(item: UUID().uuidString)
        }
        
        //Then
        XCTAssertThrowsError(try vm.saveItem(item: UUID().uuidString))
        XCTAssertThrowsError(try vm.saveItem(item: UUID().uuidString), "Should Throw Item Not Found") { error in
            let returnedError = error as? UnitTestingViewModel.DataError
            XCTAssertEqual(returnedError, UnitTestingViewModel.DataError.itemNotFound)
        }
    }
    
    func test_UnitTestingViewModel_saveedItem_shouldThrowErroe_noData() {
        //Given
        let vm = UnitTestingViewModel(isPremium: Bool.random())
        
        //When
        let loopCount: Int = Int.random(in: 1..<100)
        
        for _ in 0..<loopCount {
            vm.addItem(item: UUID().uuidString)
        }
        
        //Then
        do {
            try vm.saveItem(item: "")
        } catch let error {
            let returnedError = error as? UnitTestingViewModel.DataError
            XCTAssertEqual(returnedError, UnitTestingViewModel.DataError.noData)
        }
    }
    
    func test_UnitTestingViewModel_saveedItem_shouldSaveItem_savedItem() {
        //Given
        let vm = UnitTestingViewModel(isPremium: Bool.random())
        
        //When
        let loopCount: Int = Int.random(in: 1..<100)
        var itemArray: [String] = []
        
        for _ in 0..<loopCount {
            let newItem = UUID().uuidString
            vm.addItem(item: newItem)
            itemArray.append(newItem)
        }
        let randomItem = itemArray.randomElement() ?? ""
        
        //Then
//        XCTAssertNoThrow(try vm.saveItem(item: randomItem))
        
        // Instead of these we can also able to use this way
        do {
            try vm.saveItem(item: randomItem)
        } catch {
            XCTFail()
        }
        
    }
    
    func test_UnitTestingViewModel_downloadWithEscaping_shouldReturnItems() {
       
        //Given
        let vm = UnitTestingViewModel(isPremium: Bool.random())

        //When
        let expectation = XCTestExpectation(description: "Return result after 3 second")
        vm.$dataArray
            .dropFirst()
            .sink { returnedItems in
                expectation.fulfill()
            }
            .store(in: &cancelable)
        
        vm.downloadWithEscaping()
        
        //Then
        wait(for: [expectation], timeout: 5)
        XCTAssertGreaterThan(vm.dataArray.count, 0)
    }
    
    func test_UnitTestingViewModel_downloadWithCombine_shouldReturnItems() {
       
        //Given
        let vm = UnitTestingViewModel(isPremium: Bool.random())

        //When
        let expectation = XCTestExpectation(description: "Return result after a second")
        vm.$dataArray
            .dropFirst()
            .sink { returnedItems in
                expectation.fulfill()
            }
            .store(in: &cancelable)
        
        vm.downloadWithCombine()
        
        //Then
        wait(for: [expectation], timeout: 5)
        XCTAssertGreaterThan(vm.dataArray.count, 0)
    }
}

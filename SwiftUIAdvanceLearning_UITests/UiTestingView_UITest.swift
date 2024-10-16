//
//  UiTestingView_UITest.swift
//  SwiftUIAdvanceLearning_UITests
//
//  Created by Muhammad Zeeshan on 06/10/2024.
//

import XCTest

final class UiTestingView_UITest: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_UiTestingView_signUpButton_shouldNotSignIn() {
        
    }
    
    func test_UiTestingView_signUpButton_shouldSignIn() {
        //Given
        app.textFields["Add your name..."].tap()
        
        //When
        let aKey = app.keys["A"]
        aKey.tap()
        let keya = app.keys["a"]
        keya.tap()
        keya.tap()

        app.buttons["Return"].tap()
        app.buttons["Sign Up"].tap()
        let navBar = app.navigationBars["WellCome Screee"]
        
        //Then
        XCTAssertTrue(navBar.exists)
    }
}

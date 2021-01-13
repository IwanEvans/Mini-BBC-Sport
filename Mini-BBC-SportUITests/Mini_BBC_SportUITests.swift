//
//  Mini_BBC_SportUITests.swift
//  Mini-BBC-SportUITests
//
//  Created by IWAN EVANS on 07/01/2021.
//

import XCTest

class Mini_BBC_SportUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testSignInScreenIsDismissable() {
        
        let app = XCUIApplication()
        app.launch()
        
        pause(.long)
        
        app.buttons["skip-button"].tap()
        
        
        
        XCTAssertTrue(app.staticTexts["Topics"].isHittable)
        
        
    }


}

enum Delay {
    case short
    case long
    case veryLong
    case forever
    case custom(Int)
    var seconds: Int {
        switch self {
        case .short:            return 1
        case .long:             return 5
        case .veryLong:         return 10
        case .forever:          return 60 * 60 * 24 * 365
        case let .custom(secs): return secs
        }
    }
}
func pause(_ delay: Delay) {
    sleep(UInt32(delay.seconds))
}

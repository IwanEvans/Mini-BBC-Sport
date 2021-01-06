//
//  Mini_BBC_SportTests2.swift
//  Mini-BBC-SportTests2
//
//  Created by IWAN EVANS on 04/01/2021.
//

import XCTest
@testable import Mini_BBC_Sport

class Mini_BBC_SportTests2: XCTestCase {
    
    let mockData = ["title" : "Schumacher junior wins European F3 title with race to spare", "url" : "https://www.bbc.co.uk/sport/motorsport/45851176", "lastUpdatedTimestamp" : 1539529691, "image" : "https://ichef.bbci.co.uk/onesport/cps/320/cpsprodpb/16477/production/_103855219_schumacher.jpg"] as [String : Any]

    
    func testJSONRequest() {
        //Given
        let baseURL = "https://bbc.github.io/sport-app-dev-tech-challenge/data.json"
        //When
       
        //Then
        XCTAssertEqual(baseURL, "https://bbc.github.io/sport-app-dev-tech-challenge/data.json")()
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let ViewController = ViewController()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}

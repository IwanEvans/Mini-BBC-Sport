//
//  StatsManagerTests.swift
//  Mini-BBC-SportTests
//
//  Created by IWAN EVANS on 11/01/2021.
//

import XCTest
@testable import Mini_BBC_Sport

class StatsManagerTests: XCTestCase {
    
    

    func testStatsSendsCorrectURL() {
        
        let statsManger = StatsManager()
         
        let mockURLSession = MockURLSession()
        
        statsManger.sendStat(stat: .success(10), urlSession: mockURLSession)
        
        let expectedURLs = ["https://bbc.github.io/sport-app-dev-tech-challenge/stats?event=pageLoadSuccess&data=10"]
        
        XCTAssertEqual(mockURLSession.urlsCalled, expectedURLs)
        
    }
    
    func testStatsSendsCorrectFailureURL() {
        
        let statsManager = StatsManager()
        
        let mockURLSession = MockURLSession()
        
        statsManager.sendStat(stat: .failure(10), urlSession: mockURLSession)
        
        let expectedURLs = ["https://bbc.github.io/sport-app-dev-tech-challenge/stats?event=pageLoadFailure&data=10"]
        
        XCTAssertEqual(mockURLSession.urlsCalled, expectedURLs)
        
    }
    
    func testStatsSendsCorrectTappedURL() {
        
        let statsManager = StatsManager()
        
        let mockURLSession = MockURLSession()
        
        statsManager.sendStat(stat: .tapped("https://www.bbc.co.uk/sport/motorsport/45851176"), urlSession: mockURLSession)
        
        let expectedURLs = ["https://bbc.github.io/sport-app-dev-tech-challenge/stats?event=articleTapped&data=https://www.bbc.co.uk/sport/motorsport/45851176"]
        
        XCTAssertEqual(mockURLSession.urlsCalled, expectedURLs)
        
    }

}

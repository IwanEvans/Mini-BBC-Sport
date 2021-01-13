//
//  DataManagerTests.swift
//  Mini-BBC-SportTests2
//
//  Created by IWAN EVANS on 07/01/2021.
//

import XCTest

@testable import Mini_BBC_Sport

class DataManagerTests: XCTestCase {
    
    func testaddition() {
        
        XCTAssertEqual(2,2)
        
    }
    
    func testDataManagerParsesValidData() {
        
        let dataManager = DataManager()
        
        let validJSONString = """
            
           {
              "data":{
                 "topic":{
                    "title":"Formula 1",
                    "url":"https://www.bbc.co.uk/sport/formula1"
                 },
                 "items":[
                    {
                       "type":"story",
                       "title":"Schumacher junior wins European F3 title with race to spare",
                       "url":"https://www.bbc.co.uk/sport/motorsport/45851176",
                       "sectionLabel":"Formula 1",
                       "sectionUrl":"https://www.bbc.co.uk/sport/formula1",
                       "isLive":false,
                       "lastUpdatedText":"18h",
                       "mediaType":null,
                       "contentType":null,
                       "lastUpdatedTimestamp":1539529691,
                       "image":{
                          "small":"https://ichef.bbci.co.uk/onesport/cps/320/cpsprodpb/16477/production/_103855219_schumacher.jpg",
                          "medium":"https://ichef.bbci.co.uk/onesport/cps/512/cpsprodpb/16477/production/_103855219_schumacher.jpg",
                          "large":"https://ichef.bbci.co.uk/onesport/cps/976/cpsprodpb/16477/production/_103855219_schumacher.jpg",
                          "altText":"Mick Schumacher",
                          "copyrightHolder":"Getty Images"
                       }
                    },
                    ]
                }
            }
                    
        """
        
        let validData = validJSONString.data(using: .utf8)!
        
        let expectedItems: [Items] = [Items(title: "Schumacher junior wins European F3 title with race to spare",
                                            url: "https://www.bbc.co.uk/sport/motorsport/45851176",
                                            lastUpdatedTimestamp: 1539529691,
                                            image: Image(small: URL(string: "https://ichef.bbci.co.uk/onesport/cps/320/cpsprodpb/16477/production/_103855219_schumacher.jpg")! ))]
        
        do {
        
        let result = try dataManager.parseJSON(JSONdata: validData)
        XCTAssertEqual(result, expectedItems)
        
        } catch {
            XCTFail(error.localizedDescription)
            
        }
    }

    
    func testDataManagerParsesInvalidValidData() {
        
        let dataManager = DataManager()
        
        let validJSONString = """
            
           {
              "data":{
                 "topic":{
                    "title":"Formula 1",
                    "url":"https://www.bbc.co.uk/sport/formula1"
                 },
                 "items":[
                    {
                       "type":"story",
                       "title":"Schumacher junior wins European F3 title with race to spare",
                       "sectionLabel":"Formula 1",
                       "sectionUrl":"https://www.bbc.co.uk/sport/formula1",
                       "isLive":false,
                       "lastUpdatedText":"18h",
                       "mediaType":null,
                       "contentType":null,
                       "lastUpdatedTimestamp":1539529691,
                       "image":{
                          "small":"https://ichef.bbci.co.uk/onesport/cps/320/cpsprodpb/16477/production/_103855219_schumacher.jpg",
                          "medium":"https://ichef.bbci.co.uk/onesport/cps/512/cpsprodpb/16477/production/_103855219_schumacher.jpg",
                          "large":"https://ichef.bbci.co.uk/onesport/cps/976/cpsprodpb/16477/production/_103855219_schumacher.jpg",
                          "altText":"Mick Schumacher",
                          "copyrightHolder":"Getty Images"
                       }
                    },
                    ]
                }
            }
                    
        """
        
        let validData = validJSONString.data(using: .utf8)!
        
        let expectedItems: [Items] = [Items(title: "Schumacher junior wins European F3 title with race to spare",
                                            url: "https://www.bbc.co.uk/sport/motorsport/45851176",
                                            lastUpdatedTimestamp: 1539529691,
                                            image: Image(small: URL(string: "https://ichef.bbci.co.uk/onesport/cps/320/cpsprodpb/16477/production/_103855219_schumacher.jpg")! ))]
        
        do {
        
        let result = try dataManager.parseJSON(JSONdata: validData)
        XCTFail("Expected the parsing to fail")
        
        } catch {
            
            
        }
    }


}

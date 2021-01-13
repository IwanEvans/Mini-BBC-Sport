//
//  MockURLSession.swift
//  Mini-BBC-SportTests
//
//  Created by IWAN EVANS on 11/01/2021.
//

import Foundation

class MockURLSession: URLSession {
    
    var urlsCalled = [String]()
    
    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        
        urlsCalled.append(url.absoluteString)
        
        return MockTask(data: nil, urlResponse: nil, error: nil)
        
    }
    
    
    
}

class MockTask: URLSessionDataTask {
    private let data: Data?
    private let urlResponse: URLResponse?

    init(data: Data?, urlResponse: URLResponse?, error: Error?) {
        self.data = data
        self.urlResponse = urlResponse
    }

    override func resume() {

    }
}

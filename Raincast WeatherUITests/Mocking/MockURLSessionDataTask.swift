//
//  MockURLSessionDataTask.swift
//  Raincast Weather
//
//  Created by Malin Sundberg on 2019-01-18.
//  Copyright © 2019 Malin Sundberg. All rights reserved.
//

import Foundation

class MockURLSessionDataTask: URLSessionDataTask {
    private let url: URL
    private let json: String
    private let completion: (Data?, URLResponse?, Error?) -> Void
    
    init(url: URL, json: String, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        self.url = url
        self.json = json
        self.completion = completion
    }
    
    override func resume() {
        let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)
        let data = json.data(using: .utf8)
        
        completion(data, response, nil)
    }
}

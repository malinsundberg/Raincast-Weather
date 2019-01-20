//
//  MockURLSession.swift
//  Raincast Weather
//
//  Created by Malin Sundberg on 2019-01-18.
//  Copyright © 2019 Malin Sundberg. All rights reserved.
//

import Foundation

class MockURLSession: URLSession {
//    private let data: Data?
    private let json: String
//    private let error: Error?
    
    init(data: Data? = nil, json: String, error: Error? = nil) {
//        self.data = data
        self.json = json
//        self.error = error
    }
    
    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return MockURLSessionDataTask(url: url, json: json, completion: completionHandler)
    }
}

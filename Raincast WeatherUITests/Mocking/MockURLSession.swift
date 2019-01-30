//
//  MockURLSession.swift
//  Raincast Weather
//
//  Created by Malin Sundberg on 2019-01-18.
//  Copyright © 2019 Malin Sundberg. All rights reserved.
//

import Foundation

class MockURLSession: URLSession {
    private let json: String
    
    init(data: Data? = nil, json: String, error: Error? = nil) {
        self.json = json
    }
    
    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return MockURLSessionDataTask(url: url, json: json, completion: completionHandler)
    }
}

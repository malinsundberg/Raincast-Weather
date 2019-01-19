//
//  MockURLSession.swift
//  Raincast Weather
//
//  Created by Malin Sundberg on 2019-01-18.
//  Copyright © 2019 Malin Sundberg. All rights reserved.
//

import Foundation

class MockURLSession: URLSession {
    private let data: Data
    private let error: Error?
    
    init(data: Data, error: Error? = nil) {
        self.data = data
        self.error = error
    }
    
    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
    
        return MockURLSessionDataTask {
            completionHandler(self.data, nil, self.error)
        }
    }
}

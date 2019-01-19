//
//  MockURLSessionDataTask.swift
//  Raincast Weather
//
//  Created by Malin Sundberg on 2019-01-18.
//  Copyright © 2019 Malin Sundberg. All rights reserved.
//

import Foundation

class MockURLSessionDataTask: URLSessionDataTask {
    private let completion: () -> Void
    
    init(with completion: @escaping () -> Void) {
        self.completion = completion
    }
    
    override func resume() {
        completion()
    }
}

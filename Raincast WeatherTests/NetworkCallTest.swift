//
//  NetworkCallTest.swift
//  Raincast WeatherTests
//
//  Created by Malin Sundberg on 2019-01-19.
//  Copyright © 2019 Malin Sundberg. All rights reserved.
//

import XCTest

class NetworkCallTest: XCTestCase {

    override func setUp() {}

    override func tearDown() {}

    func testRetrieveData() {
        let data = Data(bytes: [1,2,3,4])
        
        let session = MockURLSession(data: data)
        let manager = NetworkManager(session: session)
        
        let url = URL(fileURLWithPath: "url")
        
        var result: Result = .success(data)
        manager.retrieveData(from: url) {
            result = $0
        }
        
        XCTAssertEqual(result, Result.success(data))
    }
}

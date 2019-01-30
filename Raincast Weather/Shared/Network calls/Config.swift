//
//  Config.swift
//  Raincast Weather
//
//  Created by Malin Sundberg on 2019-01-19.
//  Copyright © 2019 Malin Sundberg. All rights reserved.
//

import Foundation

struct Config {
    static let urlSession: URLSession = UITesting ? (setUpMockSessionWithData() ?? URLSession.shared) : URLSession.shared
}

private func setUpMockSessionWithData() -> MockURLSession? {
    guard let path = ProcessInfo.processInfo.environment["NetworkStubNameBundle"],
          let bundle = Bundle(path: path),
          let resource = bundle.path(forResource: ProcessInfo.processInfo.environment["NetworkStubFileNameWeather"], ofType: nil),
          let json = try? String(contentsOfFile: resource, encoding: .utf8) else {
        return nil
    }
    
    return MockURLSession(json: json)
}

private let UITesting = ProcessInfo.processInfo.environment["Environment"] == "UI-TESTING"

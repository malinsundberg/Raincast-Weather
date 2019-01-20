//
//  Config.swift
//  Raincast Weather
//
//  Created by Malin Sundberg on 2019-01-19.
//  Copyright © 2019 Malin Sundberg. All rights reserved.
//

import Foundation

struct Config {
    static let urlSession: URLSession = UITesting ? setUpMockSessionWithData() : URLSession.shared
}

private func setUpMockSessionWithData() -> MockURLSession {
    let data = String("Hello").data(using: .utf8)
    return MockURLSession(data: data)
}

private let UITesting = ProcessInfo.processInfo.arguments.contains("UI-TESTING")

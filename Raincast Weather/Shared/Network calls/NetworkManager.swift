//
//  NetworkManager.swift
//  Raincast Weather
//
//  Created by Malin Sundberg on 2019-01-17.
//  Copyright © 2019 Malin Sundberg. All rights reserved.
//

import Foundation

class NetworkManager {
    private let session: URLSession
    
    init(session: URLSession = Config.urlSession) {
        self.session = session
    }
    
    func retrieveData(from url: URL, completion: @escaping (Result) -> Void) {
        let networkTask = session.dataTask(with: url) { data, _, error in
            if let data = data {
                completion(.success(data))
            } else if let error = error {
                completion(.failure(error))
            } else {
                completion(.failure(nil))
            }
        }
        
        networkTask.resume()
    }
}

struct Config {
    static let urlSession: URLSession = UITesting() ? setUpMockSessionWithData() : URLSession.shared
}

private func setUpMockSessionWithData() -> MockURLSession {
    let data = String("Hello").data(using: .utf8)
    return MockURLSession(data: data)
}

private func UITesting() -> Bool {
    return ProcessInfo.processInfo.arguments.contains("UI-TESTING")
}

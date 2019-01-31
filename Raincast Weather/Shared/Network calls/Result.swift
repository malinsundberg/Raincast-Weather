//
//  Result.swift
//  Raincast Weather
//
//  Created by Malin Sundberg on 2019-01-19.
//  Copyright © 2019 Malin Sundberg. All rights reserved.
//

import Foundation

enum Result {
    case success(Data)
    case failure(Error?)
}

extension Result: Equatable {
    static func == (lhs: Result, rhs: Result) -> Bool {
        switch lhs {
        case .success(let lhsData):
            switch rhs {
            case .success(let rhsData):
                return lhsData == rhsData
            case .failure:
                return false
            }
        case .failure(let lhsError):
            switch rhs {
            case .success:
                return false
            case .failure(let rhsError):
                return lhsError?.localizedDescription == rhsError?.localizedDescription
            }
        }
    }
}

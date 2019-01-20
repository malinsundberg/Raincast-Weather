//
//  UITestsWithMockData.swift
//  Raincast WeatherUITests
//
//  Created by Malin Sundberg on 2019-01-19.
//  Copyright © 2019 Malin Sundberg. All rights reserved.
//

import XCTest

class UITestsWithMockData: XCTestCase {
    let app = XCUIApplication()

    override func setUp() {
        continueAfterFailure = false

        app.launchArguments += ["UI-TESTING"]
        
        app.launchEnvironment = [
            "NetworkStubNameBundle": Bundle(for: type(of: self)).bundlePath,
            "NetworkStubFileNameWeather": "MockPredictedWeather.json"
        ]
        
        app.launch()
    }

    override func tearDown() {}

    func testExample() {
        let instructionLabel = app.staticTexts["It will most likely rain today"]

        XCTAssertTrue(instructionLabel.exists)
    }

}

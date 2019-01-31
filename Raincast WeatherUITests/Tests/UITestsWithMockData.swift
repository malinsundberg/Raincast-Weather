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

        app.launchEnvironment = [
            "Environment": "UI-TESTING",
            "NetworkStubNameBundle": Bundle(for: type(of: self)).bundlePath,
            "NetworkStubFileNameWeather": "MockPredictedWeather.json"
        ]
        
        app.launch()
    }

    override func tearDown() {}

    func testExample() {
        let instructionLabel = app.staticTexts[Strings.CurrentWeatherTexts.currentWeatherVancouverText]

        XCTAssertFalse(instructionLabel.exists)
    }

}

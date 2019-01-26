//
//  Raincast_WeatherUITests.swift
//  Raincast WeatherUITests
//
//  Created by Malin Sundberg on 2018-12-25.
//  Copyright © 2018 Malin Sundberg. All rights reserved.
//

import XCTest

class Raincast_WeatherUITests: XCTestCase {
    
    private let app = XCUIApplication()

    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }
    
    func testThatInstructionTextIsDisplayed() {
        let instructionLabel = app.staticTexts[Strings.CurrentWeatherTexts.infoText]
        XCTAssertTrue(instructionLabel.exists)
    }
    
    func testThatTextFieldExists() {
        let textFieldElement = app.textFields[Strings.CurrentWeatherTexts.textFieldDefaultText]
        XCTAssertTrue(textFieldElement.exists)
    }
    
    func testThatTextFieldIsTappable() {
        let textFieldElement = app.textFields[Strings.CurrentWeatherTexts.textFieldDefaultText]
        
        XCTAssertTrue(textFieldElement.exists)
        XCTAssertTrue(textFieldElement.isEnabled)
    }
    
    func testGoButtonExists() {
        let goButton = app.navigationBars[Strings.CurrentWeatherTexts.title].buttons[Strings.CurrentWeatherTexts.goButtonTitle]
        
        XCTAssertTrue(goButton.exists)
    }
    
    func testGoButtonIsTappable() {
        let goButton = app.navigationBars[Strings.CurrentWeatherTexts.title].buttons[Strings.CurrentWeatherTexts.goButtonTitle]
        
        XCTAssertTrue(goButton.isHittable)
    }
    
    func testGoButtonDisplaysTextLabel() {
        let currentWeatherLabel = app.staticTexts[Strings.CurrentWeatherTexts.currentWeatherVancouverText]
        let detailsButton = app.buttons[Strings.CurrentWeatherTexts.detailsButtonTitle]
        
        XCTAssertFalse(currentWeatherLabel.exists)
        XCTAssertFalse(detailsButton.exists)
        
        app.navigationBars[Strings.CurrentWeatherTexts.title].buttons[Strings.CurrentWeatherTexts.goButtonTitle].tap()
        
        XCTAssertTrue(currentWeatherLabel.waitForExistence(timeout: 2))
        XCTAssertTrue(detailsButton.waitForExistence(timeout: 2))
    }
    
    func testTextFieldTapHidesElements() {
        let currentWeatherLabel = app.staticTexts[Strings.CurrentWeatherTexts.currentWeatherVancouverText]
        let detailsButton = app.buttons[Strings.CurrentWeatherTexts.detailsButtonTitle]
        
        app.navigationBars[Strings.CurrentWeatherTexts.title].buttons[Strings.CurrentWeatherTexts.goButtonTitle].tap()
        
        XCTAssertTrue(currentWeatherLabel.exists)
        XCTAssertTrue(detailsButton.exists)
        
        app.textFields.containing(.button, identifier:Strings.CurrentWeatherTexts.textFieldIdentifier).element.tap()
        
        XCTAssertFalse(currentWeatherLabel.exists)
        XCTAssertFalse(detailsButton.exists)
    }
    
    func testThatDefaultTextRemovedWhenTextFieldTapped() {
        let textFieldElement = app.textFields[Strings.CurrentWeatherTexts.textFieldDefaultText]
        let testFieldButton = app.buttons["Clear text"]
        
        XCTAssertTrue(testFieldButton.exists)
        XCTAssertTrue(testFieldButton.isEnabled)
        
        XCTAssertTrue(textFieldElement.value as? String == Strings.CurrentWeatherTexts.textFieldDefaultText)
        
        testFieldButton.tap()
        
        XCTAssertFalse(textFieldElement.exists)
    }
}

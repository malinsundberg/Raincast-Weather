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
        XCUIApplication().launch()
    }

    func testExample() {}
    
    private func tapGoButton() {
        app.navigationBars["Current Weather"].buttons["Go!"].tap()
    }
    
    func testThatInstructionTextIsDisplayed() {
        let instructionLabel = app.staticTexts[Strings.CurrentWeatherTexts.infoText]
        XCTAssertTrue(instructionLabel.exists)
    }
    
    func testThatTextFieldExists() {
        let textFieldElement = app.textFields.containing(.button, identifier:"Clear text").element
        XCTAssertTrue(textFieldElement.exists)
    }
    
    func testThatTextFieldIsTappable() {
        let textFieldElement = app.textFields.containing(.button, identifier:"Clear text").element
        
        XCTAssertTrue(textFieldElement.exists)
        XCTAssertTrue(textFieldElement.isEnabled)
        
        XCTAssertTrue(textFieldElement.value as! String == "Vancouver")
    }
    
    func testThatTextRemovedWhenTextFieldTapped() {
        let textFieldElement = app.textFields.containing(.button, identifier:"Clear text").element
        
        XCTAssertTrue(textFieldElement.exists)
        XCTAssertTrue(textFieldElement.isEnabled)
        
        XCTAssertTrue(textFieldElement.value as! String == "Vancouver")
        
        textFieldElement.tap()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            XCTAssertTrue(textFieldElement.value as! String != "Vancouver")
        })
    }
    
    func testTextFieldTapHidesElements() {
        let currentWeatherLabel = app.staticTexts[Strings.CurrentWeatherTexts.currentWeatherVancouverText]
        let detailsButton = app.buttons["Details"]
        
        tapGoButton()
        
        XCTAssertTrue(currentWeatherLabel.exists)
        XCTAssertTrue(detailsButton.exists)
        
        app.textFields.containing(.button, identifier:"Clear text").element.tap()
        
        XCTAssertFalse(currentWeatherLabel.exists)
        XCTAssertFalse(detailsButton.exists)
    }
    
    func testGoButtonExists() {
        let goButton = app.navigationBars["Current Weather"].buttons["Go!"]
        
        XCTAssertTrue(goButton.exists)
    }
    
    func testGoButtonIsTappable() {
        let goButton = app.navigationBars["Current Weather"].buttons["Go!"]
        
        XCTAssertTrue(goButton.isHittable)
    }
    
    func testGoButtonDisplaysTextLabel() {
        let currentWeatherLabel = app.staticTexts[Strings.CurrentWeatherTexts.currentWeatherVancouverText]
        let detailsButton = app.buttons["Details"]
        
        XCTAssertFalse(currentWeatherLabel.exists)
        XCTAssertFalse(detailsButton.exists)
        
        tapGoButton()
        
        XCTAssertTrue(currentWeatherLabel.exists)
        XCTAssertTrue(detailsButton.exists)
    }
    
    func testThatInfoLabelIsDisplayed() {
    }
}

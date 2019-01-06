//
//  Raincast_WeatherUITests.swift
//  Raincast WeatherUITests
//
//  Created by Malin Sundberg on 2018-12-25.
//  Copyright © 2018 Malin Sundberg. All rights reserved.
//

import XCTest

class Raincast_WeatherUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false

        XCUIApplication().launch()

    }

    func testExample() {}
    
    func testThatInstructionTextIsDisplayed() {
        let app = XCUIApplication()
        let instructionLabel = app.staticTexts[String.CurrentWeatherTexts.infoText]
        
        XCTAssertTrue(instructionLabel.exists)
    }
    
    func testThatTextFieldExists() {
        let app = XCUIApplication()
        let textFieldElement = app.textFields.containing(.button, identifier:"Clear text").element
        XCTAssertTrue(textFieldElement.exists)
    }
    
    func testThatTextFieldIsTappable() {
        let app = XCUIApplication()
        
        let textFieldElement = app.textFields.containing(.button, identifier:"Clear text").element
        
        XCTAssertTrue(textFieldElement.exists)
        XCTAssertTrue(textFieldElement.isEnabled)
        
        XCTAssertTrue(textFieldElement.value as! String == "Vancouver")
    }
    
    func testThatTextRemovedWhenTextFieldTapped() {
        let app = XCUIApplication()
        
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
        let app = XCUIApplication()
        
        let currentWeatherLabel = app.staticTexts[String.CurrentWeatherTexts.currentWeatherVancouverText]
        let detailsButton = app.buttons["Details"]
        
        app.navigationBars["Current Weather"].buttons["Go!"].tap()
        
        XCTAssertTrue(currentWeatherLabel.exists)
        XCTAssertTrue(detailsButton.exists)
        
        app.textFields.containing(.button, identifier:"Clear text").element.tap()
        
        XCTAssertFalse(currentWeatherLabel.exists)
        XCTAssertFalse(detailsButton.exists)
    }
    
    func testGoButtonExists() {
        let app = XCUIApplication()
        let goButton = app.navigationBars["Current Weather"].buttons["Go!"]
        
        XCTAssertTrue(goButton.exists)
    }
    
    func testGoButtonIsTappable() {
        let app = XCUIApplication()
        let goButton = app.navigationBars["Current Weather"].buttons["Go!"]
        
        XCTAssertTrue(goButton.isHittable)
    }
    
    func testGoButtonDisplaysTextLabel() {
        let app = XCUIApplication()
        
        let currentWeatherLabel = app.staticTexts[String.CurrentWeatherTexts.currentWeatherVancouverText]
        let detailsButton = app.buttons["Details"]
        
        XCTAssertFalse(currentWeatherLabel.exists)
        XCTAssertFalse(detailsButton.exists)
        
        let goButton = app.navigationBars["Current Weather"].buttons["Go!"]
        goButton.tap()
        
        XCTAssertTrue(currentWeatherLabel.exists)
        XCTAssertTrue(detailsButton.exists)
    }
    
    func testThatInfoLabelIsDisplayed() {
        let app = XCUIApplication()
    }
}

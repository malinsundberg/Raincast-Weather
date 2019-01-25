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
        setupSnapshot(app)
        app.launch()
    }
    
    func testThatInstructionTextIsDisplayed() {
        snapshot("01CurrentWeatherScreen")
        let instructionLabel = app.staticTexts[Strings.CurrentWeatherTexts.infoText]
        XCTAssertTrue(instructionLabel.exists)
    }
    
    func testThatTextFieldExists() {
        let textFieldElement = app.textFields.containing(.button, identifier:Strings.CurrentWeatherTexts.textFieldIdentifier).element
        XCTAssertTrue(textFieldElement.exists)
    }
    
    func testThatTextFieldIsTappable() {
        let textFieldElement = app.textFields.containing(.button, identifier:Strings.CurrentWeatherTexts.textFieldIdentifier).element
        
        XCTAssertTrue(textFieldElement.exists)
        XCTAssertTrue(textFieldElement.isEnabled)
        
//        XCTAssertTrue(textFieldElement.value as! String == Strings.CurrentWeatherTexts.textFieldDefaultText)
    }
    
    func testThatTextRemovedWhenTextFieldTapped() {
        let textFieldElement = app.textFields.containing(.button, 		identifier:Strings.CurrentWeatherTexts.textFieldIdentifier).element
        
        XCTAssertTrue(textFieldElement.exists)
        XCTAssertTrue(textFieldElement.isEnabled)
        
        XCTAssertTrue(textFieldElement.value as! String == Strings.CurrentWeatherTexts.textFieldDefaultText)
        
        textFieldElement.tap()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            XCTAssertTrue(textFieldElement.value as! String != Strings.CurrentWeatherTexts.textFieldDefaultText)
        })
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
        
        XCTAssertTrue(currentWeatherLabel.exists)
        XCTAssertTrue(detailsButton.exists)
    }
    
    func testThatInfoLabelIsDisplayed() {
    }
}

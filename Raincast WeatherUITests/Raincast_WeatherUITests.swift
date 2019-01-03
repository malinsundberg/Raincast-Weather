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
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        
        
//        app.navigationBars["Current Weather"].buttons["Go!"].tap()
//        app.otherElements.containing(.navigationBar, identifier:"Current Weather").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element.tap()
//        app.staticTexts["This is the label indicating the weather forcast"].tap()
//        app.staticTexts["Enter the location that you want to see the raincast for!"].tap()
        
        
        
//        app.buttons["Button"].tap()
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testThatInstructionTextIsDisplayed() {
        let app = XCUIApplication()
        let instructionLabel = app.staticTexts["Enter the location that you want to see the raincast for!"]
        
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
    
    func testGoButtonExists() {
        let app = XCUIApplication()
    }
    
    func testGoButtonDisplayedTextLabel() {
        let app = XCUIApplication()
    }

}

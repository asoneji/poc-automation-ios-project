//
//  SampleTestAutomationAppUITests.swift
//  SampleTestAutomationAppUITests
//
//  Created by Soneji, Ankit on 10/23/18.
//  Copyright © 2018 Soneji, Ankit. All rights reserved.
//

import XCTest

class SampleTestAutomationAppUITests: XCTestCase {
    
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

    func testAllFieldsExists() {
        let app = XCUIApplication()
        
        XCTAssert(app.staticTexts["Sample Test Automation"].exists)
        XCTAssert(app.staticTexts["Message:"].exists)
        XCTAssert(app.staticTexts["Received:"].exists)
        
        XCTAssert(app.textFields["sendMessageTextField"].exists)
        XCTAssert(app.textFields["receivedMessageTextField"].exists)
        XCTAssert(app.buttons["Send"].exists)
        XCTAssert(app.buttons["Clear"].exists)
    }

    func testSendMessage() {
        let app = XCUIApplication()
        
        let messageToSend = "Hello World! - " + getCurrentDateAndTime()
        let sendMessageTextField = app.textFields["sendMessageTextField"]
        sendMessageTextField.tap()
        sendMessageTextField.typeText(messageToSend)
        app.buttons["Send"].tap()
        
        let receivedMessageTextField = app.textFields["receivedMessageTextField"]
        
        XCTAssertEqual(receivedMessageTextField.value as! String, messageToSend, "Message sent not as expected")
    }

    func testClearMessage() {
        let app = XCUIApplication()
        
        let messageToSend = "Hello World! - " + getCurrentDateAndTime()
        let sendMessageTextField = app.textFields["sendMessageTextField"]
        sendMessageTextField.tap()
        sendMessageTextField.typeText(messageToSend)
        app.buttons["Clear"].tap()
        
        let receivedMessageTextField = app.textFields["receivedMessageTextField"]
        
        XCTAssertEqual(receivedMessageTextField.value as! String, "", "Message not cleared")
        XCTAssertEqual(sendMessageTextField.value as! String, "", "Message not cleared")
        
    }
    
    func getCurrentDateAndTime() -> String {
        
        // get the current date and time
        let currentDateTime = Date()
        
        // initialize the date formatter and set the style
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .short
        
        // get the date time String from the date object
        return formatter.string(from: currentDateTime)
    }
}

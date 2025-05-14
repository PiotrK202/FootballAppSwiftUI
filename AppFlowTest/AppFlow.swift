//
//  AppFlow.swift
//  AppFlowTest
//
//  Created by piotr koscielny on 14/5/25.
//

import XCTest

final class AppFlow: XCTestCase {

    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launchArguments.append("--uitest")
        app.launch()
    }
    
    func testAppFlow() {
        
        let startButton = app.buttons["welcomeView_button"]
        if startButton.exists {
            startButton.tap()
        }
    
        let firstLeagueCell = app.cells.firstMatch
        XCTAssertTrue(firstLeagueCell.waitForExistence(timeout: 3))
        firstLeagueCell.tap()
        
        let firstTeam = app.staticTexts.element(boundBy: 0)
        XCTAssertTrue(firstTeam.waitForExistence(timeout: 3))
        firstTeam.tap()
        
        let firstPlayer = app.staticTexts.element(boundBy: 0)
        XCTAssertTrue(firstPlayer.waitForExistence(timeout: 3))
        firstPlayer.tap()
        
        let playerName = app.staticTexts.element(boundBy: 0)
        XCTAssertTrue(playerName.waitForExistence(timeout: 3))
    }
}

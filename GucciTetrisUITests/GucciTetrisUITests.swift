//
//  GucciTetrisUITests.swift
//  GucciTetrisUITests
//
//  Created by Claudio Cavalli on 13/09/22.
//

import XCTest

class GucciTetrisUITests: XCTestCase {
    /// testLaunchApp
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    /// testLaunchApp
    func testLaunchApp() throws {
        let app = XCUIApplication()
        app.launch()
    }
    /// testOpenGame
    func testOpenGame() throws {
        let app = XCUIApplication()
        app.launch()
        app.buttons["start"].tap()
    }
    /// testSimulateGame
    func testSimulateGame() throws {
        let app = XCUIApplication()
        app.launch()
        app.buttons["start"].tap()
    }
    /// testLaunchPerformance
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}

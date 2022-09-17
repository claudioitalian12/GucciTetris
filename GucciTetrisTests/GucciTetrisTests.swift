//
//  GucciTetrisTests.swift
//  GucciTetrisTests
//
//  Created by Claudio Cavalli on 13/09/22.
//

import XCTest
@testable import GucciTetris
@testable import GucciViewModel
@testable import GucciUI

class GucciTetrisTests: XCTestCase {
    private let appDelegate = AppDelegate()
    /// testInitAppDelegate
    func testInitAppDelegate() throws {
        XCTAssertTrue(appDelegate.initialDestination())
        XCTAssertNotNil(appDelegate.appNavigator)
    }
}

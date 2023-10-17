//
//  HandygspusiUITests.swift
//  HandygspusiTests
//
//  Created by Dominik Mack on 17.10.23.
//

import XCTest

final class HandygspusiUITests: XCTestCase {

    func testEmptyContentView() throws {
        let app = XCUIApplication()
        app.launch()

        let text = app.staticTexts["NoContractsFoundLabel"]
        XCTAssertTrue(text.exists)
        XCTAssertEqual(text.label, "No contracts found. 🙇🏼‍♂️\nFeel free to add some! 🤗")
    }
}

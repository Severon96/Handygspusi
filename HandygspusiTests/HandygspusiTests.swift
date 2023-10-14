//
//  HandygspusiTests.swift
//  HandygspusiTests
//
//  Created by Dominik Mack on 13.10.23.
//

import XCTest
@testable import Handygspusi

final class HandygspusiTests: XCTestCase {

    private var contract: Contract?
    
    override func setUpWithError() throws {
        contract = Contract(id: UUID(), provider: "Sparhandy", network: "Telekom", tariff: "MagentaMobil M", connectionFee: 39.99, monthlyFee: 39.95, oneTimeDeviceCosts: 300.00, cashback: 0.00, freeMonths: 0, url: "https://telekom.de")
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

}

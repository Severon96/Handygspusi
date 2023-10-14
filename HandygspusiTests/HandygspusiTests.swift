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

    func testPriceCalc() {
        let fullPrice = PriceUtil.calculateContractPrice(contract: contract!)

        XCTAssertTrue(fullPrice == "1298.79")
    }
    
    func testPriceCalcWithCashback() {
        contract?.cashback = 200
        let fullPrice = PriceUtil.calculateContractPrice(contract: contract!)
        
        XCTAssertTrue(fullPrice == "1098.79")
    }
    
    func testPriceCalcWithoutDevice() {
        contract?.oneTimeDeviceCosts = 0
        let fullPrice = PriceUtil.calculateContractPrice(contract: contract!)
        
        XCTAssertTrue(fullPrice == "998.79")
    }

}

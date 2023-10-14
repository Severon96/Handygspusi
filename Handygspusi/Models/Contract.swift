//
//  Contractg.swift
//  Handygspusi
//
//  Created by Dominik Mack on 13.10.23.
//

import Foundation
import SwiftData

@Model
class Contract {
    
    @Attribute(.unique) var id: UUID
    var contractRuntimeInMonths: Int
    var provider: String
    var network: String
    var tariff: String
    var connectionFee: Double
    var formattedConnectionFee: String {
        String(format: "%.2f", connectionFee)
    }
    var monthlyFee: Double
    var formattedMonthlyFee: String {
        String(format: "%.2f", monthlyFee)
    }
    var oneTimeDeviceCosts: Double
    var formattedOneTimeDeviceCosts: String {
        String(format: "%.2f", oneTimeDeviceCosts)
    }
    var cashback: Double
    var formattedCashback: String {
        String(format: "%.2f", cashback)
    }
    var freeMonths: Int
    var url: String
    
    init(id: UUID, contractRuntimeInMonths: Int = 24, provider: String, network: String, tariff: String, connectionFee: Double, monthlyFee: Double, oneTimeDeviceCosts: Double, cashback: Double, freeMonths: Int, url: String = "") {
        self.id = id
        self.contractRuntimeInMonths = contractRuntimeInMonths
        self.provider = provider
        self.network = network
        self.tariff = tariff
        self.connectionFee = connectionFee
        self.monthlyFee = monthlyFee
        self.oneTimeDeviceCosts = oneTimeDeviceCosts
        self.cashback = cashback
        self.freeMonths = freeMonths
        self.url = url
    }
    
}

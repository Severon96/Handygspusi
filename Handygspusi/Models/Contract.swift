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
    
    @Attribute(.unique) var id: String
    var contractRuntimeInMonths: Int
    var provider: String
    var netz: String
    var tariff: String
    var connectionFee: Double
    var monthlyFee: Double
    var oneTimeDeviceCosts: Double
    var cashback: Double
    var freeMonths: Int
    
}

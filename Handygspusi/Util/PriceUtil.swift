//
//  PriceUtil.swift
//  Handygspusi
//
//  Created by Dominik Mack on 13.10.23.
//

import Foundation

class PriceUtil {
    
    public static func calculateContractPrice(contract: Contract) -> String {
        var fullContractPrice = 0.0
        
        fullContractPrice += contract.connectionFee
        fullContractPrice += Double(contract.contractRuntimeInMonths) * contract.monthlyFee
        fullContractPrice += contract.oneTimeDeviceCosts
        fullContractPrice -= contract.cashback + (Double(contract.freeMonths) * contract.monthlyFee)
        
        return String(format: "%.2f", fullContractPrice)
    }
    
}

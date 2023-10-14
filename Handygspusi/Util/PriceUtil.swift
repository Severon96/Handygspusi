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
        
        fullContractPrice += contract.connectionFee ?? 0.0
        fullContractPrice += Double(contract.contractRuntimeInMonths ?? 0) * (contract.monthlyFee ?? 0.0)
        fullContractPrice += contract.oneTimeDeviceCosts ?? 0.0
        fullContractPrice -= (contract.cashback ?? 0.0) + (Double(contract.freeMonths ?? 0) * (contract.monthlyFee ?? 0.0))
        
        return String(format: "%.2f", fullContractPrice)
    }
    
}

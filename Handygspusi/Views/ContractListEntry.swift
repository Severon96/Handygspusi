//
//  ContractListEntry.swift
//  Handygspusi
//
//  Created by Dominik Mack on 13.10.23.
//

import SwiftUI

struct ContractListEntry: View {
    let contract: Contract
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(contract.network) \(contract.tariff)")
                    .fixedSize()
                Text(contract.provider)
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
            }
            Spacer()
            Text("\(PriceUtil.calculateContractPrice(contract: contract)) €")
                .font(.system(size: 20))
                .fixedSize()
        }
    }
}

#Preview {
    let contract = Contract(id: UUID(), provider: "Sparhandy", network: "Telekom", tariff: "MagentaMobil M", connectionFee: 39.99, monthlyFee: 39.95, oneTimeDeviceCosts: 300.00, cashback: 0.00, freeMonths: 0)
    
    return ContractListEntry(contract: contract)
}

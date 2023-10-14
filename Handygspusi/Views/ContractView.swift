//
//  ContractView.swift
//  Handygspusi
//
//  Created by Dominik Mack on 14.10.23.
//

import SwiftUI

struct ContractView: View {
    let contract: Contract
    
    var body: some View {
        Form {
            Section {
                HStack {
                    Text("Provider")
                        .foregroundStyle(.gray)
                    Spacer()
                    Text(contract.provider)
                }
                HStack {
                    Text("Network")
                        .foregroundStyle(.gray)
                    Spacer()
                    Text(contract.network)
                }
                HStack {
                    Text("Tariff")
                        .foregroundStyle(.gray)
                    Spacer()
                    Text(contract.tariff)
                }
            }
            Section {
                HStack {
                    Text("Contract runtime in months")
                        .foregroundStyle(.gray)
                    Spacer()
                    Text(String(contract.contractRuntimeInMonths))
                }
                HStack {
                    Text("Connection fee")
                        .foregroundStyle(.gray)
                    Spacer()
                    Text("\(String(contract.formattedConnectionFee)) €")
                }
                HStack {
                    Text("Onetime device costs")
                        .foregroundStyle(.gray)
                    Spacer()
                    Text("\(String(contract.formattedOneTimeDeviceCosts)) €")
                }
                HStack {
                    Text("Monthly fee")
                        .foregroundStyle(.gray)
                    Spacer()
                    Text("\(String(contract.formattedMonthlyFee)) €")
                }
                HStack {
                    Text("Cashback")
                        .foregroundStyle(.gray)
                    Spacer()
                    Text("\(String(contract.formattedCashback)) €")
                }
                HStack {
                    Text("Free months")
                        .foregroundStyle(.gray)
                    Spacer()
                    Text("\(String(contract.freeMonths)) €")
                }
            }
            if !contract.url.isEmpty {
                Section {
                    Link("Show offer", destination: URL(string: contract.url)!)
                }
            }
        }.toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        EditContractView(contract: contract, isEdit: true, showSaveButton: false)
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }
                    
                }
        }
    }
}

#Preview("English") {
    let contract = Contract(id: UUID(), provider: "Sparhandy", network: "Telekom", tariff: "MagentaMobil M", connectionFee: 39.99, monthlyFee: 39.95, oneTimeDeviceCosts: 300.00, cashback: 0.00, freeMonths: 0, url: "https://telekom.de")
    
    return ContractView(contract: contract)
}

#Preview("German") {
    let contract = Contract(id: UUID(), provider: "Sparhandy", network: "Telekom", tariff: "MagentaMobil M", connectionFee: 39.99, monthlyFee: 39.95, oneTimeDeviceCosts: 300.00, cashback: 0.00, freeMonths: 0, url: "https://telekom.de")
    
    return ContractView(contract: contract)
        .environment(\.locale, Locale(identifier: "DE"))
}

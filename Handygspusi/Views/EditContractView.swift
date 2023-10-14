//
//  AddContractView.swift
//  Handygspusi
//
//  Created by Dominik Mack on 13.10.23.
//

import SwiftUI
struct EditContractView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.modelContext) private var modelContext
    @State var contract = Contract(id: UUID(), provider: "", network: "", tariff: "", connectionFee: 0.0, monthlyFee: 0.0, oneTimeDeviceCosts: 0.0, cashback: 0.0, freeMonths: 0, url: "")
    
    var disableForm: Bool {
        contract.provider.isEmpty || contract.network.isEmpty || contract.tariff.isEmpty || contract.contractRuntimeInMonths == 0 || contract.monthlyFee == 0
    }
    
    var isEdit: Bool = false
    var showSaveButton: Bool = true
    
    var body: some View {
        Form {
            Section {
                TextField("Provider", text: $contract.provider)
                TextField("Network", text: $contract.network)
                TextField("Tariff", text: $contract.tariff)
            }
            Section {
                HStack {
                    Text("Contract runtime in months")
                        .foregroundStyle(.gray)
                        .font(.system(size: 15))
                        .frame(width: 150, alignment: .leading)
                    IntegerTextField(label: "Contract runtime in months", instance: $contract, propertyToSet: \Contract.contractRuntimeInMonths)
                    Text("€")
                        .foregroundStyle(.gray)
                        .font(.system(size: 15))
                }
                HStack {
                    Text("Connection fee")
                        .foregroundStyle(.gray)
                        .font(.system(size: 15))
                        .frame(width: 150, alignment: .leading)
                    DoubleTextField(label: "Connection fee", instance: $contract, propertyToSet: \Contract.connectionFee)
                    Text("€")
                        .foregroundStyle(.gray)
                        .font(.system(size: 15))
                }
                HStack {
                    Text("Onetime device costs")
                        .foregroundStyle(.gray)
                        .font(.system(size: 15))
                        .frame(width: 150, alignment: .leading)
                    DoubleTextField(label: "Onetime device costs", instance: $contract, propertyToSet: \Contract.oneTimeDeviceCosts)
                    Text("€")
                        .foregroundStyle(.gray)
                        .font(.system(size: 15))
                }
                HStack {
                    Text("Monthly fee")
                        .foregroundStyle(.gray)
                        .font(.system(size: 15))
                        .frame(width: 150, alignment: .leading)
                    DoubleTextField(label: "Monthly fee", instance: $contract, propertyToSet: \Contract.monthlyFee)
                    Text("€")
                        .foregroundStyle(.gray)
                        .font(.system(size: 15))
                }
                HStack {
                    Text("Cashback")
                        .foregroundStyle(.gray)
                        .font(.system(size: 15))
                        .frame(width: 150, alignment: .leading)
                    DoubleTextField(label: "Cashback", instance: $contract, propertyToSet: \Contract.cashback)
                    Text("€")
                        .foregroundStyle(.gray)
                        .font(.system(size: 15))
                }
                HStack {
                    Text("Free months")
                        .foregroundStyle(.gray)
                        .font(.system(size: 15))
                        .frame(width: 150, alignment: .leading)
                    IntegerTextField(label: "Free months", instance: $contract, propertyToSet: \Contract.freeMonths)
                    Text("€")
                        .foregroundStyle(.gray)
                        .font(.system(size: 15))
                }
            }
            Section {
                HStack {
                    TextField("Offer link", text: $contract.url)
                        .keyboardType(.URL)
                }
            }
            
            if showSaveButton {
                Button("Save contract") {
                    withAnimation {
                        modelContext.insert(contract)
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }.disabled(disableForm)
            }
        }
        .navigationTitle(isEdit ? "Edit contract" : "Add contract")
    }
}

#Preview("English") {
    EditContractView()
}

#Preview("German") {
    EditContractView()
        .environment(\.locale, Locale(identifier: "DE"))
}

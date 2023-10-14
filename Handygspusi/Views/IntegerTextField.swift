//
//  IntegerTextField.swift
//  Handygspusi
//
//  Created by Dominik Mack on 14.10.23.
//

import SwiftUI
import Combine

struct IntegerTextField<O>: View {
    let label: String
    @Binding var objectInstance: O
    var propertyToSet: ReferenceWritableKeyPath<O, Int>
    
    @State var fieldValue: Int?
    
    init(label: String, instance: Binding<O>, propertyToSet: ReferenceWritableKeyPath<O, Int>) {
        self.label = label
        self._objectInstance = instance
        self.propertyToSet = propertyToSet
        
        _fieldValue = State(initialValue: instance.wrappedValue[keyPath: propertyToSet])
    }
    
    var body: some View {
        TextField(label, value: $fieldValue, format: .number)
            .keyboardType(.decimalPad)
            .onReceive(Just(fieldValue), perform: { newValue in
                guard let newValue else { return }
                objectInstance[keyPath: propertyToSet] = newValue
            })
    }
}

#Preview {
    let contract = Contract(id: UUID(), provider: "Telekom", network: "Telekom", tariff: "MagentaMobil M", connectionFee: 30.0, monthlyFee: 20.0, oneTimeDeviceCosts: 0.0, cashback: 0.0, freeMonths: 0)
    
    return IntegerTextField<Contract>(label: "Contract runtime in months", instance: .constant(contract), propertyToSet: \Contract.contractRuntimeInMonths)
}

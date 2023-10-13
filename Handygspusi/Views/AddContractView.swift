//
//  AddContractView.swift
//  Handygspusi
//
//  Created by Dominik Mack on 13.10.23.
//

import SwiftUI

struct AddContractView: View {
    var body: some View {
        Form {
            Section {
                Text("Provider")
                Text("Network")
                Text("Tariff")
            }
            Section {
                Text("Connection fee")
                Text("Onetime device costs")
                Text("Monthly fee")
            }
        }
        .navigationTitle("Add contract")
    }
}

#Preview {
    AddContractView()
}

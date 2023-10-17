//
//  ContentView.swift
//  Handygspusi
//
//  Created by Dominik Mack on 13.10.23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var contracts: [Contract]
    
    var body: some View {
        NavigationStack {
            VStack {
                if contracts.isEmpty {
                    Text("No contracts found. 🙇🏼‍♂️\nFeel free to add some! 🤗")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                        .accessibilityIdentifier("NoContractsFoundLabel")
                } else {
                    List {
                        ForEach(contracts) { contract in
                            NavigationLink {
                                ContractView(contract: contract)
                            } label: {
                                ContractListEntry(contract: contract)
                                    .swipeActions {
                                        Button("Delete", systemImage: "trash", role: .destructive) {
                                            modelContext.delete(contract)
                                        }
                                    }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Your contracts 📑")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        EditContractView()
                    } label: {
                        Image(systemName: "plus")
                    }
                    
                }
            }
        }
    }
}

#Preview("English") {
    ContentView()
        .modelContainer(for: Contract.self, inMemory: true)
}

#Preview("English with values") {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Contract.self, configurations: config)
    let contract = Contract(id: UUID(), provider: "Telekom", network: "Telekom", tariff: "MagentaMobil M", connectionFee: 30.0, monthlyFee: 20.0, oneTimeDeviceCosts: 0.0, cashback: 0.0, freeMonths: 0)
    container.mainContext.insert(contract)
    
    return ContentView()
        .modelContainer(container)
}

#Preview("German") {
    ContentView()
        .modelContainer(for: Contract.self, inMemory: true)
        .environment(\.locale, Locale(identifier: "DE"))
}

#Preview("German with values") {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Contract.self, configurations: config)
    let contract = Contract(id: UUID(), provider: "Telekom", network: "Telekom", tariff: "MagentaMobil M", connectionFee: 30.0, monthlyFee: 20.0, oneTimeDeviceCosts: 0.0, cashback: 0.0, freeMonths: 0)
    container.mainContext.insert(contract)
    
    return ContentView()
        .modelContainer(container)
        .environment(\.locale, Locale(identifier: "DE"))
}

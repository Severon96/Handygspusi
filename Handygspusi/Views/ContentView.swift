//
//  ContentView.swift
//  Handygspusi
//
//  Created by Dominik Mack on 13.10.23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var contracts: [Contract]
    
    var body: some View {
        NavigationStack {
            VStack {
                if contracts.isEmpty {
                    Text("No contracts found. 🙇🏼‍♂️\nFeel free to add some! 🤗")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                } else {
                    List {
                        ForEach(contracts) { contract in
                            ContractListEntry(contract: contract)
                        }
                    }
                }
            }
            .navigationTitle("Your contracts 📑")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        AddContractView()
                    } label: {
                        Image(systemName: "plus")
                    }
                    
                }
            }
            .padding()
        }
    }
}

#Preview("English") {
    ContentView()
        .modelContainer(for: Contract.self, inMemory: true)
}

#Preview("German") {
    ContentView()
        .modelContainer(for: Contract.self, inMemory: true)
        .environment(\.locale, Locale(identifier: "DE"))
}

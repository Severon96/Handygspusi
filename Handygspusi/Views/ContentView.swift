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
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Contract.self, inMemory: true)
}

//
//  ContentView.swift
//  ViewModifersAndViewBuilders
//
//  Created by Virendra Gupta on 23/09/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("ViewModifers+ViewBuilders")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

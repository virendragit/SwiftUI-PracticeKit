//
//  ContentView.swift
//  Navigations
//
//  Created by Virendra Gupta on 22/09/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
                    VStack {
                        NavigationLink(destination: SecondView()) {
                            Text("Go to Second View")
                                .font(.headline)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                    .navigationTitle("First View")
                }
    }
}

struct SecondView: View {
    var body: some View {
        VStack {
            Text("Welcome to Second View!")
                .font(.title)
                .padding()
        }
        .navigationTitle("Second View")
    }
}

#Preview {
    ContentView()
}

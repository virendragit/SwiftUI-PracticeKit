//
//  ContentView.swift
//  ViewModifersAndViewBuilders
//
//  Created by Virendra Gupta on 23/09/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isOn: Bool = false
    
    var body: some View {
        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
            //Text("ViewModifers+ViewBuilders").customViewModifiers()
            
            VStack{
                titleView("Using ViewBuilders!!")
                    .customViewModifiers(isActive: false)
                contentView(isUserLoggedIn: true)
                Button("Login"){
                    withAnimation {
                        isOn.toggle()
                    }
                }
                .customViewModifiers(isActive: isOn)
                .padding()
                
                HStack{
                    Text("Button is :")
                    Text(isOn ? "Active" : "Not Active")
                }
            }
            
        }
        .padding()
    }
    
    @ViewBuilder
    func titleView(_ title: String) -> some View {
        Text(title)
            .font(.body)
            .padding()
    }
    
    @ViewBuilder
    func contentView(isUserLoggedIn: Bool) -> some View {
        if isUserLoggedIn{
            Text("Looged IN")
                .font(.headline)
        }else {
            Text("Please login to continue")
                .font(.headline)
        }
    }
}

#Preview {
    ContentView()
}

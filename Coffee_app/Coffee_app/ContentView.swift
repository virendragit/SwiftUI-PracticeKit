//
//  ContentView.swift
//  Coffee_app
//
//  Created by Virendra Gupta on 15/09/25.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var model: CoffeeModel
    
    private func populatOrders() async {
        do {
            try await model.populateOrders()
        } catch{
            print(error)
        }
    }
    var body: some View {
        VStack {
            List(model.orders){order in
                Text(order.name)
            }
        }.task {
            await populatOrders()
        }
        .padding()
    }
}

#Preview {
    var config = configuration()
    ContentView().environmentObject(CoffeeModel(webservices: Webservice(baseURL: config.environment.baseURL)))
}

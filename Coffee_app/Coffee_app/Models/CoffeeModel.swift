//
//  CoffewModel.swift
//  Coffee_app
//
//  Created by Virendra Gupta on 15/09/25.
//

import Foundation
@MainActor
class CoffeeModel: ObservableObject {
    
    let webservices : Webservice
    @Published private(set) var orders: [Order] = []
    
    init(webservices: Webservice) {
        self.webservices = webservices
    }
    
    func populateOrders() async throws{
        
        orders = try await webservices.getOrders()
        
    }
}

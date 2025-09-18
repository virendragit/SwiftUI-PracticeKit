//
//  Webservice.swift
//  Coffee_app
//
//  Created by Virendra Gupta on 15/09/25.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case badRequest
    case noData
    case unknown
}

class Webservice{
    
    private var baseURL: URL
    
    init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    func getOrders() async throws -> [Order] {
        
        //https://island-bramble.glitch.me/test/orders
        
        guard let url = URL(string: EndPoits.allorders.path) else {
           throw NetworkError.badURL
        }
        
        let (data, response) =  try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.badRequest
        }
        
        guard let orders = try? JSONDecoder().decode([Order].self, from: data) else {
            throw NetworkError.unknown
        }
        
        return orders
    }
}

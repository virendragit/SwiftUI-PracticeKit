//
//  WebServices.swift
//  MV_Sample
//
//  Created by Virendra Gupta on 14/09/25.
//

import Foundation

enum NetworkError : Error{
    
    case badURL
    case badRequest
}

class WebServices {
    
    func getProducts() async throws -> [Product] {
        
        guard let url = URL(string: "https://fakestoreapi.com/products")else{
            throw NetworkError.badURL
        }
        
        let(data,response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else{
            throw NetworkError.badRequest
        }
    }
}

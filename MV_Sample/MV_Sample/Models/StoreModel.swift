//
//  StoreModel.swift
//  MV_Sample
//
//  Created by Virendra Gupta on 14/09/25.
//

import Foundation
@MainActor
class  StoreModel: ObservableObject {
    
    let webService: WebServices
    
    init(webService: WebServices) {
        self.webService = webService
    }
    
    @Published var products: [Product] = []
    
    
    func populateProducts() async throws{
        
        products = try await webService.getProducts()
        
    }
}

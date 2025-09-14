//
//  ProductListViewModel.swift
//  MVVMSample
//
//  Created by Virendra Gupta on 14/09/25.
//

import Foundation
@MainActor
class ProductListViewModel: ObservableObject {
    
    @Published var products: [ProductViewModel] = []
    
    let webservice: WebServices
    
    init(webservice: WebServices) {
        self.webservice = webservice
    }
    
    
    func populateProducts() async {
      do {
            let products = try await webservice.getProducts()
          self.products = products.map(ProductViewModel.init)
        } catch {
            print("Error: \(error)")
        }
    }
    
}


struct ProductViewModel: Identifiable{
    
    private var product: Product
    
    init(product: Product) {
        self.product = product
    }
    
    var id: Int {
        product.id
    }
    var title: String {
        product.title
    }
    var price: Double {
        product.price
    }
}

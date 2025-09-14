//
//  StoreModel.swift
//  MV_Sample
//
//  Created by Virendra Gupta on 14/09/25.
//

import Foundation

class  StoreModel: ObservableObject {
    
    @Published var products: [Product] = []
    
    
    func populateProducts() async{
        
    }
}

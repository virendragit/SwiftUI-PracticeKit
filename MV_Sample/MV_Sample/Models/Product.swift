//
//  Model.swift
//  MV_Sample
//
//  Created by Virendra Gupta on 14/09/25.
//

import Foundation

struct Product : Decodable, Identifiable {
    
    let id: Int
    let title: String
    let price: Double
    
}

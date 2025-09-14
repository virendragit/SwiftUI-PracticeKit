//
//  NumberFormatter.swift
//  MV_Sample
//
//  Created by Virendra Gupta on 14/09/25.
//

import Foundation

extension NumberFormatter{
    static var currency: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
}

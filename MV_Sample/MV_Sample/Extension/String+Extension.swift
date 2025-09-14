//
//  String+Extension.swift
//  MV_Sample
//
//  Created by Virendra Gupta on 14/09/25.
//

import Foundation

extension String{
    
    var isValidEmail: Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return predicate.evaluate(with: self)
    }
}

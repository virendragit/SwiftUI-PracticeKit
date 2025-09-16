//
//  AppEnvironment.swift
//  Coffee_app
//
//  Created by Virendra Gupta on 16/09/25.
//

import Foundation

enum EndPoits{
    case allorders
    
    var path: String {
        switch self {
        case .allorders:
            return "/orders"
        }
    }
}

enum AppEnvironment: String {
    case development
    case production
    
    
    var baseURL: URL {
        switch self {
        case .development:
            return URL(string: "https://jsonplaceholder.typicode.com")!
        case .production:
            fatalError("Production URL not yet defined")
        }
    }
}

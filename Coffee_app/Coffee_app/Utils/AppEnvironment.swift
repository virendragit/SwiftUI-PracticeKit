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

struct configuration{
    lazy var environment : AppEnvironment = {
        
        //
        guard let env = ProcessInfo.processInfo.environment["ENV"] else {
            return AppEnvironment.development
        }
        
        if env == "PROD" {
            return AppEnvironment.production
        }
        
        return AppEnvironment.development
    }()
}

enum AppEnvironment: String {
    case development
    case production
    
    
    var baseURL: URL {
        switch self {
        case .development:
            return URL(string: "https://island-bramble.glitch.me/test/orders")!
        case .production:
            fatalError("Production URL not yet defined")
        }
    }
}

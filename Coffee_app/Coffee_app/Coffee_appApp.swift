//
//  Coffee_appApp.swift
//  Coffee_app
//
//  Created by Virendra Gupta on 15/09/25.
//

import SwiftUI

@main
struct Coffee_appApp: App {
    
    @StateObject private var model: CoffeeModel
    
    init(){
        var config = configuration()
        let webservice = Webservice(baseURL: config.environment.baseURL)
        _model = StateObject(wrappedValue: CoffeeModel(webservices: webservice))
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(model)
        }
    }
}

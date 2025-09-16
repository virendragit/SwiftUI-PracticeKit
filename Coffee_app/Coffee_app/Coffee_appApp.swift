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
        let webservice = Webservice()
        _model = StateObject(wrappedValue: CoffeeModel(webservices: webservice))
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(model)
        }
    }
}

//
//  MV_SampleApp.swift
//  MV_Sample
//
//  Created by Virendra Gupta on 14/09/25.
//

import SwiftUI

@main
struct MV_SampleApp: App {
    
    @StateObject private var storeModel = StoreModel(webService: WebServices())
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(storeModel)
        }
    }
}

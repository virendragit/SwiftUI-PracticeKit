//
//  HelloSwiftUIApp.swift
//  HelloSwiftUI
//
//  Created by Virendra Gupta on 02/07/25.
//

import SwiftUI

@main
struct HelloSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AppState())
        }
    }
}


//Other way:
//struct HelloSwiftUIApp: App {
//    
//    @StateObject private var appState = AppState()
//    
//    var body: some Scene {
//        WindowGroup {
//            ContentView().environmentObject(appState)
//        }
//    }
//}

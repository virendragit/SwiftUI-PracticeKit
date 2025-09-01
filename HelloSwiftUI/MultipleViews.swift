//
//  MultipleViews.swift
//  HelloSwiftUI
//
//  Created by Virendra Gupta on 01/09/25.
//

import SwiftUI
import Observation

@Observable
class AppState: ObservableObject {
     var isOn: Bool = false
}



//Pre iOS 17
//class AppState: ObservableObject {
//    @Published var isOn: Bool = false
//}

struct MultipleViews: View {
    @Environment(AppState.self) private var appState: AppState
    @State var isOn = false
    var body: some View {
//        LightBulbView2(isOn: $isOn)
        LightBulbRoomView()
        
    }
}

struct LightBulbRoomView: View {
    
    
    var body: some View {
        LightBulbView2()
    }
}

struct LightBulbView2: View {
    
//    @EnvironmentObject var appState: AppState
    @Environment(AppState.self) private var appState: AppState
    
    var body: some View {
        Image(systemName: appState.isOn ? "lightbulb.fill" : "lightbulb")
            .font(.largeTitle)
            .foregroundStyle(appState.isOn ? .yellow : .blue)
        Button("Toggle"){
            appState.isOn.toggle()
        }
    }
}

#Preview {
    MultipleViews()
        .environment(AppState())
}

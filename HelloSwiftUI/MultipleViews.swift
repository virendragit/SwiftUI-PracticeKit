//
//  MultipleViews.swift
//  HelloSwiftUI
//
//  Created by Virendra Gupta on 01/09/25.
//

import SwiftUI

struct MultipleViews: View {
    
    @State var isOn = false
    var body: some View {
        LightBulbView2(isOn: $isOn)
    }
}

struct LightBulbView2: View {
    
    @Binding  var isOn : Bool
    
    var body: some View {
        Image(systemName: isOn ? "lightbulb.fill" : "lightbulb")
            .font(.largeTitle)
            .foregroundStyle(isOn ? .yellow : .blue)
        Button("Toggle"){
            isOn.toggle()
        }
    }
}

#Preview {
    MultipleViews()
}

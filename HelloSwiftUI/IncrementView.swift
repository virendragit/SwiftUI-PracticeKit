//
//  IncrementView.swift
//  HelloSwiftUI
//
//  Created by Virendra Gupta on 03/07/25.
//

import SwiftUI

struct IncrementView: View {
    
    @State private var isOn: Bool = true
    
    
    var body: some View {
        VStack{
            Toggle(isOn: $isOn, label:{
                Text(isOn ? "ON" : "OFF")
                    .foregroundStyle(.white)
            }).fixedSize()
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(isOn ? .yellow : .black)
    }
}

#Preview {
    IncrementView()
}

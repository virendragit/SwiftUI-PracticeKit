//
//  BindindSwiftUI.swift
//  HelloSwiftUI
//
//  Created by Virendra Gupta on 03/07/25.
//

import SwiftUI

struct LightBulbView: View {
    
    @Binding var isOn: Bool
    var body: some View {
        VStack{
            Image(systemName: isOn ? "lightbulb.fill" : "lightbulb")
                .font(.largeTitle)
                .foregroundStyle(isOn ? .yellow : .black)
            Button("Toggle"){
                isOn.toggle()
            }
        }
    }
}

struct BindindSwiftUI: View {
    
    @State private var isLightOn: Bool = false
    var body: some View {
        VStack{
            LightBulbView(isOn: $isLightOn)
            }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(isLightOn ? .black :  .white)
        }
    }


#Preview {
    BindindSwiftUI()
}

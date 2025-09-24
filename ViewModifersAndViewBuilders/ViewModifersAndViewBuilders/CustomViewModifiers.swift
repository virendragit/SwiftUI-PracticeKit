//
//  CustomViewModifiers.swift
//  ViewModifersAndViewBuilders
//
//  Created by Virendra Gupta on 23/09/25.
//

import SwiftUI

//struct CustomViewModifiers: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//#Preview {
//    CustomViewModifiers()
//}

struct CustomViewModifiers : ViewModifier{
    
    let isActive : Bool
    
    func body (content : Content) -> some View {
        content
            .bold()
            .font(.title)
            .foregroundStyle(.white)
            .padding()
            .background(isActive ? Color.teal.gradient : Color.red.gradient) 
            .clipShape(RoundedRectangle(cornerRadius: 16))
        
    }
}

extension View {
    func customViewModifiers(isActive: Bool) -> some View {
        modifier(CustomViewModifiers(isActive: isActive))
    }
}

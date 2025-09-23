//
//  ContentView.swift
//  GeometryReader
//
//  Created by Virendra Gupta on 23/09/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader{ geometry in
            
//            Text("Width: \(geometry.size.width)")
//            Text("Height: \(geometry.size.height)")
            
//            Circle()
//                .fill(Color.teal)
//                .frame(width: geometry.size.width * 0.5,height: geometry.size.height * 0.5)
//                .position(x: geometry.size.width / 2, y: geometry.size.height/2)
            
            Rectangle()
                .fill(Color.cyan)
                .frame(width: geometry.size.width * 0.7,height: 100)
                .position(x: geometry.size.width / 2 , y: geometry.size.height / 2 )
            
        }
        .background(Color.orange.opacity(0.4))
        .onAppear {
            print("Is main thread:", Thread.isMainThread)
        }
    }
}

func fetchData() -> String {
    return "data"
}

#Preview {
    ContentView()
}


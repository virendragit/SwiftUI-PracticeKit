//
//  Untitled.swift
//  HelloSwiftUI
//
//  Created by Virendra Gupta on 02/07/25.
//

import Foundation

struct Hike : Identifiable, Hashable {
    var id = UUID()
    let name : String
    let photo : String
    let miles : Double
}

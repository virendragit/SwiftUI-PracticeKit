//
//  Location.swift
//  Weatherly
//
//  Created by Virendra Gupta on 03/09/25.
//

import Foundation

struct Location  : Decodable{
    let name: String
    let lat: Double
    let lon: Double
}

//struct GeocodingResponse: Decodable {
//    let results: [Location]
//}
//
//struct Location: Decodable {
//    let geometry: Geometry
//    let formatted: String
//}
//
//struct Geometry: Decodable {
//    let lat: Double
//    let lng: Double
//}

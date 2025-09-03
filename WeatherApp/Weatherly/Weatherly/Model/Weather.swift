//
//  Weather.swift
//  Weatherly
//
//  Created by Virendra Gupta on 03/09/25.
//

import Foundation

struct WeatherResponse: Decodable {

    
    let name: Weather
}


struct Weather: Decodable {
    let temp: Double
//    let feelsLike: Double
    
}



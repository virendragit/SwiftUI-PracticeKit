//
//  Weather.swift
//  Weatherly
//
//  Created by Virendra Gupta on 03/09/25.
//

import Foundation

struct WeatherResponse: Decodable {

    
    let main: Weather
}


struct Weather: Decodable {
    let temp: Double

    
}





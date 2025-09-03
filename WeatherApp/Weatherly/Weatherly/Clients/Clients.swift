//
//  Clients.swift
//  Weatherly
//
//  Created by Virendra Gupta on 03/09/25.
//

import Foundation

enum APIEndpoint {
    static let baseURLString = "https://api.openweathermap.org/data/2.5/"
    
    case coordinatesByLocation(String)
    case weatherByCoordinates(Double, Double)
    
    private var path: String {
        switch self {
        case .coordinatesByLocation(let location):
            return "weather?q=\(location)&units=metric&appid=\(Constants.apiKey)"
        case .weatherByCoordinates(let lat, let lon):
            return "onecall?lat=\(lat)&lon=\(lon)&units=metric&appid=\(Constants.apiKey)"
        }
    }
}

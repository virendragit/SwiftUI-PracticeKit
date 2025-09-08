//
//  Clients.swift
//  Weatherly
//
//  Created by Virendra Gupta on 03/09/25.
//

import Foundation

enum APIEndpoint {
    static let baseURLString = "https://api.openweathermap.org"
    
    case coordinatesByLocation(String)
    case weatherByCoordinates(Double, Double)
    
    private var path: String {
        switch self {
        case .coordinatesByLocation(let city):
            return "/geo/1.0/direct?q=\(city)&appid=\(Constants.Keys.apiKey)"
        case .weatherByCoordinates(let lat, let lon):
            return "onecall?lat=\(lat)&lon=\(lon)&units=metric&appid=\(Constants.Keys.apiKey)"
        }
    }
    
    static func endpointURL(for endpoint: APIEndpoint) -> URL {
        let endpointPath = endpoint.path
        return URL(string: baseURLString + endpointPath)!
        
    }
}

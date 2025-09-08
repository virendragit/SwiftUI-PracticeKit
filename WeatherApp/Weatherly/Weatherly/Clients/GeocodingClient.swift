//
//  GeocodingClient.swift
//  Weatherly
//
//  Created by Virendra Gupta on 08/09/25.
//

import Foundation

enum NetworkError: Error {
    case noData
    case decodingError
    case invalidURL
    case badURLResponse
    case invalidResponse
}

struct GeocodingClient{
    func coordinateByCity(_ city: String) async throws -> Location? {
     
//        let (data ,response) = try await URLSession.shared.data(from: URL(string: "https://api.opencagedata.com/geocode/v1/json?q=\(city)&key=6b311b59-f15b-4511-a45e-e5c1645e466e")!)
        
        print("url is \(APIEndpoint.endpointURL(for: .coordinatesByLocation(city)))")
        
        let (data, response) = try await URLSession.shared.data(from: APIEndpoint.endpointURL(for: .coordinatesByLocation(city)))
        
        guard let httpResponse = response as? HTTPURLResponse ,
            httpResponse.statusCode == 200 else {
            throw NetworkError.invalidURL
            }
        
        let locations = try JSONDecoder().decode([Location].self, from: data)
        return locations.first
//        let decoded = try JSONDecoder().decode(GeocodingResponse.self, from: data)
//        return decoded.results.first
        
//        do {
//            let decoded = try JSONDecoder().decode(GeocodingResponse.self, from: data)
//            return decoded.results.first
//        } catch {
//            print("Decoding failed: \(error)")
//            throw NetworkError.decodingError
//        }
        
        }
        
    }


//
//  ContentView.swift
//  Weatherly
//
//  Created by Virendra Gupta on 03/09/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Get Coordinates"){
                Task {
                    let geoCodingClient = GeocodingClient()
                    let weatherClient = WeatherClient()
                    
                    let location = try! await geoCodingClient.coordinateByCity("Dehli")
                    let weather = try! await weatherClient.fetchWeather(location: location!)
                    print(weather)
                    
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

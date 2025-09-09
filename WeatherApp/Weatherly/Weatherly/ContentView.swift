//
//  ContentView.swift
//  Weatherly
//
//  Created by Virendra Gupta on 03/09/25.
//

import SwiftUI


//clean way of doing it.

struct ContentView: View {
    
    @State private var city: String = ""
    @State private var isFetchingWeather: Bool = false
    
    let geoCodingClient = GeocodingClient()
    let weatherClient = WeatherClient()
    
    @State private var weather: Weather?
    
    private func fetchWeather() async {
        do{
            guard let location = try await geoCodingClient.coordinateByCity(city) else { return }
           weather = try await weatherClient.fetchWeather(location: location)
        } catch {
            print(error)
        }
    }
    var body: some View {
        VStack{
            TextField("City", text: $city)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    isFetchingWeather = true
                }.task(id:isFetchingWeather) {
                    if isFetchingWeather{
                        await fetchWeather()
                        isFetchingWeather = false
                        city = ""
                    }
                    
        }
            Spacer()
            
            if let weather {
                Text("\(weather.temp)")
            }
            
            Spacer()
                
        }
        .padding()
    }
    
}


//Raw way of doing it.

//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Button("Get Coordinates"){
//                Task {
//                    let geoCodingClient = GeocodingClient()
//                    let weatherClient = WeatherClient()
//                    
//                    let location = try! await geoCodingClient.coordinateByCity("Dehli")
//                    let weather = try! await weatherClient.fetchWeather(location: location!)
//                    print(weather)
//                    
//                }
//            }
//            .padding()
//        }
//    }
//}

#Preview {
    ContentView()
}

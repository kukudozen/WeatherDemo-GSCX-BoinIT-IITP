//
//  ContentView.swift
//  WeatherDemo
//
//  Created by Juan Guerrero on 22/09/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    var body: some View {
        VStack {
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                }else{
                    LoadingView()
                        .task {
                            do{
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            }catch{
                                print("Error getting weather: \(error)")
                            }
                        }
                }
                
                
                
                     }else {
                    if locationManager.isLoading {
                        LoadingView()
                    }else{
                        WellcomeView()
                             .environmentObject(locationManager)
                    }
                }
        }
        .background(Color(hue: 0.581, saturation: 0.96, brightness: 0.642))
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ContentView()
}

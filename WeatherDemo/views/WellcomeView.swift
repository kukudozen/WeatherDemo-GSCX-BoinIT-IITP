//
//  WellcomeView.swift
//  WeatherDemo
//
//  Created by Juan Guerrero on 22/09/2024.
//

import SwiftUI
import CoreLocationUI

struct WellcomeView: View {
    
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack {
            VStack (spacing: 20) {
                Text("Welcome to the weather App")
                    .bold().font(.title)
                Text("Please share your current location to get the weather in your area").padding()
            }
            .multilineTextAlignment(.center)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .padding()
        
        LocationButton(.shareCurrentLocation){
            locationManager.requestLocation()
        }
        .cornerRadius(30)
        .symbolVariant(.fill)
        .foregroundColor(.white)
    }
}

#Preview {
    WellcomeView()
}

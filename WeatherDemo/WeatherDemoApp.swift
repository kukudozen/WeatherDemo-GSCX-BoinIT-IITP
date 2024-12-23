// //
// //  WeatherDemoApp.swift
// //  WeatherDemo
// //
// //  Created by Juan Guerrero on 22/09/2024.
// //

// import SwiftUI

// @main
// struct WeatherDemoApp: App {
//     var body: some Scene {
//         WindowGroup {
//             ContentView()
//         }
//     }
// }



//
//  WeatherDemoApp.swift
//  WeatherDemo
//
//  Created by Juan Guerrero on 22/09/2024.
//

import SwiftUI
import GSCXScanner

@main
struct WeatherDemoApp: App {
    init() {
        // Initialize GSCX Scanner
        GSCXScanner.shared().startScanning()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

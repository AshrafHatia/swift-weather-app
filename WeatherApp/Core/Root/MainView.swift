//
//  ContentView.swift
//  WeatherApp
//
//  Created by Ashraf Hatia on 30/04/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    var body: some View {
        VStack {
            if let location = locationManager.location {
                //                Text("Your Cornidates are: \(location.longitude), \(location.latitude)")
                if let weather = weather {
//                    Text("Weather Data Fetched!")
                    WeatherView(weather: weather)
                } else {
                    LoadingView()
                        .task {
                            do {
                               weather = try await weatherManager.gerCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Error getting weather \(error)")
                            }
                        }
                }
            } else{
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
            
        }
        .background(Color(hue: 0.613, saturation: 0.811, brightness: 0.857))
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    MainView()
}

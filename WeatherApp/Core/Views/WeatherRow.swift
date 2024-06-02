//
//  WeatherRow.swift
//  WeatherApp
//
//  Created by Ashraf Hatia on 30/05/24.
//

import SwiftUI

struct WeatherRow: View {
    var logo: String
    var name: String
    var value: String
    var body: some View {
        HStack(spacing: 20){
            Image(systemName: logo)
                .font(.title2)
                .frame(width: 20, height: 20)
                .padding()
//                .background(Color(.))
//                .background(Color(hue: 1.8, saturation: 0.8, brightness: 0.888))
                .cornerRadius(50)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(name)
                    .font(.caption)
                
                Text(value)
                    .bold()
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

#Preview {
    WeatherRow(logo: "thermometer", name: "Feels like", value: "8°")
}

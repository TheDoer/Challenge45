//
//  WeatherResponse.swift
//  Challenge45
//
//  Created by Adonis Rumbwere on 10/3/2022.
//

import Foundation

struct WeatherResponse: Codable {
    var daily: [DailyWeather]
    
    static func empty() -> WeatherResponse {
        return WeatherResponse(daily: [DailyWeather](repeating:DailyWeather(), count: 8))
    }
    
}

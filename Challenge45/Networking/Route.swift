//
//  Route.swift
//  Challenge45
//
//  Created by Adonis Rumbwere on 10/3/2022.
//

import Foundation

enum Route {
    static let baseUrl = "https://community-open-weather-map.p.rapidapi.com"
    
    case dailyWeather
    
    var description: String {
        switch self {
            case .dailyWeather:
                return "/forecast/daily?q=harare%2Czw&units=imperial&id=Harare"
        }
    }
    
}



//
//  Route.swift
//  Challenge45
//
//  Created by Adonis Rumbwere on 10/3/2022.
//

import Foundation

enum Route {
    static let baseUrl = "https://community-open-weather-map.p.rapidapi.com"
    
    case fetchDailyWeather
    
    var description: String {
        switch self {
            case .fetchDailyWeather:
                return "/forecast/daily?q=harare%2Czw&units=metric&id=Harare"
        }
    }
    
}



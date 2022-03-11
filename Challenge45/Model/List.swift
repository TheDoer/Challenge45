//
//  DailyWeather.swift
//  Challenge45
//
//  Created by Adonis Rumbwere on 10/3/2022.
//

import Foundation

struct List: Codable {
    
        let dt, sunrise, sunset: Int?
        let temp: Temp?
        let feelsLike: FeelsLike?
        let pressure, humidity: Int?
        let weather: [Weather]?
        let speed: Double?
        let deg: Int?
        let gust: Double?
        let clouds: Int?
        let pop, rain: Double?
    
    enum CodingKeys: String, CodingKey {
            case dt, sunrise, sunset, temp
            case feelsLike = "feels_like"
            case pressure, humidity, weather, speed, deg, gust, clouds, pop, rain
        }
    
//    init() {
//        dt = 0
//        temp = Temperature(min: 0.0, max: 0.0)
//        weather = [WeatherDetail(main: "", description: "", icon: "")]
//
//    }
 
}


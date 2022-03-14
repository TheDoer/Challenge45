//
//  DailyWeatherTableViewCell.swift
//  Challenge45
//
//  Created by Adonis Rumbwere on 11/3/2022.
//

import UIKit

class DailyWeatherTableViewCell: UITableViewCell {

     static let identifier = "DailyWeatherTableViewCell"
    
    
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var weatherDate: UILabel!
    @IBOutlet weak var weatherTemperature: UILabel!
    
    func setup(dailyWeatherCellData: List){
        weatherImageView.contentMode = .scaleAspectFit
        weatherDate.text = getDayForDate(Date(timeIntervalSince1970: Double(dailyWeatherCellData.dt ?? 0)))
        weatherTemperature.text = "\(dailyWeatherCellData.temp?.day ?? 0.0 )°"
        let weatherIcon = dailyWeatherCellData.weather![0].icon
        
       
        
        if (weatherIcon == "01d"){
            self.weatherImageView.image = UIImage(named: "clear sky")
            }
          else if (weatherIcon == "02d") {
            self.weatherImageView.image = UIImage(named: "few clouds")
                    }
            else if (weatherIcon == "03d") {
                        self.weatherImageView.image = UIImage(named: "scattered clouds")
                    }
        else if (weatherIcon == "04d") {
                    self.weatherImageView.image = UIImage(named: "broken clouds")
                }
        else if (weatherIcon == "09d") {
                    self.weatherImageView.image = UIImage(named: "shower rain")
                }
        else if (weatherIcon == "10d") {
                    self.weatherImageView.image = UIImage(named: "rain")
                }
        else if (weatherIcon == "11d") {
                    self.weatherImageView.image = UIImage(named: "thunderstorm")
                }

                    else {
        
                        self.weatherImageView.image = UIImage(named: "thunderstorm")
        
                    }
    
       
        
    }
    
}
    


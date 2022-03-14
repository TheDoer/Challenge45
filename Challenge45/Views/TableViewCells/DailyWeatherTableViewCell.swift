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
        
        if (weatherIcon == "04d"){
                        self.weatherImageView.image = UIImage(named: "night")
                    }
                    else if (weatherIcon == "10d") {
                        self.weatherImageView.image = UIImage(named: "cloud-lightining")
                    }
                    else if (weatherIcon == "03d") {
                        self.weatherImageView.image = UIImage(named: "cloud-umbrella")
                    }
                    else {
        
                        self.weatherImageView.image = UIImage(named: "wind")
        
                    }
       
        
    }
    
}
    


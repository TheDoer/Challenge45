//
//  DailyWeatherDetailsViewController.swift
//  Challenge45
//
//  Created by Adonis Rumbwere on 13/3/2022.
//

import UIKit

class DailyWeatherDetailsViewController: UIViewController {
    
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var weatherDescriptionLbl: UILabel!
    @IBOutlet weak var tempHighLbl: UILabel!
    @IBOutlet weak var windLbl: UILabel!
    @IBOutlet weak var humidityLbl: UILabel!
    @IBOutlet weak var sunriseLbl: UILabel!
    @IBOutlet weak var sunsetLbl: UILabel!
    
    var dailyWeatherDetails: List?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateWeatherDetails()

        
        
    }
    

    func populateWeatherDetails(){
        
        tempLbl.text = "\(dailyWeatherDetails?.temp?.day ?? 0)°"
        weatherDescriptionLbl.text = dailyWeatherDetails?.weather?[0].weatherDescription
        tempHighLbl.text = "\(dailyWeatherDetails?.temp?.max ?? 00 )°  /  \(dailyWeatherDetails?.temp?.min ?? 00)°"
        windLbl.text = "\(dailyWeatherDetails?.speed ?? 0.0) km/h"
        humidityLbl.text = "\(dailyWeatherDetails?.humidity ?? 0) %"
        
        
        
        
        
    }
    

}

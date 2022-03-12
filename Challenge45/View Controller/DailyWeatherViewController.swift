//
//  ViewController.swift
//  Challenge45
//
//  Created by Adonis Rumbwere on 9/3/2022.
//

import UIKit

class DailyWeatherViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var allDailyWeather: [List] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkService.shared.fetchDailyWeatherData { [weak self] (result) in
            switch result {
                case .success(let dailyWeatherData):
                    print("It was successful")
                    self?.allDailyWeather = dailyWeatherData
                    //print("All Data: \(self?.allDailyWeather)")
                case .failure(let error):
                    print("The error is: \(error.localizedDescription)")
                    
            }
            
            print("Weather Data Count: \(self?.allDailyWeather.count)")
        }
        
        
        
        
//        NetworkService.shared.myfirstRequest { (result) in
//            switch result {
//                case .success(let data):
//                    //print("The decoded data is: \(data)")
//                    for dailyWeather in data {
//                        print(dailyWeather.weather ?? "")
//                    }
//
//
//                case .failure(let error):
//                    print("The error is: \(error.localizedDescription)")
//            }
//        }
        
    }


}

extension DailyWeatherViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allDailyWeather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DailyWeatherTableViewCell.identifier) as! DailyWeatherTableViewCell
        cell.setup(dailyWeatherCellData: allDailyWeather[indexPath.row])
        return cell
        
    }
    
}

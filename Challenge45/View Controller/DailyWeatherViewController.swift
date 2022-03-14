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
        registerCells()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NetworkService.shared.fetchDailyWeatherData { [weak self] (result) in
            switch result {
                case .success(let dailyWeatherData):
                    print("It was successful")
                    self?.allDailyWeather = dailyWeatherData
                    //self?.allDailyWeather.append(contentsOf: dailyWeatherData)
                    //print("All Data: \(self?.allDailyWeather)")
                    self?.tableView.reloadData()
                case .failure(let error):
                    print("The error is: \(error.localizedDescription)")
                    
            }
            
        }
    }
    
    
    private func registerCells() {
        tableView.register(UINib(nibName: DailyWeatherTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DailyWeatherTableViewCell.identifier)
    }


}

extension DailyWeatherViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allDailyWeather.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: DailyWeatherTableViewCell.identifier, for: indexPath) as! DailyWeatherTableViewCell
        cell.setup(dailyWeatherCellData: allDailyWeather[indexPath.row])
       
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let controller = DailyWeatherDetailsViewController.instantiate()
        controller.dailyWeatherDetails = allDailyWeather[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
        
    }
    
    
}

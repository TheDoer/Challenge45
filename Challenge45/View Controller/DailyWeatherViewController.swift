//
//  ViewController.swift
//  Challenge45
//
//  Created by Adonis Rumbwere on 9/3/2022.
//

import UIKit
import Reachability
import ProgressHUD


class DailyWeatherViewController: UIViewController {
    var reachability: Reachability?
    
    @IBOutlet weak var tableView: UITableView!
    
    var allDailyWeather: [List] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        fetchData()
    }
    
    
    func fetchData(){
        
        ProgressHUD.show()
        
        do {
            self.reachability = try Reachability.init()
        } catch {
            print("Unable to Start Notifier")
            
        }
        
        if ((reachability!.connection) != .unavailable) {
            
        NetworkService.shared.fetchDailyWeatherData { [weak self] (result) in
            switch result {
                case .success(let dailyWeatherData):
                    ProgressHUD.dismiss()
                    self?.allDailyWeather = dailyWeatherData
                    self?.tableView.reloadData()
                    
                case .failure(let error):
                    ProgressHUD.showError(error.localizedDescription)
                    
            }
            
        }
            
        } else {
            ProgressHUD.dismiss()
            
            let controller = CheckConnectionViewController.instantiate()
            navigationController?.pushViewController(controller, animated: true)
 
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

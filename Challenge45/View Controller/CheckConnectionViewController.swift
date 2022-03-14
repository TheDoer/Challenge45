//
//  CheckConnectionViewController.swift
//  Challenge45
//
//  Created by Adonis Rumbwere on 14/3/2022.
//

import UIKit

class CheckConnectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func retryButtonPressed(_ sender: Any) {
        
        let controller = DailyWeatherViewController.instantiate()
        navigationController?.pushViewController(controller, animated: true)
        

    }
    
}

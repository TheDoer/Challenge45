//
//  UIViewController+Extension.swift
//  Challenge45
//
//  Created by Adonis Rumbwere on 12/3/2022.
//

import UIKit
import ProgressHUD

extension UIViewController {
    
    static var identifier: String {
        return String(describing: self)
        
    }
    
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! Self
    }
    
}

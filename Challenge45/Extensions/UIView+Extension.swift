//
//  UIView+Extension.swift
//  Challenge45
//
//  Created by Adonis Rumbwere on 11/3/2022.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}

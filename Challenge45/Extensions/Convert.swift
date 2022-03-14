//
//  ConvertTemp.swift
//  Challenge45
//
//  Created by Adonis Rumbwere on 14/3/2022.
//

import Foundation

extension Double {
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor ).rounded() / divisor
    }
}



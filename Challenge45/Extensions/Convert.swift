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

func getDayForDate(_ date: Date?) -> String {
    guard let inputDate = date else {
        return ""
    }
    
    let formatter = DateFormatter()
    formatter.dateFormat = "EEEE, MMM d" //Saturday, Mar 12
    return formatter.string(from: inputDate)
}

func getTimeForDate(_ date: Date?) -> String {
    guard let inputDate = date else {
        return ""
    }
    
    let formatter = DateFormatter()
    formatter.dateFormat = "EEEE, MMM d" //Saturday, Mar 12
    return formatter.string(from: inputDate)
    
    
}

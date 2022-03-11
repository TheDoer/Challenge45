//
//  Temperature.swift
//  Challenge45
//
//  Created by Adonis Rumbwere on 10/3/2022.
//

import Foundation

struct Temp: Codable {
    let day, min, max, night: Double?
    let eve, morn: Double?
}

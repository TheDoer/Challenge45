//
//  Weather.swift
//  Challenge45
//
//  Created by Adonis Rumbwere on 10/3/2022.
//

import Foundation

struct Weather: Codable {
    let id: Int?
    let main, weatherDescription, icon: String?

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

//
//  ApiResponse.swift
//  Challenge45
//
//  Created by Adonis Rumbwere on 11/3/2022.
//

import Foundation

struct APiResponse<T: Decodable>: Decodable {
    let list: T?
    let error: String?
    
}

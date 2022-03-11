//
//  ApiResponse.swift
//  Challenge45
//
//  Created by Adonis Rumbwere on 11/3/2022.
//

import Foundation

import Foundation

struct APiResponse<T: Decodable>: Decodable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
    
}

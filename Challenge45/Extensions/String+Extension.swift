//
//  String+Extension.swift
//  Challenge45
//
//  Created by Adonis Rumbwere on 11/3/2022.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}

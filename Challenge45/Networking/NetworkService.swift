//
//  NetworkManager.swift
//  Challenge45
//
//  Created by Adonis Rumbwere on 10/3/2022.
//

import Foundation
import FileProvider

struct NetworkService {
    
    /// The function is generating a urlRequest
    /// - Parameters:
    ///   - route: the specific endpoint/path to the resource in the backend
    ///   - method: http verb methods(get,post)
    ///   - parameters: anything that can be passed to the backend
    /// - Returns: URLRequest
    
    private func createRequest(route: Route, method: Method, parameters: [String: Any]? = nil) -> URLRequest? {
        let urlString = Route.baseUrl + route.description
        guard let url = urlString.asUrl else {
            return nil
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = method.rawValue
        
        if let params = parameters {
            switch method {
                case .get:
                    
                    var urlComponent = URLComponents(string: urlString)
                    urlComponent?.queryItems = params.map {URLQueryItem(name: $0, value: "\($1)") }
                    urlRequest.url = urlComponent?.url
                    
            }
        }
        return urlRequest
    }
}

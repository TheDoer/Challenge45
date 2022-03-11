//
//  NetworkManager.swift
//  Challenge45
//
//  Created by Adonis Rumbwere on 10/3/2022.
//

import Foundation
import FileProvider

struct NetworkService {
    
    static let shared = NetworkService()
    
    private init() {}
    
    func myfirstRequest(){
        
        request(route: .dailyWeather, method: .get, type: String.self, completion: { _ in })
       
    }
    
    
    
    private func request<T: Codable>(route: Route,
                                     method: Method,
                                     parameters: [String: Any]? = nil,
                                     type: T.Type,
                                     completion: (Result<T, Error>) -> Void) {
       guard let request = createRequest(route: route, method: method, parameters: parameters) else {
            completion(.failure(AppError.unknownError))
            return
        }
        URLSession.shared.dataTask(with: request) { data, response, error in
            var result: Result<Data, Error>?
            if let data = data {
                result = .success(data)
                let responseString = String(data: data, encoding: .utf8) ?? "Could not stringify the data"
                print("The response  is :\n\(responseString)")
            } else if let error = error {
                result = .failure(error)
                print("The error is: \(error.localizedDescription)")
            }
            DispatchQueue.main.async {
             //TODO
            }
            
        }.resume()
        
    }
    
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
        urlRequest.addValue("9e43721cd8mshcda865306926f66p103b83jsnc7e578350692", forHTTPHeaderField: "x-rapidapi-key")
        
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

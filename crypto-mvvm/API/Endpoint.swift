//
//  Endpoint.swift
//  crypto-mvvm
//
//  Created by Dwiki Dwiki on 25/10/23.
//

import Foundation

enum Endpoint {
    
    case fetchCoins(url: String = "/v1/cryptocurrency/listings/latest", currency: String = "USD")
    
    var request: URLRequest? {
        guard let url = self.url else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = self.httpMethod
        request.httpBody = self.httpBody
        request.addValue(for: self)
        return request
        
    }
    
    private var url: URL? {
        var components = URLComponents()
        components.scheme = Constants.scheme
        components.host = Constants.baseUrl
        components.port = Constants.port
        components.path = self.path
        components.queryItems = self.queryItems
        return components.url
    }
    
    private var path: String {
        switch self {
        case .fetchCoins(let url, _):
            return url
        }
    }
    
    private var queryItems: [URLQueryItem] {
        switch self {
        case .fetchCoins(_, let currency):
            return [
                URLQueryItem(name: "limit", value: "150"),
                URLQueryItem(name: "sort", value: "market_cap"),
                URLQueryItem(name: "convert", value:  currency),
                URLQueryItem(name: "aux", value: "cmc_rank,max_supply,circulating_supply,total_supply"),
            ]
        }
    }
    
    private var httpMethod: String {
        switch self {
        case .fetchCoins:
            return HTTP.Method.get.rawValue
        }
    }
    
    private var httpBody: Data? {
        switch self {
        case .fetchCoins:
            return nil
        }
    }
}

extension URLRequest {
    
    mutating func addValue(for endpoint: Endpoint) {
        switch endpoint {
        case .fetchCoins:
            self.setValue(HTTP.Headers.Value.applicationJson.rawValue, forHTTPHeaderField: HTTP.Headers.Key.contentType.rawValue)
            self.setValue(Constants.API_KEY, forHTTPHeaderField: HTTP.Headers.Key.apiKey.rawValue)
        }
    }
    
}

//
//  HTTP.swift
//  crypto-mvvm
//
//  Created by Dwiki Dwiki on 25/10/23.
//

import Foundation

enum HTTP {
    
    enum Method: String {
        case get = "GET"
        case post = "POST"
    }
    
    enum Headers {
        
        enum Key: String {
            case contentType = "Content-Type"
            case apiKey = "X-CMC_PRO_API_KEY"
        }
        
        enum Value: String {
            case applicationJson = "application/json"
        }
    }
}

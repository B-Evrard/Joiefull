//
//  APIError.swift
//  Joiefull
//
//  Created by Bruno Evrard on 13/02/2025.
//


enum APIError: Error {
    case invalidResponse(message: String = "An error has occurred.")
    case invalidData(message: String = "An error has occurred.")
    case invalidURL(message: String = "An error has occurred.")
    case genericError(message: String = "An error has occurred.")
    
    var message: String {
        switch self {
        case .invalidResponse(let message),
             .invalidData(let message),
             .invalidURL(let message),
             .genericError(let message):
             return message
        }
    }
    
}

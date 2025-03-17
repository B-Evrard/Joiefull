//
//  Endpoint.swift
//  Joiefull
//
//  Created by Bruno Evrard on 13/02/2025.
//

import Foundation

enum Endpoint  {
    
    case clothes
    
    enum HTTPMethod: String {
        case GET
        case POST
        case PUT
        case DELETE
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .clothes: return .GET
        }
    }
    
    var baseURL: URL {
        URL(string: "https://raw.githubusercontent.com/OpenClassrooms-Student-Center/Cr-ez-une-interface-dynamique-et-accessible-avec-SwiftUI/main/api")!
    }
    
    
    var api: URL {
        switch self {
        case .clothes: return baseURL.appendingPathComponent("clothes.json")
        }
    }

}


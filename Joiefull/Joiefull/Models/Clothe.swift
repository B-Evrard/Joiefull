//
//  Clothe.swift
//  Joiefull
//
//  Created by Bruno Evrard on 13/02/2025.
//

import Foundation

struct Clothe: Decodable {
    
    let id: Int
    let picture: Picture
    let name: String
    let category: ClotheCategory
    let likes: Int
    let price: Double
    let original_price: Double
    
}

struct Picture: Decodable {
    
    let url: String
    let description: String
    
}

enum ClotheCategory: String, Decodable {
    
    case accessories = "ACCESSORIES"
    case bottoms = "BOTTOMS"
    case shoes = "SHOES"
    case tops = "TOPS"
    case unknown = "UNKNOWN"
    
    init(rawValue: String) {
        switch rawValue {
        case "ACCESSORIES": self = .accessories
        case "BOTTOMS": self = .bottoms
        case "SHOES": self = .shoes
        case "TOPS": self = .tops
        default: self = .unknown
        }
    }

    var localized: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
    
}


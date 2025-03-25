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
    var likes: Int
    let price: Double
    let original_price: Double
    
    // To simulate an average note not provided by the API
    var rate: Double {
        get {
            if let savedRate = UserDefaults.standard.value(forKey: "savedRate_\(id)") as? Double {
                return savedRate
            } else {
                let newRate = Double.random(in: 0...5)
                UserDefaults.standard.set(newRate, forKey: "savedRate_\(id)")
                return newRate
            }
        }
    }
        
}

struct Picture: Decodable {
    
    let url: String
    let description: String
}

struct ClotheNote: Codable, Equatable {
    let id: Int
    var rating: Int
    var comment: String
    var favorite: Bool
}

enum ClotheCategory: String, Decodable, Comparable {
    
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
    
    private var sortOrder: Int {
        switch self {
        case .tops: return 0
        case .bottoms: return 1
        case .shoes: return 2
        case .accessories: return 3
        case .unknown: return 4
        }
    }
    
    static func < (lhs: ClotheCategory, rhs: ClotheCategory) -> Bool {
        return lhs.sortOrder < rhs.sortOrder
    }
    
}


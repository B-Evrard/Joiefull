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
    
    
    var rating: Int {
        get { ClotheNotesStorage.shared.getNote(for: id).rating }
        set { ClotheNotesStorage.shared.updateNote(for: id, rating: newValue, comment: comment) }
    }
    
    var comment: String {
        get { ClotheNotesStorage.shared.getNote(for: id).comment }
        set { ClotheNotesStorage.shared.updateNote(for: id, rating: rating, comment: newValue) }
    }
    
}

struct Picture: Decodable {
    
    let url: String
    let description: String
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


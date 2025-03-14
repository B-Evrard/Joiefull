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
    
    
    var rating: Int {
        get { ClotheNotesStorage.shared.getNote(for: id).rating }
        set { ClotheNotesStorage.shared.updateNote(for: id, rating: newValue, comment: comment, favorite: favorite) }
    }
    
    var comment: String {
        get { ClotheNotesStorage.shared.getNote(for: id).comment }
        set { ClotheNotesStorage.shared.updateNote(for: id, rating: rating, comment: newValue, favorite: favorite) }
    }
    
    var favorite: Bool {
        get { ClotheNotesStorage.shared.getNote(for: id).favorite }
        set { ClotheNotesStorage.shared.updateNote(for: id, rating: rating, comment: comment, favorite: newValue) }
    }
    
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
    
    
    // MARK: - Accessibility
    var accessibilityPicture: String {
        return "\(name) mis en favori \(likes) fois avec une moyenne de \(rate.formattedRate()). Son prix est de \(price.formattedPrice()) " +
        "et sont ancien prix est de \(original_price.formattedPrice())"
    }
    
    var accessibilityDescription: String {
        return "\(picture.description)"
    }
    
    var accessibilityRatingInfos: String {
        if (rating == 0) {
            return "Vous n'avez pas encore noté cette pièce"
        }
        else {
            return "Vous avez noté cette pièce \(rating) sur 5"
        }
    }
    
    var accessibilityComment: String {
        if (comment.isEmpty) {
            return "Partagez ici vos impressions sur cette pièce"
        }
        else {
            return comment
        }
    }

        
}

struct Picture: Decodable {
    
    let url: String
    let description: String
}

struct ClotheNote: Codable {
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


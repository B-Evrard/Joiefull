//
//  ClotheDisplay.swift
//  Joiefull
//
//  Created by Bruno Evrard on 17/03/2025.
//

import Foundation

struct ClotheDisplay: Identifiable {
    var id: Int
    var clothe: Clothe
    var clotheNote: ClotheNote
    
    // MARK: - Accessibility
    var accessibilityPicture: String {
        return "\(clothe.name) mis en favori \(clothe.likes) fois avec une moyenne de \(clothe.rate.formattedRate()). Son prix est de \(clothe.price.formattedPrice()) " +
        "et sont ancien prix est de \(clothe.original_price.formattedPrice())"
    }
    
    var accessibilityDescription: String {
        return "\(clothe.picture.description)"
    }
    
    var accessibilityRatingInfos: String {
        return clotheNote.rating > 0 ? "Vous avez noté cette pièce \(clotheNote.rating) sur 5" : "Vous n'avez pas encore noté cette pièce"
    }
    
    var accessibilityComment: String {
        return clotheNote.comment.isEmpty ? "Partagez ici vos impressions sur cette pièce" : "Votre commentaire : \(clotheNote.comment)"
    }
}


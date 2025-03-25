//
//  descriptionView.swift
//  Joiefull
//
//  Created by Bruno Evrard on 24/02/2025.
//

import SwiftUI
struct DescriptionView: View {
    
    let clotheDisplay: ClotheDisplay
    
    var body: some View {
        
        Text(clotheDisplay.clothe.picture.description)
        .font(DisplayParamFactory.clotheDetailParam.descriptionFont)
        .limitedDynamicTypeSize()
        .lineLimit(3)
        .multilineTextAlignment(.leading)
        .frame(maxWidth: .infinity, alignment: .leading)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(clotheDisplay.accessibilityDescription)
    }
}

#Preview {
    let category: ClotheCategory = .bottoms
    let clothe = Clothe(
        id: 10,
        picture: Picture(url: "https://raw.githubusercontent.com/OpenClassrooms-Student-Center/Cr-ez-une-interface-dynamique-et-accessible-avec-SwiftUI/main/img/bottoms/1.jpg", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"),
        name: "Jean pour femme",
        category: category,
        likes: 10,
        price: 10.50,
        original_price: 15
    )
    let clotheDisplay = clothe.toDisplayModel(clotheNote: nil)
    DescriptionView(clotheDisplay: clotheDisplay)
}


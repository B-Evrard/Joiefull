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
        .accessibilityScaledFont(size: DisplayParamFactory.clotheDetailParam.descriptionFontSize)
        .lineLimit(3)
        .truncationMode(.tail)
        .multilineTextAlignment(.leading)
        .frame(maxWidth: .infinity, alignment: .leading)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(clotheDisplay.accessibilityDescription)
    }
}

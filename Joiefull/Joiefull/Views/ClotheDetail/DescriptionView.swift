//
//  descriptionView.swift
//  Joiefull
//
//  Created by Bruno Evrard on 24/02/2025.
//

import SwiftUI
struct DescriptionView: View {
    
    let clothe: Clothe
    
    var body: some View {
        
        Text(clothe.picture.description)
        .accessibilityScaledFont(size: DisplayParamFactory.clotheDetailParam.descriptionFontSize)
        .lineLimit(3)
        .truncationMode(.tail)
        .multilineTextAlignment(.leading)
        .frame(maxWidth: .infinity, alignment: .leading)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(clothe.accessibilityDescription)
    }
}

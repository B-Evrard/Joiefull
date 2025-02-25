//
//  descriptionView.swift
//  Joiefull
//
//  Created by Bruno Evrard on 24/02/2025.
//

import SwiftUI
struct DescriptionView: View {
    
    let clothe: Clothe
    
    let fontSize: CGFloat
    let starWidth: CGFloat
    let starHeight: CGFloat
    
    var body: some View {
        
        Text(clothe.picture.description)
        .font(.system(size: fontSize))
        .lineLimit(3)
        .truncationMode(.tail)
        .multilineTextAlignment(.leading)
        .frame(maxWidth: .infinity, alignment: .leading) 
    }
}

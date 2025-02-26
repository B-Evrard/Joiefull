
//
//  infosView.swift
//  Joiefull
//
//  Created by Bruno Evrard on 24/02/2025.
//

import SwiftUI
struct InfosView: View {
    
    let clothe: Clothe
    
    let fontSize: CGFloat
    let starWidth: CGFloat
    let starHeight: CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            HStack {
                Text(clothe.name)
                    .font(.system(size: fontSize, weight: .semibold))
                    .lineLimit(1)
                    .truncationMode(.tail)
                Spacer()
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: starWidth, height: starHeight)
                    .foregroundColor(Color("OrangeJoiefull"))
                Text("4.3")
                    .font(.system(size: fontSize))
                    
            }
            HStack {
                Text(clothe.price.formattedPrice())
                    .font(.system(size: fontSize))
                Spacer()
                Text(clothe.original_price.formattedPrice())
                    .font(.system(size: fontSize))
                    .strikethrough(true)
            }
        }
    }
}


//
//  infosView.swift
//  Joiefull
//
//  Created by Bruno Evrard on 24/02/2025.
//

import SwiftUI
struct InfosView: View {
    
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    let clothe: Clothe
    let displayParam : DisplayParam.Type
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            HStack {
                Text(clothe.name)
                    .accessibilityScaledFont(size: displayParam.infosFontSize, semiBold: true)
                    .fontWeight(.bold)
                   .lineLimit(nil)
                   .frame(maxWidth: .infinity, alignment: .leading)
                //.truncationMode(.tail)
//                    .accessibilityScaledFrame(
//                        dynamicTypeSize: dynamicTypeSize,
//                        width: 140,
//                        alignment: .leading
//                        
//                    )
                    //.frame(maxWidth: 147.50, alignment: .leading)
                    Spacer()
                Image(systemName: "star.fill")
                    .resizable()
                    .accessibilityScaledFrame(
                        dynamicTypeSize: dynamicTypeSize,
                        width: displayParam.starWidth ,
                        height: displayParam.starHeight
                    )
                    .foregroundColor(Color("OrangeJoieFull"))
                Text(clothe.rate.formattedRate())
                    .accessibilityScaledFont(size: displayParam.infosFontSize)
            }
            
            HStack {
                Text(clothe.price.formattedPrice())
                    .accessibilityScaledFont(size: displayParam.infosFontSize)
                Spacer()
                Text(clothe.original_price.formattedPrice())
                    .accessibilityScaledFont(size: displayParam.infosFontSize)
                    .strikethrough(true)
            }
            
        }.padding(.horizontal,5)
        
        
    }
}

#Preview {
    
    let category: ClotheCategory = .bottoms
    let clothe = Clothe(
        id: 1,
        picture: Picture(url: "https://raw.githubusercontent.com/OpenClassrooms-Student-Center/Cr-ez-une-interface-dynamique-et-accessible-avec-SwiftUI/main/img/bottoms/1.jpg", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"), name: "Jean pourjkhkjkjhkhkhkhkjh femme",
        category: category,
        likes: 100,
        price: 44.99,
        original_price: 59.99
    )
    
    InfosView(clothe: clothe, displayParam: DisplayParamFactory.clotheDetailParam)
}
    

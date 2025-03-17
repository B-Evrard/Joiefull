//
//  ClotheRowView.swift
//  Joiefull
//
//  Created by Bruno Evrard on 13/02/2025.
//

import SwiftUI

struct ClotheRowView: View {
    
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    @Binding var clothe: Clothe
    let param: DisplayParam.Type
    
    
    var body: some View {
        VStack {
            PictureView(
                clothe: $clothe,
                displayParam: param
            )
            .accessibilityScaledFrame(dynamicTypeSize: dynamicTypeSize, width: param.pictureWidth)
            InfosView(
                clothe: clothe,
                displayParam: param
            )
        }
        .accessibilityScaledFrame(dynamicTypeSize: dynamicTypeSize, width: param.pictureWidth)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(clothe.accessibilityPicture)
        .accessibilityHint("Toucher 2 fois rapidement pour afficher le détail")
    }
}


#Preview {
    let category: ClotheCategory = .bottoms
    let clotheNote = ClotheNote(id: 1, rating: 0, comment: "", favorite: false)
    let clothe = Clothe(
        id: 1,
        picture: Picture(url: "https://raw.githubusercontent.com/OpenClassrooms-Student-Center/Cr-ez-une-interface-dynamique-et-accessible-avec-SwiftUI/main/img/bottoms/1.jpg", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"), name: "Jean pour femme",
        category: category,
        likes: 100,
        price: 44.99,
        original_price: 59.99,
        clotheNote: clotheNote
    )
    
    ClotheRowView(clothe: .constant(clothe), param: ClotheRowParamIpad.self)
}

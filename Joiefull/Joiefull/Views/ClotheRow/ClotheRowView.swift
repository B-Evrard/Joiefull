//
//  ClotheRowView.swift
//  Joiefull
//
//  Created by Bruno Evrard on 13/02/2025.
//

import SwiftUI

struct ClotheRowView: View {
    
    let clothe: Clothe
    let param: DisplayParam.Type
    
    
    var body: some View {
        VStack {
            PictureView(
                clothe: clothe,
                pictureWidth: param.pictureWidth,
                pictureHeight: param.pictureHeight,
                notationWidth: param.notationWidth,
                notationHeight: param.notationHeight,
                fontSizeNotation: param.fontSizeNotation,
                heartWidth: param.heartWidth,
                heartHeight: param.heartHeight,
                isDetail: false
            )
            .frame(width: param.pictureWidth)
            .accessibilityElement(children: .combine)
            .accessibilityLabel("\(clothe.name) mis en favori \(clothe.likes) fois")
            
            InfosView(clothe: clothe, fontSize: param.fontSize, starWidth: param.starWidth, starHeight: param.starHeight)
            .accessibilityElement(children: .combine)
            .accessibilityLabel("\(clothe.name) mis en favori \(clothe.likes) fois")
            
        }
        .frame(width: param.pictureWidth)
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
    
    ClotheRowView(clothe: clothe, param: ClotheRowParamIpad.self)
}

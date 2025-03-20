//
//  notationView.swift
//  Joiefull
//
//  Created by Bruno Evrard on 21/02/2025.
//

import SwiftUI

struct NotationView: View {
    
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    @Binding var clotheDisplay: ClotheDisplay
    var displayParam : DisplayParam.Type
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
        }
        HStack(alignment: .center) {
            
            if (displayParam.isDetail && clotheDisplay.clotheNote.favorite) {
                Image(systemName: "heart.fill")
                    .resizable()
                    .frame(width: displayParam.heartWidth * dynamicTypeSize.scaleFactor, height: displayParam.heartHeight * dynamicTypeSize.scaleFactor)
                    .foregroundColor(Color("OrangeJoieFull"))
            } else {
                Image(systemName: "heart")
                    .resizable()
                    .frame(width: displayParam.heartWidth * dynamicTypeSize.scaleFactor, height: displayParam.heartHeight * dynamicTypeSize.scaleFactor)
            }
            
            Text("\(clotheDisplay.clothe.likes)")
                .font(displayParam.heartFont)
                .foregroundColor(.black)
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 10)
        .background(Color.red)
        .cornerRadius(50)
        .offset(x: -10, y: -10)
        .accessibilityElement(children: .combine)
        .accessibilityHidden(displayParam.isDetail ? false : true)
        .accessibilityLabel("test de label")
        .accessibilityHint("Toucher 1 fois pour mettre en favori")
        .onTapGesture {
            guard displayParam.isDetail else { return }
            clotheDisplay.clotheNote.favorite.toggle()
            clotheDisplay.clothe.likes += clotheDisplay.clotheNote.favorite ? 1 : -1
        }
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
    NotationView(clotheDisplay: .constant(clotheDisplay), displayParam: DisplayParamFactory.clotheRowParam)
    
}


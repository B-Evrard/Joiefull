//
//  notationView.swift
//  Joiefull
//
//  Created by Bruno Evrard on 21/02/2025.
//

import SwiftUI

struct NotationView: View {
    
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    @Binding var clothe: Clothe
    let displayParam : DisplayParam.Type
    var body: some View {
        HStack{
            if displayParam.isDetail && clothe.favorite {
                Image(systemName: "heart.fill")
                    .resizable()
                    .accessibilityScaledFrame(dynamicTypeSize: dynamicTypeSize, width: displayParam.heartWidth, height: displayParam.heartHeight)
                    .foregroundColor(Color("OrangeJoieFull"))
            } else {
                Image(systemName: "heart")
                    .resizable()
                    .accessibilityScaledFrame(dynamicTypeSize: dynamicTypeSize, width: displayParam.heartWidth, height: displayParam.heartHeight)
            }
            
            Text("\(clothe.likes)")
                .accessibilityScaledFont(size: displayParam.heartFontSize)
                .foregroundColor(.black)
        }
        .accessibilityScaledFrame(dynamicTypeSize: dynamicTypeSize, width: displayParam.notationWidth, height: displayParam.notationHeight)
        .background(Color.white)
        .cornerRadius(50)
        .offset(x: -10, y: -10)
        .accessibilityElement(children: .combine)
        .accessibilityHidden(true)
        .onTapGesture {
            guard displayParam.isDetail else { return }
            clothe.favorite.toggle()
            clothe.likes += clothe.favorite ? 1 : -1
        }
    }
}



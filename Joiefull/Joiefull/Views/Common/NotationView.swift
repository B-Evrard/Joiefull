//
//  notationView.swift
//  Joiefull
//
//  Created by Bruno Evrard on 21/02/2025.
//

import SwiftUI

struct NotationView: View {
    
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    let likes: Int
    let displayParam : DisplayParam.Type
    
    var body: some View {
        HStack{
            Image(systemName: "heart")
                .resizable()
                .accessibilityScaledFrame(dynamicTypeSize: dynamicTypeSize, width: displayParam.heartWidth, height: displayParam.heartHeight)
            
            Text("\(likes)")
                .accessibilityScaledFont(size: displayParam.heartFontSize)
                .foregroundColor(.black)
        }
        .accessibilityScaledFrame(dynamicTypeSize: dynamicTypeSize, width: displayParam.notationWidth, height: displayParam.notationHeight)
        .background(Color.white)
        .cornerRadius(50)
        .offset(x: -10, y: -10)
        .accessibilityElement(children: .combine)
        .accessibilityHidden(true)
    }
}



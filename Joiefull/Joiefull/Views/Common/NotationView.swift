//
//  notationView.swift
//  Joiefull
//
//  Created by Bruno Evrard on 21/02/2025.
//

import SwiftUI

struct NotationView: View {
    
    let likes: Int
    let displayParam : DisplayParam.Type
    
    var dynamicFont: Font {
        if displayParam.self.isIpad {
            return displayParam.isDetail ? .title3 : .subheadline
        } else {
            return displayParam.isDetail ? .body : .subheadline
        }
    }
    
    var body: some View {
        HStack{
            Image(systemName: "heart")
                .resizable()
                .accessibilityScaledFrame(width: displayParam.heartWidth, height: displayParam.heartHeight)
            
            Text("\(likes)")
                .font(dynamicFont)
                .limitedDynamicTypeSize()
                .foregroundColor(.black)
        }
        .accessibilityScaledFrame(width: displayParam.notationWidth, height: displayParam.notationHeight)
        .background(Color.white)
        .cornerRadius(50)
        .offset(x: -10, y: -10)
        .accessibilityElement(children: .combine)
        .accessibilityHidden(true)
    }
}



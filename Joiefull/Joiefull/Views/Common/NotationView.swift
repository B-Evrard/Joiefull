//
//  notationView.swift
//  Joiefull
//
//  Created by Bruno Evrard on 21/02/2025.
//

import SwiftUI

struct NotationView: View {
    
    let likes: Int
    let width: CGFloat
    let height: CGFloat
    let fontSize: CGFloat
    let heartWidth: CGFloat
    let heartHeight: CGFloat
    
    var body: some View {
        HStack{
            Image(systemName: "heart")
                .resizable()
                .accessibilityScaledFrame(width: heartWidth, height: heartHeight)
            
            Text("\(likes)")
                .font(Font.system(size: UIFontMetrics.default.scaledValue(for: fontSize)))
                .dynamicTypeSize(.xSmall ... .accessibility3)
                .foregroundColor(.black)
        }
        .accessibilityScaledFrame(width: width, height: height)
        .background(Color.white)
        .cornerRadius(50)
        .offset(x: -10, y: -10)
        .accessibilityElement(children: .combine)
        .accessibilityHidden(true)
    }
}



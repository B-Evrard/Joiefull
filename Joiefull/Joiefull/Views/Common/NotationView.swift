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
                .frame(width: heartWidth, height: heartHeight)
            
            Text("\(likes)")
                .font(.system(size: fontSize))
                .foregroundColor(.black)
        }
        .frame(width: width, height: height)
        .background(Color.white)
        .cornerRadius(50)
        .offset(x: -10, y: -10)
    }
}



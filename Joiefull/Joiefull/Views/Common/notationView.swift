//
//  notationView.swift
//  Joiefull
//
//  Created by Bruno Evrard on 21/02/2025.
//

import SwiftUI

struct notationView: View {
    let likes: Int
    
    var body: some View {
        HStack{
            Image(systemName: "heart")
                .resizable()
                .frame(width: 14, height: 12)
            
            Text("\(likes)")
                .font(.custom("OpenSans-SemiBold", size: 14))
                .foregroundColor(.black)
        }
        .frame(width: 51, height: 27)
        .background(Color.white)
        .cornerRadius(10)
        .offset(x: -10, y: -10)
    }
}



//
//  notationView.swift
//  Joiefull
//
//  Created by Bruno Evrard on 21/02/2025.
//

import SwiftUI

struct NotationView: View {
    
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    //@ObservedObject var viewModel: ClotheDetailViewModel
    @State var clothe : Clothe
    
    let displayParam : DisplayParam.Type
    
    var body: some View {
        HStack{
            
            Image(systemName: (displayParam.isDetail && clothe.favorite) ? "heart.fill" : "heart")
                .resizable()
                .accessibilityScaledFrame(dynamicTypeSize: dynamicTypeSize, width: displayParam.heartWidth, height: displayParam.heartHeight)
                .foregroundColor((displayParam.isDetail && clothe.favorite) ? .yellow : .white)
            
            Image(systemName: "heart")
                .resizable()
                .accessibilityScaledFrame(dynamicTypeSize: dynamicTypeSize, width: displayParam.heartWidth, height: displayParam.heartHeight)
            
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



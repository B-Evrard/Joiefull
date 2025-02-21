//
//  ClotheDetailView.swift
//  Joiefull
//
//  Created by Bruno Evrard on 18/02/2025.
//

import SwiftUI

struct ClotheDetailView: View {
    
    let clothe: Clothe
    
    let pictureWidth: CGFloat = 361
    let pictureHeight: CGFloat = 431
    
    var body: some View {
        AsyncImage(url: URL(string: clothe.picture.url)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: pictureWidth, height: pictureHeight)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                
            case .failure:
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: pictureWidth, height: pictureHeight)
                    .foregroundColor(.gray)
                
            @unknown default:
                EmptyView()
            }
        }
        .overlay(
            notationView(likes: clothe.likes),
            alignment: .bottomTrailing
        )
    }
}

#Preview {
    //ClotheDetailView()
}

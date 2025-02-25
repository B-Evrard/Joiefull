//
//  ClotheRowView.swift
//  Joiefull
//
//  Created by Bruno Evrard on 13/02/2025.
//

import SwiftUI

struct ClotheRowView: View {
    
    let clothe: Clothe
    
    let pictureWidth: CGFloat
    let pictureHeight: CGFloat
    let fontSize: CGFloat
    let starWidth: CGFloat
    let starHeight: CGFloat
    
    let notationWidth: CGFloat = 51
    let notationHeight: CGFloat = 27
    let fontSizeNotation: CGFloat = 14
    let heartWidth: CGFloat = 14
    let heartHeight: CGFloat = 12
    
    var body: some View {
        VStack {
            ZStack {
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
                    NotationView(likes: clothe.likes, width: notationWidth, height: notationHeight, fontSize: fontSizeNotation, heartWidth: heartWidth, heartHeight: heartHeight),
                    alignment: .bottomTrailing
                )
                
            }
            InfosView(clothe: clothe, fontSize: fontSize, starWidth: starWidth, starHeight: starHeight)
        }
        .frame(width: pictureWidth)
        
    }
}

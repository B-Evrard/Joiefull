//
//  PictureView.swift
//  Joiefull
//
//  Created by Bruno Evrard on 26/02/2025.
//

import SwiftUI
struct PictureView: View {
    
    let clothe: Clothe
    
    let pictureWidth: CGFloat
    let pictureHeight: CGFloat
    let notationWidth: CGFloat
    let notationHeight: CGFloat
    let fontSizeNotation: CGFloat
    let heartWidth: CGFloat
    let heartHeight: CGFloat
    
    var body: some View {
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
                NotationView(
                    likes: clothe.likes,
                    width: notationWidth,
                    height: notationHeight,
                    fontSize: fontSizeNotation,
                    heartWidth: heartWidth,
                    heartHeight: heartHeight
                ),
                alignment: .bottomTrailing
            )
            
        }
        
    }
}


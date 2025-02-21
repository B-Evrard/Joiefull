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
                    notationView(likes: clothe.likes),
                    alignment: .bottomTrailing
                )
            }
            VStack  {
                HStack {
                    Text(clothe.name)
                        .font(.custom("OpenSans-SemiBold",  size: fontSize))
                        .lineLimit(1)
                        .truncationMode(.tail)
                    Spacer()
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: starWidth, height: starHeight)
                        .foregroundColor(Color("OrangeJoiefull"))
                    Text("4.3")
                        .font(.custom("OpenSans-Regular", size: fontSize))
                }
                
                HStack {
                    Text(clothe.price.formattedPrice())
                        .font(.custom("OpenSans-Regular", size: fontSize))
                    Spacer()
                    Text(clothe.original_price.formattedPrice())
                        .font(.custom("OpenSans-Regular", size: fontSize))
                        .strikethrough(true)
                }
                
            }
            
        }
        .frame(width: pictureWidth)
        
    }
}

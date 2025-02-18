//
//  ClotheRowView.swift
//  Joiefull
//
//  Created by Bruno Evrard on 13/02/2025.
//

import SwiftUI

struct ClotheRowView: View {
    
    var clothe: Clothe
    
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
                            .frame(width: 198, height: 198)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                        
                        
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
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
                        .font(.custom("OpenSans-SemiBold",  size: 14))
                        .lineLimit(1) 
                        .truncationMode(.tail)
                    Spacer()
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 12, height: 12)
                        .foregroundColor(Color("OrangeJoiefull"))
                    Text("4.3")
                        .font(.custom("OpenSans-Regular", size: 14))
                }
                
                HStack {
                    Text(clothe.price.formattedPrice())
                        .font(.custom("OpenSans-Regular", size: 14))
                    Spacer()
                    Text(clothe.original_price.formattedPrice())
                        .font(.custom("OpenSans-Regular", size: 14))
                        .strikethrough(true)
                }
                
            }
            
        }
        .frame(width: 198)
        
        
        
    }
}

struct notationView: View {
    var likes: Int
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

#Preview {
    let clotheRowView = Clothe(
        id: 1,
        picture: Picture(
            url:"https://rawgithubusercontentcom/OpenClassrooms-Student-Center/Cr-ez-une-interface-dynamique-et-accessible-avec-SwiftUI/main/img/tops/4.jpg",
            description: "description"
        ),
        name: "Test",
        category: ClotheCategory.accessories,
        likes: 10,
        price: 50,
        original_price: 60
    )
    ClotheRowView(clothe: clotheRowView)
}



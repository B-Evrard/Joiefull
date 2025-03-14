//
//  RatingAndNoteView.swift
//  Joiefull
//
//  Created by Bruno Evrard on 24/02/2025.
//

import SwiftUI

struct RatingAndNoteView: View {
    
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    let user: User
    @ObservedObject var viewModel: ClotheDetailViewModel
    @State private var isEditing: Bool = false
    
    var body: some View {
        VStack (spacing: 20) {
            HStack(spacing: 10){
                Image(User.mock.profilePicture)
                    .resizable()
                    .scaledToFill()
                    .accessibilityScaledFrame(
                        dynamicTypeSize: dynamicTypeSize,
                        width: 42.91 ,
                        height: 39
                    )
                    .clipShape(Circle())
                    .clipped()
                
                RatingView(
                    rating: $viewModel.clothe.rating,
                    starNotationWidth: DisplayParamFactory.clotheDetailParam.starNotationWidth ,
                    starNotationHeight: DisplayParamFactory.clotheDetailParam.starNotationHeight
                )
                
                Spacer()
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(viewModel.clothe.accessibilityRatingInfos)
            
            ZStack(alignment: .topLeading) {
                
                TextEditor(text: $viewModel.clothe.comment)
                    .accessibilityScaledFrame(dynamicTypeSize: dynamicTypeSize, height: DisplayParamFactory.clotheDetailParam.commentHeight)
                    .padding(8)
                    .scrollContentBackground(.hidden)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth:1.5)
                        
                    )
                    .accessibilityScaledFont(size: DisplayParamFactory.clotheDetailParam.descriptionFontSize)
                
                if (viewModel.clothe.comment.isEmpty) {
                    Text("Partagez ici vos impressions sur cette pièce")
                        .foregroundColor(Color(.systemGray2))
                        .padding(.top, 15)
                        .padding(.leading, 15)
                        .opacity(50)
                        .allowsHitTesting(false)
                        .accessibilityScaledFont(size: DisplayParamFactory.clotheDetailParam.descriptionFontSize)
                }
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(viewModel.clothe.accessibilityComment)
            
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(viewModel.clothe.accessibilityComment)
        .accessibilityScaledFrame(dynamicTypeSize: dynamicTypeSize, width: DisplayParamFactory.clotheDetailParam.pictureWidth)
        
    }
        
}

#Preview {
    
    let category: ClotheCategory = .bottoms
    let clothe = Clothe(
        id: 1,
        picture: Picture(url: "https://raw.githubusercontent.com/OpenClassrooms-Student-Center/Cr-ez-une-interface-dynamique-et-accessible-avec-SwiftUI/main/img/bottoms/1.jpg", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"), name: "Jean pour femme",
        category: category,
        likes: 100,
        price: 44.99,
        original_price: 59.99
    )
    
    let viewModel=ClotheDetailViewModel(clothe: clothe)
    RatingAndNoteView(user: User.mock, viewModel: viewModel)
}

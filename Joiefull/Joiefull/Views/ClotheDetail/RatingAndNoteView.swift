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
            
            ScrollView(.horizontal, showsIndicators: false) {
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
                        clotheNote: $viewModel.clotheDisplay.clotheNote,
                        starNotationWidth: DisplayParamFactory.clotheDetailParam.starNotationWidth ,
                        starNotationHeight: DisplayParamFactory.clotheDetailParam.starNotationHeight
                    )
                    
                    Spacer()
                }
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(viewModel.clotheDisplay.clotheNote.accessibilityRatingInfos)
            }
            ZStack(alignment: .topLeading) {
                
                TextEditor(text: $viewModel.clotheDisplay.clotheNote.comment)
                    .accessibilityScaledFrame(dynamicTypeSize: dynamicTypeSize, height: DisplayParamFactory.clotheDetailParam.commentHeight)
                    .padding(8)
                    .scrollContentBackground(.hidden)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth:1.5)
                        
                    )
                    .accessibilityScaledFont(size: DisplayParamFactory.clotheDetailParam.descriptionFontSize)
                    
                
                if (viewModel.clotheDisplay.clotheNote.comment.isEmpty) {
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
            .accessibilityLabel(viewModel.clotheDisplay.clotheNote.accessibilityComment)
        }
        
        .accessibilityScaledFrame(dynamicTypeSize: dynamicTypeSize, width: DisplayParamFactory.clotheDetailParam.pictureWidth)
    }
    
}

#Preview {
    
    
}


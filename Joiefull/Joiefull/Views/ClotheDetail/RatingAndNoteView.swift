//
//  RatingAndNoteView.swift
//  Joiefull
//
//  Created by Bruno Evrard on 24/02/2025.
//

import SwiftUI

struct RatingAndNoteView: View {
    
    let user: User
    @ObservedObject var viewModel: ClotheDetailViewModel
    @State private var isEditing: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            HStack(spacing: 20){
                Image(User.mock.profilePicture)
                    .resizable()
                    .frame(width: 42.91, height: 39)
                    .clipShape(Circle())
                
                RatingView(
                    rating: $viewModel.clothe.rating,
                    starNotationWidth: DisplayParamFactory.clotheDetailParam.starNotationWidth ,
                    starNotationHeight: DisplayParamFactory.clotheDetailParam.starNotationHeight
                )
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(viewModel.clothe.accessibilityRatingInfos)
            
            ZStack(alignment: .topLeading) {
                
                TextEditor(text: $viewModel.clothe.comment)
                    .accessibilityScaledFrame(width:DisplayParamFactory.clotheDetailParam.pictureWidth, height: 50)
                    .padding(8)
                    .background(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1))
                    .font(Font.system(size: UIFontMetrics.default.scaledValue(for: DisplayParamFactory.clotheDetailParam.fontSize)))
                    .dynamicTypeSize(.xSmall ... .accessibility3)
                
                if (viewModel.clothe.comment.isEmpty) {
                    Text("Partagez ici vos impressions sur cette pièce")
                        .foregroundColor(Color(.systemGray2))
                        .padding(.top, 15)
                        .padding(.leading, 15)
                        .opacity(50)
                        .font(Font.system(size: UIFontMetrics.default.scaledValue(for: DisplayParamFactory.clotheDetailParam.fontSize)))
                        .dynamicTypeSize(.xSmall ... .accessibility3)
                        .allowsHitTesting(false)
                }
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(viewModel.clothe.accessibilityComment)
        }
    }
}

#Preview {
    
    // RatingAndNoteView(user: User.mock)
}
